# Guia de Contribuição - Template Backend

Este documento define padrões mínimos para contribuir com projetos criados a partir do template.

**Para detalhes técnicos das ferramentas de qualidade, veja [`../QUALITY.md`](../QUALITY.md).**

## Padrão de Commits

Seguimos o padrão **Conventional Commits**.

### Formato

```
<tipo>[escopo]: <descrição curta>

[corpo opcional]

[rodapé opcional]
```

### Tipos de Commit

| Tipo | Descrição | Exemplo |
|------|-----------|---------|
| `feat` | Nova funcionalidade | `feat(auth): adiciona login com JWT` |
| `fix` | Correção de bug | `fix(api): corrige validação de email` |
| `docs` | Documentação | `docs(readme): atualiza instruções de setup` |
| `style` | Formatação, ponto e vírgula, etc | `style: formata código com black` |
| `refactor` | Refatoração de código | `refactor: reorganiza estrutura de apps` |
| `perf` | Melhoria de performance | `perf(api): otimiza query` |
| `test` | Testes | `test(auth): adiciona testes de login` |
| `build` | Build, dependências, ferramentas | `build(deps): atualiza Django` |
| `ci` | CI/CD | `ci: adiciona pipeline` |
| `chore` | Tarefas de manutenção | `chore: atualiza dependências` |
| `setup` | Configuração inicial | `setup: initial commit` |

### Escopo (Opcional)

O escopo indica a área do projeto afetada:

- `backend` - Backend Django
- `docs` - Documentação
- `config` - Configurações gerais

### Descrição

- Curta e objetiva (máximo 72 caracteres)
- Imperativo (ex: "adiciona")
- Sem ponto final
- Primeira letra minúscula

## Validação de Commits

### Workflow Antes de Fazer Commit

**Sempre execute antes de commitar:**

**Linux/Mac (com make):**
```bash
make check
```

**Windows (sem make):**
```powershell
black apps config manage.py
flake8 apps config manage.py
pytest
```

**Windows (com WSL ou make instalado):**
```bash
make check
```

### Checklist Antes de Commit

- [ ] Código formatado (`make format` ou `black apps config manage.py`)
- [ ] Estilo verificado (`make lint` ou `flake8 apps config manage.py`)
- [ ] Testes passando (`make test-cov` ou `pytest`)
- [ ] Tipo de commit está correto?
- [ ] Descrição está clara e objetiva?
- [ ] Escopo está correto (se aplicável)?
- [ ] Mensagem segue o padrão?

**Nota Windows:** Se `make` não estiver disponível, use os comandos diretos listados acima.

## Checklist de Pull Request

Antes de abrir um PR:

- [ ] Código formatado e verificado (`make check` ou comandos diretos)
- [ ] Testes passam (`make test-cov` ou `pytest`)
- [ ] Documentação atualizada (se necessário)
- [ ] Commits seguem o padrão definido

---

**Status:** Padrões mínimos de contribuição  
**Última atualização:** 2026-01-19
