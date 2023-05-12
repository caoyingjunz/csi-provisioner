FROM golang:alpine
LABEL maintainers="Kubernetes Authors"
LABEL description="CSI Provisioner"

RUN apk add --no-cache git
RUN go get github.com/caoyingjunz/csi-driver-provisioner/cmd/csi-provisioner
