Default [Pinta](https://github.com/PintaProject/Pinta) in the repos is extremely ugly `v1.6.x` & is based on [mono](https://github.com/mono/mono) This is a compiled version `v2.2.2` based on modern UI running under [dotnet8](https://github.com/dotnet/runtime) This is tested under [Armbian](https://github.com/armbian) `jammy` / `noble` releases

```
sudo apt install dotnet-runtime-8.0
7z x pinta_build.7z
cd pinta_build
nano /bin/pinta
# edit this line
> prefix=/usr/local
# move all folder to $PREFIX/local
sudo mv -R * /usr/local
```

Now you can run Pinta! Icon will also be placed on Gnome launcher
