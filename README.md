# Django REST Framework Template

Template genérico para APIs REST com Django + DRF + JWT, pronto para ser usado como base em novos projetos.

## Início Rápido

```bash
# Clone o repositório
git clone <seu-repositorio>
cd django-backend-template

# Crie e ative ambiente virtual
python -m venv venv
source venv/bin/activate  # Linux/Mac
# ou
venv\Scripts\activate  # Windows

# Instale dependências
pip install -r requirements.txt

# Configure variáveis de ambiente
cp .env.example .env
# Edite .env com suas configurações

# Execute migrações
python manage.py migrate

# Execute o servidor
python manage.py runserver
```

Acesse `http://localhost:8000`.

## Estrutura

```
apps/
├── accounts/      # App de autenticação
├── core/          # Funcionalidades compartilhadas
└── ...            # Seus apps aqui
```

## Documentação

- [TEMPLATE.md](./TEMPLATE.md) - Como usar como template
- [ARCHITECTURE.md](./ARCHITECTURE.md) - Arquitetura e adaptações necessárias

## Scripts

- `python manage.py runserver` - Desenvolvimento
- `python manage.py migrate` - Executar migrações
- `python manage.py test` - Testes
- `make help` - Ver comandos do Makefile

## Tecnologias

- Django 6.0.1
- Django REST Framework 3.16.1
- djangorestframework-simplejwt 5.5.1
- django-cors-headers 4.3.1
- PostgreSQL (produção)
- SQLite (desenvolvimento)

## Configuração Inicial

Configure as variáveis de ambiente no arquivo `.env`. Veja [TEMPLATE.md](./TEMPLATE.md) e [ARCHITECTURE.md](./ARCHITECTURE.md) para detalhes.

## Endpoints

### Autenticação JWT

- `POST /api/token/` - Obter token (login)
- `POST /api/token/refresh/` - Renovar access token
- `POST /api/token/verify/` - Verificar token

### Usuários

- `GET /api/users/profile/` - Perfil do usuário autenticado
- `PUT/PATCH /api/users/profile/` - Atualizar perfil
- `GET /api/users/<id>/` - Detalhes de um usuário

## Recursos

- [Django Documentation](https://docs.djangoproject.com/)
- [Django REST Framework](https://www.django-rest-framework.org/)
- [Simple JWT](https://django-rest-framework-simplejwt.readthedocs.io/)
