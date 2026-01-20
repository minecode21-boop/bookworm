FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl \
    wget \
    nano \
    ca-certificates \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# SSH setup (optional)
RUN mkdir /var/run/sshd

# Create user
RUN useradd -m renderuser && echo "renderuser:render" | chpasswd

EXPOSE 10000

CMD ["sleep", "infinity"]
