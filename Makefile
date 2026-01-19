.PHONY: help install migrate makemigrations run shell test clean docker-up docker-down docker-build docker-logs superuser collectstatic format lint check test-cov quality

help:
	@echo "Comandos disponíveis:"
	@echo "  make install          - Instalar dependências"
	@echo "  make migrate          - Executar migrações"
	@echo "  make makemigrations   - Criar migrações"
	@echo "  make run              - Rodar servidor de desenvolvimento"
	@echo "  make shell            - Abrir shell do Django"
	@echo "  make test             - Executar testes"
	@echo "  make test-cov         - Executar testes com coverage (pytest)"
	@echo "  make superuser        - Criar superusuário"
	@echo "  make collectstatic    - Coletar arquivos estáticos"
	@echo "  make clean            - Limpar arquivos temporários"
	@echo ""
	@echo "Qualidade de código:"
	@echo "  make format           - Formatar código com black"
	@echo "  make lint             - Verificar código com flake8"
	@echo "  make check            - Executar format + lint + test-cov"
	@echo "  make quality          - Alias para check"
	@echo ""
	@echo "Docker:"
	@echo "  make docker-up        - Iniciar containers"
	@echo "  make docker-down      - Parar containers"
	@echo "  make docker-build     - Construir imagens"
	@echo "  make docker-logs      - Ver logs dos containers"

install:
	pip install -r requirements.txt

migrate:
	python manage.py migrate

makemigrations:
	python manage.py makemigrations

run:
	python manage.py runserver

shell:
	python manage.py shell

test:
	python manage.py test

test-cov:
	pytest

superuser:
	python manage.py createsuperuser

collectstatic:
	python manage.py collectstatic --noinput

clean:
	find . -type d -name "__pycache__" -exec rm -r {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.log" -delete
	rm -rf .pytest_cache
	rm -rf htmlcov
	rm -rf .coverage

# Qualidade de código
format:
	black apps config manage.py

lint:
	flake8 apps config manage.py

check: format lint test-cov
	@echo "Verificação de qualidade concluída!"

quality: check

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

docker-build:
	docker-compose build

docker-logs:
	docker-compose logs -f
