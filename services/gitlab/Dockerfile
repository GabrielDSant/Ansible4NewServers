# Usando a imagem oficial do Ubuntu como imagem base
FROM ubuntu:latest

# Atualiza os pacotes e instala o software básico
RUN apt-get update && \
    apt-get install -y \
    vim \
    curl \
    wget \
    net-tools \
    iputils-ping \
    apt-transport-https \
    ca-certificates \ 
    gnupg-agent \
    software-properties-common \
    runit \
    python3 \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho padrão
WORKDIR /app

# Comando padrão a ser executado quando um contêiner for iniciado a partir desta imagem
CMD ["tail", "-f", "/dev/null"]
