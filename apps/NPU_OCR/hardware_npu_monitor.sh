#!/usr/bin/env bash
# ==============================================================================
# Orange Pi 3B (Rockchip RK3566) Hardware Monitor - Mobile Termux Edition
# Compact, ultra-clean telemetry dashboard (fits <38 cols portrait mobile)
# ==============================================================================

REFRESH_INTERVAL=1
RUN_ONCE=false

if [ "$1" = "--once" ] || [ "$1" = "-1" ]; then
    RUN_ONCE=true
elif [ -n "$1" ] && [ "$1" -eq "$1" ] 2>/dev/null; then
    REFRESH_INTERVAL="$1"
fi

# ANSI Styling
BOLD="\033[1m"
DIM="\033[2m"
RESET="\033[0m"
CYAN="\033[36m"
GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
BLUE="\033[34m"
MAGENTA="\033[35m"
WHITE="\033[37m"
GRAY="\033[90m"

# Render colored progress bar (10 blocks = 12 chars [█████░░░░░])
draw_bar() {
    local val=$1
    local width=10
    local filled=$(( (val * width) / 100 ))
    [ "$filled" -gt "$width" ] && filled=$width
    [ "$filled" -lt 0 ] && filled=0
    local empty=$(( width - filled ))

    local color="$GREEN"
    if [ "$val" -ge 80 ]; then
        color="$RED"
    elif [ "$val" -ge 50 ]; then
        color="$YELLOW"
    fi

    local bar=""
    for ((i=0; i<filled; i++)); do bar="${bar}█"; done
    for ((i=0; i<empty; i++)); do bar="${bar}░"; done
    printf "${color}[%s]${RESET}" "$bar"
}

# Format milli-Celsius to compact Celsius string with color (e.g. 73.3°C)
format_temp() {
    local raw=$1
    if [ -z "$raw" ] || [ "$raw" -le 0 ]; then
        printf "${GRAY}--.-°C${RESET}"
        return
    fi
    local whole=$((raw / 1000))
    local frac=$(( (raw % 1000) / 100 ))

    local color="$GREEN"
    if [ "$whole" -ge 75 ]; then
        color="$RED"
    elif [ "$whole" -ge 60 ]; then
        color="$YELLOW"
    fi
    printf "${color}%2d.%d°C${RESET}" "$whole" "$frac"
}

# Compact Uptime (e.g. "1d 4h" or "3h 25m")
get_uptime() {
    local up_sec=0
    if [ -f /proc/uptime ]; then
        read -r up_sec _ < /proc/uptime
        up_sec=${up_sec%%.*}
        local d=$((up_sec / 86400))
        local h=$(( (up_sec % 86400) / 3600 ))
        local m=$(( (up_sec % 3600) / 60 ))
        if [ "$d" -gt 0 ]; then
            printf "%dd %dh" "$d" "$h"
        elif [ "$h" -gt 0 ]; then
            printf "%dh %dm" "$h" "$m"
        else
            printf "%dm" "$m"
        fi
    else
        printf "N/A"
    fi
}

# Initial CPU stats
read -r _ u n s id io ir sir st _ < /proc/stat
prev_active=$((u + n + s + ir + sir + st))
prev_total=$((prev_active + id + io))

# Hide cursor during run, restore on exit
trap 'printf "\033[?25h\n"; exit 0' INT TERM EXIT
printf "\033[?25l\033[2J\033[H"

