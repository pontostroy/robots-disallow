FROM golang:alpine as builder

LABEL org.label-schema.vcs-url="https://github.com/wikiwi/robots-disallow" \
      org.label-schema.vendor=wikiwi.io \
      org.label-schema.name=robots-disallow \
      io.wikiwi.license=MIT
RUN apk update && apk add git
RUN go get -d -v github.com/jessevdk/go-flags
COPY . /go/src/app
WORKDIR /go/src/app
#RUN go build -ldflags="-w -s" main.go
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /go/bin/robots-disallow
FROM scratch
# Copy our static executable
COPY --from=builder /go/bin/robots-disallow /robots-disallow
EXPOSE 9070
ENTRYPOINT ["/robots-disallow"]
