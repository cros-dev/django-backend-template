# Arquitetura do Template

Este documento descreve o que é genérico (pronto para uso) e o que precisa ser adaptado.

## Genérico - Pronto para Uso

Estes componentes podem ser usados sem modificações:

### Apps Base

**apps.accounts**
- Serializers genéricos para User do Django (`UserSerializer`, `UserProfileSerializer`)
- Views para perfil e detalhes de usuário
- Endpoints: `/api/users/profile/` e `/api/users/<id>/`
- Configuração do Django Admin para User

**apps.core**
- Validators genéricos (`validate_cpf`, `validate_cnpj`)
- Funções utilitárias (`format_phone`, `format_cpf`, `format_cnpj`)
- Permissão customizada (`IsOwnerOrReadOnly`)

**Filtros**
- Suporte a filtros com `django-filter` para endpoints de listagem

### Autenticação JWT

**Endpoints JWT**
- `POST /api/token/` - Obter token (login)
- `POST /api/token/refresh/` - Renovar access token
- `POST /api/token/verify/` - Verificar token

**Configuração**
- JWT com blacklist de tokens habilitado
- Rotação de refresh tokens
- Tempo de vida configurável via variáveis de ambiente

### Configurações

**settings.py**
- Separação dev/prod (SQLite vs PostgreSQL)
- CORS configurado (permissivo em dev, restritivo em prod)
- Segurança em produção (SSL, HSTS, cookies seguros)
- Cache com fallback LocMemCache (Redis opcional)
- Logging configurado
- I18N configurável

**Docker**
- `Dockerfile` configurado
- `docker-compose.yml` com PostgreSQL e Redis
- `docker-entrypoint.sh` para inicialização automática

**Makefile**
- Comandos úteis para desenvolvimento e Docker
- Inclui comandos de qualidade (`format`, `lint`, `check`)

**Qualidade de código**
- Configurações de `black`, `flake8`, `pytest` e `coverage`
- Referência em `QUALITY.md`

### Testes

- Estrutura organizada em `tests/` dentro de cada app
- Testes básicos para serializers, views e autenticação
- Testes para validators, utils e permissions

## Precisa Adaptar

### 1. Variáveis de Ambiente

Arquivo: `.env`

**Obrigatórias:**
- `SECRET_KEY`: Gere uma chave segura
- `DEBUG`: `true` ou `false`
- `ALLOWED_HOSTS`: Hosts permitidos

**Produção (quando DEBUG=false):**
- `POSTGRES_DB`: Nome do banco
- `POSTGRES_USER`: Usuário do PostgreSQL
- `POSTGRES_PASSWORD`: Senha do PostgreSQL

**Opcionais:**
- `JWT_ACCESS_MINUTES`: Tempo de vida do access token (padrão: 5)
- `JWT_REFRESH_DAYS`: Tempo de vida do refresh token (padrão: 1)
- `CORS_ALLOWED_ORIGINS`: Origens permitidas para CORS
- `LANGUAGE_CODE`: Código do idioma (padrão: `pt-br`)
- `TIME_ZONE`: Timezone (padrão: `UTC`)
- `REDIS_URL`: URL do Redis para cache (opcional)

### 2. Filtros (Opcional)

Dependência: `django-filter`

Para usar filtros em views, adicione `DjangoFilterBackend` e defina `filterset_fields`:

```python
from django_filters.rest_framework import DjangoFilterBackend

class ExampleViewSet(viewsets.ModelViewSet):
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ["status", "created_at"]
```

### 3. CORS

Arquivo: `config/settings.py`

Em produção, configure `CORS_ALLOWED_ORIGINS` no `.env` com as origens permitidas.

### 4. Models e Apps

Pasta: `apps/`

Crie seus apps específicos em `apps/` seguindo o padrão:

```bash
python manage.py startapp meu_app
mv meu_app apps/
```

Atualize `config/settings.py` e `apps/meu_app/apps.py`.

### 5. Customização do User (Opcional)

Se precisar de campos adicionais no User, crie um modelo customizado:

```python
# apps/accounts/models.py
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    # Seus campos customizados
    pass
```

Atualize `config/settings.py`:

```python
AUTH_USER_MODEL = 'accounts.User'
```

**Nota:** Faça isso antes de executar as primeiras migrações.

### 6. Validators (Opcional)

Arquivo: `apps/core/validators.py`

O validator de CPF implementa dígitos verificadores. O validator de CNPJ é básico; para validação completa, considere usar biblioteca externa.

### 7. Docker (Opcional)

Arquivo: `Dockerfile`

Em produção, substitua `runserver` por um servidor WSGI (ex: Gunicorn):

```dockerfile
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]
```

## Checklist de Adaptação

- [ ] Configurar `SECRET_KEY` no `.env`
- [ ] Configurar `DEBUG` e `ALLOWED_HOSTS`
- [ ] Configurar PostgreSQL (se produção)
- [ ] Configurar `CORS_ALLOWED_ORIGINS` (se produção)
- [ ] (Opcional) Customizar modelo User
- [ ] Criar apps específicos do projeto
- [ ] (Opcional) Ajustar validators se necessário
- [ ] (Opcional) Configurar Redis para cache
- [ ] Renomear projeto se necessário

## Estrutura de Apps

```
apps/
├── accounts/          # App de autenticação (genérico)
│   ├── serializers.py
│   ├── views.py
│   ├── urls.py
│   └── tests/
├── core/              # Funcionalidades compartilhadas (genérico)
│   ├── validators.py
│   ├── utils.py
│   ├── permissions.py
│   └── tests/
└── seu_app/           # Seus apps específicos
    └── ...
```

## Notas Importantes

- **Migrations**: São ignoradas no Git (exceto `__init__.py`) para manter o template genérico
- **Autenticação**: Por padrão, todas as views requerem autenticação JWT
- **Paginação**: Padrão de 20 itens por página
- **Cache**: LocMemCache por padrão, Redis opcional