while true; do
    # 1. CPU Usage Calculation
    read -r _ u n s id io ir sir st _ < /proc/stat
    curr_active=$((u + n + s + ir + sir + st))
    curr_total=$((curr_active + id + io))

    diff_active=$((curr_active - prev_active))
    diff_total=$((curr_total - prev_total))

    if [ "$diff_total" -gt 0 ]; then
        cpu_usage=$(( (diff_active * 100) / diff_total ))
    else
        cpu_usage=0
    fi
    prev_active=$curr_active
    prev_total=$curr_total

    # Load average (1 min)
    read -r l1 _ < /proc/loadavg

    # 2. CPU Frequency & Temperature
    raw_cpu_freq=0
    [ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq ] && read -r raw_cpu_freq < /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
    c_ghz=$((raw_cpu_freq / 1000000))
    c_frac=$(( (raw_cpu_freq % 1000000) / 10000 ))
    freq_cpu_str=$(printf "%d.%02dGHz" "$c_ghz" "$c_frac")
    
    raw_soc_temp=0
    [ -f /sys/class/thermal/thermal_zone0/temp ] && read -r raw_soc_temp < /sys/class/thermal/thermal_zone0/temp

    # 3. GPU (Mali-G52)
    gpu_load=0
    if [ -f /sys/devices/platform/fde60000.gpu/devfreq/fde60000.gpu/load ]; then
        read -r gpu_load_raw < /sys/devices/platform/fde60000.gpu/devfreq/fde60000.gpu/load
        gpu_load=${gpu_load_raw%%@*}
        [ -z "$gpu_load" ] && gpu_load=0
    fi
    freq_gpu=0
    if [ -f /sys/devices/platform/fde60000.gpu/devfreq/fde60000.gpu/cur_freq ]; then
        read -r raw_gpu_freq < /sys/devices/platform/fde60000.gpu/devfreq/fde60000.gpu/cur_freq
        freq_gpu=$((raw_gpu_freq / 1000000))
    fi
    raw_gpu_temp=0
    [ -f /sys/class/thermal/thermal_zone1/temp ] && read -r raw_gpu_temp < /sys/class/thermal/thermal_zone1/temp

    # 4. NPU (RK3566 1 TOPS)
    npu_load=0
    if [ -r /sys/kernel/debug/rknpu/load ]; then
        read -r npu_line < /sys/kernel/debug/rknpu/load
        npu_load=${npu_line##* }
        npu_load=${npu_load%%%}
    elif sudo -n true 2>/dev/null; then
        npu_line=$(sudo -n cat /sys/kernel/debug/rknpu/load 2>/dev/null)
        if [[ "$npu_line" =~ NPU[[:space:]]+load:[[:space:]]+([0-9]+)% ]]; then
            npu_load="${BASH_REMATCH[1]}"
        fi
    fi
    freq_npu=0
    if [ -f /sys/class/devfreq/fde40000.npu/cur_freq ]; then
        read -r raw_npu_freq < /sys/class/devfreq/fde40000.npu/cur_freq
        freq_npu=$((raw_npu_freq / 1000000))
    fi

    # 5. Memory (RAM & Swap)
    mem_total_kb=0
    mem_avail_kb=0
    swap_total_kb=0
    swap_free_kb=0
    while read -r key val _; do
        case "$key" in
            MemTotal:) mem_total_kb="$val" ;;
            MemAvailable:) mem_avail_kb="$val" ;;
            SwapTotal:) swap_total_kb="$val" ;;
            SwapFree:) swap_free_kb="$val" ;;
        esac
    done < /proc/meminfo

    mem_total_mb=$((mem_total_kb / 1024))
    mem_avail_mb=$((mem_avail_kb / 1024))
    mem_used_mb=$((mem_total_mb - mem_avail_mb))
    mem_pct=0
    [ "$mem_total_mb" -gt 0 ] && mem_pct=$(( (mem_used_mb * 100) / mem_total_mb ))
    
    r_ugb=$((mem_used_mb / 1024))
    r_ufrac=$(( (mem_used_mb % 1024) * 10 / 1024 ))
    r_tgb=$((mem_total_mb / 1024))
    r_tfrac=$(( (mem_total_mb % 1024) * 10 / 1024 ))
    ram_str=$(printf "%d.%d/%d.%dG" "$r_ugb" "$r_ufrac" "$r_tgb" "$r_tfrac")

    swap_total_mb=$((swap_total_kb / 1024))
    swap_used_mb=$(( (swap_total_kb - swap_free_kb) / 1024 ))
    swap_pct=0
    [ "$swap_total_mb" -gt 0 ] && swap_pct=$(( (swap_used_mb * 100) / swap_total_mb ))
    
    s_ugb=$((swap_used_mb / 1024))
    s_ufrac=$(( (swap_used_mb % 1024) * 10 / 1024 ))
    s_tgb=$((swap_total_mb / 1024))
    s_tfrac=$(( (swap_total_mb % 1024) * 10 / 1024 ))
    swp_str=$(printf "%d.%d/%d.%dG" "$s_ugb" "$s_ufrac" "$s_tgb" "$s_tfrac")

    curr_time=$(date "+%H:%M:%S")
    uptime_fmt=$(get_uptime)

    # ----- Mobile-Optimized Render (Exact Width: 37 Columns) -----
    printf "\033[H"
    
    printf " ${BOLD}${WHITE}Orange Pi 3B${RESET} ${DIM}(RK3566)${RESET}\n"
    printf " ${GRAY}%s · Up: %-5s · Load: %s${RESET}\n" "$curr_time" "$uptime_fmt" "$l1"
    printf "${CYAN}─────────────────────────────────────${RESET}\n"

    # CPU Line: Name(4) %(5) Bar(12) Temp(7) Freq(8) = 36 cols
    printf " ${BOLD}${MAGENTA}CPU${RESET} %3d%% " "$cpu_usage"
    draw_bar "$cpu_usage"
    printf " %b  %-7s\n" "$(format_temp "$raw_soc_temp")" "$freq_cpu_str"

    # NPU Line: Name(4) %(5) Bar(12) Freq(7) Note(8) = 36 cols
    printf " ${BOLD}${YELLOW}NPU${RESET} %3d%% " "$npu_load"
    draw_bar "$npu_load"
    printf " %4dMHz  ${DIM}1 TOPS${RESET}\n" "$freq_npu"

    # GPU Line: Name(4) %(5) Bar(12) Temp(7) Freq(8) = 36 cols
    printf " ${BOLD}${GREEN}GPU${RESET} %3d%% " "$gpu_load"
    draw_bar "$gpu_load"
    printf " %b  %4dMHz\n" "$(format_temp "$raw_gpu_temp")" "$freq_gpu"

    # RAM Line: Name(4) %(5) Bar(12) Used/Tot(9) Free(6) = 36 cols
    printf " ${BOLD}${BLUE}RAM${RESET} %3d%% " "$mem_pct"
    draw_bar "$mem_pct"
    printf " %-8s ${GRAY}%4dM free${RESET}\n" "$ram_str" "$mem_avail_mb"

    # SWP Line (if swap exists)
    if [ "$swap_total_mb" -gt 0 ]; then
        printf " ${BOLD}${BLUE}SWP${RESET} %3d%% " "$swap_pct"
        draw_bar "$swap_pct"
        printf " %-8s\n" "$swp_str"
    fi

    printf "${CYAN}─────────────────────────────────────${RESET}\n"
    printf " ${GRAY}[Ctrl+C] Exit  ·  Refresh: %ds${RESET}\n" "$REFRESH_INTERVAL"
    printf "\033[J"

    if [ "$RUN_ONCE" = true ]; then
        break
    fi
    sleep "$REFRESH_INTERVAL"
done
