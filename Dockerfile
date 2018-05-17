######################
# Build
FROM instrumentisto/dep as compiler

ENV APP_PATH=/go/src/helloworld

RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

COPY Gopkg.lock Gopkg.lock
COPY Gopkg.toml Gopkg.toml
COPY main.go main.go

RUN dep ensure -v

ENV CGO_ENABLED=0
ENV GOOS=linux

RUN go build -ldflags '-w -s' -a -installsuffix cgo -o helloworld

######################
# Run
FROM scratch

COPY --from=compiler $APP_PATH .

EXPOSE 8080

CMD ["./helloworld"]
