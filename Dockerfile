FROM golang:1.17-alpine as builder
WORKDIR /app
ENV GOPROXY=https://goproxy.cn
COPY ./go.mod ./
COPY ./go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -ldflags "-s -w" -o csi-provisioner ./cmd/csi-provisioner

FROM busybox as runner
COPY --from=builder /app/csi-provisioner /csi-provisioner
ENTRYPOINT ["/csi-provisioner"]