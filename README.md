# dev-machine

- ubuntu 22.04
- dev machine version `0.3.2`

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
docker tag ghcr.io/hw-fsi/dev ghcr.io/hw-fsi/dev:0.3.2
docker push ghcr.io/hw-fsi/dev:0.3.2
```

## run

```bash
docker run --network host --privileged -d -it --name angel -v `pwd`:/root/code -w /root/code ghcr.io/hw-fsi/dev:0.3.2
docker exec -it --detach-keys="ctrl-z,z" angel /bin/zsh
git config --global user.name $your_name
git config --global user.email $your_email
```
