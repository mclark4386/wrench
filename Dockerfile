from golang:1.7

RUN echo $GOPATH
RUN mkdir -p $GOPATH/src/github.com/mclark4386/wrench
WORKDIR $GOPATH/src/github.com/mclark4386/wrench
ADD . .
RUN go get -t -v ./...
RUN go test ./...
