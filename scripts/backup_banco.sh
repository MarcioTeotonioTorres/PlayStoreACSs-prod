#!/bin/bash
# ==============================================================================
# Script de Backup Automático do PostgreSQL
# ==============================================================================
DATA=$(date +"%Y%m%d_%H%M%S")
DIRETORIO_BACKUP="backups"
NOME_ARQUIVO="${DIRETORIO_BACKUP}/mdm_backup_${DATA}.sql.gz"

mkdir -p ${DIRETORIO_BACKUP}

echo "Criando backup do banco de dados MDM em: ${NOME_ARQUIVO}"
docker exec -t mdm_postgres_prod pg_dumpall -U mdm_admin | gzip > ${NOME_ARQUIVO}

echo "Backup concluído com sucesso! Tamanho: $(du -sh ${NOME_ARQUIVO} | cut -f1)"

# Mantém apenas os backups dos últimos 14 dias
find ${DIRETORIO_BACKUP} -type f -name "*.sql.gz" -mtime +14 -exec rm {} \;
