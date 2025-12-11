#!/bin/bash
echo "=== ApplicationStart: Iniciando servidor ==="

# 1. Entra na pasta correta
APP_DIR="/home/ubuntu/app"
cd "$APP_DIR" || { echo "❌ Diretório não encontrado"; exit 1; }

# 2. Garante que as variáveis de ambiente existem
if [ ! -f .env ]; then
    echo "Criando .env temporário..."
    echo "PORT=3000" >> .env
    echo "DB_NAME=mymoneydb" >> .env
    echo "AWS_REGION=us-east-1" >> .env
    echo "AWS_SECRET_NAME=prod/myapp/postgres" >> .env
    echo "JWT_SECRET=SECRET_KEY_123" >> .env
fi

# 3. Inicia a aplicação
pm2 delete backend-ec2 2> /dev/null || true

echo "Iniciando aplicação com PM2..."
pm2 start src/index.js --name backend-ec2

pm2 save

echo "=== ApplicationStart: Servidor iniciado com sucesso ==="
