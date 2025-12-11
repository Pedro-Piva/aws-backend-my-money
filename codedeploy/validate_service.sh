#!/bin/bash
echo "=== ValidateService: Verificando saúde ==="
sleep 5
if pm2 show backend-ec2 > /dev/null; then
    echo "✅ Processo backend-ec2 está rodando."
    exit 0
else
    echo "❌ Processo backend-ec2 não encontrado!"
    exit 1
fi
