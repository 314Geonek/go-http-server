# Zad 3
Należy podać polecenia niezbędne do: 

* Zbudowania opracowanego obrazu kontenera,
```
docker buildx build -t <YOUR-DOCKERHUB-REPOSITORY> --platform linux/amd64,linux/arm/v7,linux/arm64/v8 --push .
```
* Uruchomienia kontenera na podstawie zbudowanego obrazu
```
docker run –name <ContainerName> <YOUR-DOCKERHUB-REPOSITORY> 
```
* Sposobu uzyskania informacji, które wygenerował serwer w trakcie uruchamiana kontenera
```
docker logs <ContainerName>
```
* Sprawdzenia, ile warstw posiada zbudowany obraz
```
docker history -q imageName | wc -l     
```

# O moim rozwiązaniu

W swiom rozwiązaniu zadań opracowałem taki plik .github/workflows/frontend.yml który pozwolił mi zbudowany obraz i umieścić go na dockerhub, a także na ghcr poprzez wykorzystanie github actions 

Krótko o konfiguracji ghcr: 
* generujemy secret z poziomu ustawień githuba z uprawnieniami do:
```
read:packages
write:packages
delete:packages
```
* logowanie odbywa się poprzez zalogowanie poprzez: 
```
export CR_PAT=YOUR_TOKEN
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```
* następnie możemy pobrać obraz 
```
 docker pull ghcr.io/314geonek/go-http-server
```
* lub z repozytorium dockerhub
```
docker pull 314geonek/go-http-server:latest
```


