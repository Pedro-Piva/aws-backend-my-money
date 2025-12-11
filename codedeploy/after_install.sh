#!/bin/bash
echo "=== AfterInstall: Configurando dependências ==="

# 1. Define o diretório onde o appspec.yml colocou os arquivos
APP_DIR="/home/ubuntu/app"

cd "$APP_DIR" || { echo "❌ Diretório $APP_DIR não encontrado"; exit 1; }

echo "Instalando pacotes npm..."
npm install

echo "=== AfterInstall: Concluído com sucesso ==="
