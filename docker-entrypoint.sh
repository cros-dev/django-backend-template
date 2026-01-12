#!/bin/bash
set -e

echo "Aguardando PostgreSQL..."
while ! nc -z db 5432; do
  sleep 0.1
done
echo "PostgreSQL está pronto!"

echo "Executando migrações..."
python manage.py migrate --noinput

if [ "$DJANGO_SUPERUSER_USERNAME" ]; then
  echo "Criando superusuário..."
  python manage.py shell << EOF
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='$DJANGO_SUPERUSER_USERNAME').exists():
    User.objects.create_superuser('$DJANGO_SUPERUSER_USERNAME', '$DJANGO_SUPERUSER_EMAIL', '$DJANGO_SUPERUSER_PASSWORD')
    print('Superusuário criado com sucesso!')
else:
    print('Superusuário já existe.')
EOF
fi

exec "$@"
