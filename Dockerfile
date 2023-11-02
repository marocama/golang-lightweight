FROM golang as builder
WORKDIR /src

COPY go.mod .
COPY main.go .

RUN go build -o /app

# Segundo estágio
FROM scratch

COPY --from=builder /app .

ENTRYPOINT ["/app"] 