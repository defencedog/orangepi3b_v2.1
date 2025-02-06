## Compiled binary

Replace `mv` & `cp` bash commands with binaries supporting progress bar

### Github link

>https://github.com/jarun/advcpmv


### Direct use**
```
sudo mv ./advcpmv/advcp /usr/local/bin/
sudo mv ./advcpmv/advmv /usr/local/bin/
echo -e 'alias cp=\x27/usr/local/bin/advcp -g\x27' >> ~/.bashrc
echo -e 'alias mv=\x27/usr/local/bin/advmv -g\x27' >> ~/.bashrc
```

** 
> https://github.com/jarun/advcpmv/issues/41#issue-2836544536
