# ---------- build stage ----------
FROM golang:1.26-alpine AS builder

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -o app .

# ---------- runtime stage ----------
FROM gcr.io/distroless/base-debian12

WORKDIR /

COPY --from=builder /app/app /app

USER nonroot:nonroot

EXPOSE 80

ENTRYPOINT ["/app"]
