FROM golang:1.21-alpine AS builder

WORKDIR /app

COPY main.go /app/main.go

RUN go build -o fullcycle main.go

FROM scratch AS final
LABEL Author="Bruno Mariano"
LABEL Info="github.com/brunoomariano"

WORKDIR /app

COPY --from=builder /app/fullcycle .

CMD [ "./fullcycle" ]
