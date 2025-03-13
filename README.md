# dev-machine

version `0.1`

## build

```bash
docker build -t ghcr.io/hw-fsi/dev .
```

## test

```bash
docker run -it --rm -v `pwd`/..:/root/code ghcr.io/hw-fsi/dev /bin/zsh
```

## deploy

```
docker tag ghcr.io/hw-fsi/dev ghcr.io/hw-fsi/dev:0.1
docker push ghcr.io/hw-fsi/dev:0.1 
```

## run

```bash
docker run --privileged -d -it --name angel -v `pwd`:/root/code -w /root/code 
docker exec -it --detach-keys="ctrl-z,z" angel /bin/zsh
git config --global user.name $your_name
git config --global user.email $your_email
```

## doom emacs

``` bash
doom sync -j 128
```
