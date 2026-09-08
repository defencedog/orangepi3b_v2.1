# Geogebra 5.x
This application has built-in java runtime `jre` downloaded from [AZUL](https://www.azul.com/downloads/#zulu) Will not work with `openjdk-8-jre`

Change `.desktop` file to refer to appropriate file locations. x2 entries are to be modified `Exec` & `Icon`

# GeoGebra 5 CAS Native Engine Port for Linux ARM64 (AArch64)

## 1. Problem Description

When running **GeoGebra Classic 5** (e.g., portable or standalone packages like `GeoGebra-Linux-Portable-5-2-857-0`) on **Linux ARM64 / AArch64** (Orange Pi 4A/5, Raspberry Pi 4/5, Rockchip RK3588, Allwinner T527, Apple Silicon Linux, etc.), any symbolic operation in the **CAS (Computer Algebra System)** view fails immediately with:

```text
Sorry something went wrong
```

The underlying GeoGebra log (`/tmp/GeoGebraLog_*.txt`) reveals:

```text
java.lang.NullPointerException: Cannot read field "a" because "<parameter1>" is null
    at org.geogebra.common.m.a.a.a.d.a(Unknown Source)
    at org.geogebra.common.m.a.a.a.c.<init>(Unknown Source)
    at org.geogebra.common.m.a.a.a.a.a(Unknown Source)
    at org.geogebra.common.b.b.d.a(Unknown Source)
```

### Root Cause
1. GeoGebra's CAS subsystem is powered by **Giac** (a computer algebra system developed by Bernard Parisse) connected via SWIG JNI bindings (`javagiac`).
2. The official upstream GeoGebra package bundles only **x86_64** native binaries inside `javagiac-natives-linux-amd64.jar` (`libjavagiac64.so`).
3. On 64-bit Linux (`aarch64`), GeoGebra's native loader (`org.geogebra.desktop.a.a.b`) extracts `libjavagiac64.so` to `/tmp` and attempts `System.load()`. Because the binary is an x86-64 ELF file, the dynamic linker fails (`wrong ELF class: ELFCLASS64`).
4. Native initialization fails silently, the Giac pointer remains `null`, and any algebraic CAS query throws a `NullPointerException`.

---

## 2. Solution Overview

This archive provides native **AArch64 (ARM 64-bit)** compiled shared libraries and drop-in JAR overlays for GeoGebra 5:
- **`lib/libjavagiac.so`**: Native ARM64 shared library compiled against system `libgmp` and `libmpfr` with `-static-libgcc -static-libstdc++`.
- **`lib/libjavagiac-arm64.so` & `libjavagiac64.so`**: Library aliases pointing to the native ARM64 build.
- **`jar/javagiac-natives-linux-amd64.jar`**: Drop-in replacement JAR (referenced by `geogebra.jar`'s `Class-Path` manifest) containing ARM64 `libjavagiac64.so`, `libjavagiac-arm64.so`, and `libjavagiac.so`.
- **`jar/javagiac-natives-linux-aarch64.jar`**: Standalone ARM64 native JAR.
- **`install.sh`**: Automated installer script.

---

## 3. Quick Installation

Run the automated installer:

```bash
cd geogebra-cas-arm64
chmod +x install.sh
./install.sh
```

The installer will:
1. Ensure runtime dependencies (`libgmp10`, `libmpfr6`) are installed.
2. Copy `libjavagiac*.so` into `/usr/local/lib/` and update system cache (`ldconfig`).
3. Detect your GeoGebra installation, back up the original x86_64 JAR to `.orig`, and deploy the ARM64 overlay JAR.
4. Update `geogebra-portable` to include `/usr/local/lib` in `GG_DJAVA_LIBRARY_PATH`.

---

## 4. Manual Installation (If Not Using `install.sh`)

### Step 1: Install runtime dependencies
```bash
sudo apt-get install -y libgmp10 libmpfr6
```

### Step 2: Install native shared library to system
```bash
sudo cp lib/libjavagiac.so /usr/local/lib/
sudo ln -sf /usr/local/lib/libjavagiac.so /usr/local/lib/libjavagiac-arm64.so
sudo ln -sf /usr/local/lib/libjavagiac.so /usr/local/lib/libjavagiac64.so
sudo ldconfig
```

### Step 3: Replace native JAR in GeoGebra
In your GeoGebra directory (e.g. `GeoGebra-Linux-Portable-5-2-857-0/geogebra/`):
```bash
cp jar/javagiac-natives-linux-amd64.jar <path-to-geogebra>/geogebra/javagiac-natives-linux-amd64.jar
```

### Step 4: Ensure Java Library Path (Optional but recommended)
In `<path-to-geogebra>/geogebra-portable`, add:
```bash
export GG_DJAVA_LIBRARY_PATH="/usr/local/lib"
```

---

## 5. Verification

1. Start GeoGebra:
   ```bash
   ./geogebra-portable
   ```
2. Open the **CAS View** (**View** -> **CAS**).
3. Test symbolic computations:
   - `Factor(x^2 - 1)` -> Returns `(x - 1) (x + 1)`
   - `Integral(x^2, x)` -> Returns `1/3 x^3`
   - `Derivative(sin(x) * exp(x), x)` -> Returns `cos(x) exp(x) + sin(x) exp(x)`
   - `Solve(x^2 - 4 = 0, x)` -> Returns `{x = -2, x = 2}`
4. Verify debug log:
   ```bash
   ./geogebra-portable --logLevel=DEBUG --showCAS=true --logFile=/tmp/ggb.log
   grep -i "giac dynamic library" /tmp/ggb.log
   ```
   Output confirms:
   `Giac dynamic library loaded`

---

## 6. How to Build From Source

If you want to recompile the native library yourself:

```bash
# 1. Install build dependencies
sudo apt-get install -y build-essential cmake libgmp-dev libmpfr-dev

# 2. Clone GeoGebra Giac repository
git clone --depth 1 https://github.com/geogebra/giac
cd giac

# 3. Patch CMakeLists.txt to link dynamic gmp/mpfr on Linux ARM64:
# Replace static x86-64 prebuilts with system gmp and mpfr:
sed -i 's/find_static_library(gmp GMP_STATIC \${PREBUILT_DIR}\/linux\/x86-64\/)/set(GMP_STATIC "gmp")/g' CMakeLists.txt
sed -i 's/find_static_library(mpfr MPFR_STATIC \${PREBUILT_DIR}\/linux\/x86-64\/)/set(MPFR_STATIC "mpfr")/g' CMakeLists.txt

# 4. Build shared library (limit -j4 on SBCs for thermals)
mkdir build && cd build
cmake ..
make javagiac -j4

# 5. Output library is at build/libjavagiac.so (already stripped)
```
