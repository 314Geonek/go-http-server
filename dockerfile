FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./
copy index.html ./index.html
RUN go build -o /docker-gs-ping

FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /docker-gs-ping /docker-gs-ping
copy index.html /index.html
EXPOSE 1234

USER nonroot:nonroot

ENTRYPOINT ["/docker-gs-ping"]
