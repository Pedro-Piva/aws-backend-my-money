if ! command -v aws &> /dev/null
then
    echo "⚠️ AWS CLI não encontrado. Instalando agora..."
    apt-get update
    apt-get install -y awscli
    echo "✓ AWS CLI instalado com sucesso!"
else
    echo "✓ AWS CLI já está instalado"
fi

export PATH=$PATH:/usr/bin:/usr/local/bin
node --version
pm2 --version

DIR="/home/ubuntu/app"
if [ -d "$DIR" ]; then
  echo "Limpando diretório da aplicação..."
  rm -rf "$DIR"/*
else
  echo "Criando diretório da aplicação..."
  mkdir -p "$DIR"
fi

chown -R ubuntu:ubuntu /home/ubuntu/app
