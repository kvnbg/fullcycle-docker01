FROM golang:1.18-bullseye as build
WORKDIR /usr/src/app
  
COPY app ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags '-s -w' -o main main.go

FROM scratch

COPY --from=build /usr/src/app  .

CMD ["./main"]