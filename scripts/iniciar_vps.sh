#!/bin/bash
# ==============================================================================
# Script de Inicialização da Produção na VPS Linux
# ==============================================================================
set -e

echo "=== Iniciando Deploy da Plataforma MDM Corporativa (Produção) ==="

# 1. Copiar .env caso não exista
if [ ! -f .env ]; then
    echo "Criando .env a partir de .env.exemplo..."
    cp .env.exemplo .env
fi

# 2. Criar diretórios de volumes locais necessários
mkdir -p mosquitto/data mosquitto/log mosquitto/certificados apk

# 3. Subir todos os serviços com build
echo "Subindo containers Docker..."
docker compose up -d --build

echo "=== Deploy concluído com sucesso! ==="
echo "Painel Web: http://$(hostname -I | awk '{print $1}') ou seu domínio DuckDNS"
echo "API Backend: http://$(hostname -I | awk '{print $1}'):3000"
echo "Broker MQTTS: Porta 8883"
