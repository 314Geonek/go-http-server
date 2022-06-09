# AWS Update

Link:
```
http://pfcho-env.eba-txydp3bm.us-east-1.elasticbeanstalk.com/
```
# Zad 3
Należy podać polecenia niezbędne do: 
* Zbudowania opracowanego obrazu kontenera (W moim przypadku odbyło się to poprzez github actions),
```
docker buildx build -t 314geonek/go-http-server:latest --platform linux/amd64,linux/arm/v7,linux/arm64/v8 --push .
```
* Uruchomienia kontenera na podstawie zbudowanego obrazu
```
docker run --name goHttpd -p 8084:8084 <Repository-Name>
```
* Sposobu uzyskania informacji, które wygenerował serwer w trakcie uruchamiana kontenera
```
docker logs goHttpd
```
* Sprawdzenia, ile warstw posiada zbudowany obraz
```
docker history -q <Repository-Name> | wc -l     
```
* gdzie 
```
<Repository-Name> = "314geonek/go-http-server:latest" , "ghcr.io/314geonek/go-http-server"
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
# Uwaga 
Przy uruchomieniu należy pamiętać o zmapowaniu portu 
```
docker run --name goHttpd -p 8084:8084 <Repository-Name>
```
gdzie 
```
<Repository-Name> = "314geonek/go-http-server:latest" , "ghcr.io/314geonek/go-http-server"
```
W projekcie zostal dodany eksport/import cache dzięki czemu build jest znacznie szybszy 
![image](https://user-images.githubusercontent.com/69900955/170118995-fdbfe1d2-f2c2-4637-a490-c7de890ddb9c.png)

