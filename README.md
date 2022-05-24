# Zad 3
Należy podać polecenia niezbędne do:

*Zbudowania opracowanego obrazu kontenera,
```
docker buildx build -t <YOUR-DOCKERHUB-REPOSITORY> --platform linux/amd64,linux/arm/v7,linux/arm64/v8 --push .
```
*Uruchomienia kontenera na podstawie zbudowanego obrazu
```
docker run –name <ContainerName> <YOUR-DOCKERHUB-REPOSITORY> 
```
*Sposobu uzyskania informacji, które wygenerował serwer w trakcie uruchamiana kontenera
```
docker logs <ContainerName>
```
*Sprawdzenia, ile warstw posiada zbudowany obraz
```
docker history -q imageName | wc -l     
```
