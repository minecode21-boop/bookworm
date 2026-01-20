FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV PORT=10000

RUN apt update && apt install -y \
    python3 \
    curl \
    nano \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 10000

CMD ["sh", "-c", "echo Starting server on port $PORT && python3 -m http.server $PORT"]
