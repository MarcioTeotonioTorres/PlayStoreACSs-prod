# MDM Corporativo Privado — Ambiente de Produção (PlayStoreACSs-prod)

Repositório oficial para deploy em produção na VPS Linux para gestão de frota de 250 tablets Android Enterprise.

---

## 🚀 Como Subir o Ambiente na VPS

### 1. Pré-requisitos na VPS (Ubuntu 22.04 / 24.04 LTS recomendados)
- Docker e Docker Compose instalados:
  ```bash
  curl -fsSL https://get.docker.com | sh
  ```

### 2. Clonar e Iniciar o Ambiente
```bash
git clone https://github.com/marcioteotoniotorres/PlayStoreACSs-prod.git
cd PlayStoreACSs-prod

# Configurar credenciais
cp .env.exemplo .env
nano .env

# Executar o deploy
chmod +x scripts/*.sh
./scripts/iniciar_vps.sh
```

---

## 🌐 Portas Expostas e Serviços

| Porta | Protocolo | Serviço | Descrição |
| :---: | :---: | :---: | :--- |
| **80** | HTTP | Frontend Nginx | Painel Web de Gestão dos Operadores |
| **3000** | HTTP | Backend Fastify | API REST e Catálogo de APKs |
| **8883** | MQTTS (TLS) | Mosquitto | Canal Criptografado com os 250 Tablets |
| **1883** | MQTT | Mosquitto (Interno) | Barramento interno de mensageria |
| **5432** | TCP | PostgreSQL 16 | Banco de dados corporativo |

---

## 📚 Documentação
Consulte o arquivo `MANUAL_DE_USO_MDM_CORPORATIVO.pdf` incluso neste repositório para o manual operacional completo.
