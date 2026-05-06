FROM gcr.io/distroless/base-debian12

WORKDIR /

COPY app /app

USER nonroot:nonroot

EXPOSE 80

ENTRYPOINT ["/app"]
