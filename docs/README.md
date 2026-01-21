# Documentação Técnica - Template Backend

Esta pasta contém documentação técnica base para projetos criados a partir do template.

## Estrutura

```
docs/
├── product/                # Visão e backlog (placeholders)
│   ├── vision.md           # Visão geral do produto
│   └── backlog.md          # Épicos e backlog (alto nível)
├── system/                 # Documentação técnica do sistema
│   ├── api-spec.md         # Especificação de API (base)
│   ├── data-model.md       # Modelo de dados (base)
│   ├── business-rules.md   # Regras de negócio (base)
│   └── postman-guide.md    # Padrão de uso do Postman
├── governance/             # Papéis e responsabilidades
│   └── roles.md            # Papéis funcionais (negócio)
├── decisions/              # Registro de decisões (ADR)
│   └── index.md            # Índice de decisões
├── templates/              # Templates e guias
│   └── planner-card.md     # Padrão de card (Planner)
├── CONTRIBUTING.md         # Guia de contribuição e commits
└── README.md               # Este arquivo
```

## Documentação por Plataforma

Documentação técnica específica permanece na raiz do backend:

- **Backend:** [`../ARCHITECTURE.md`](../ARCHITECTURE.md) | [`../QUALITY.md`](../QUALITY.md)

## Fonte da Verdade

Separação recomendada para manter a informação organizada:

1. **Git (`docs/`)**: Documentação técnica estável e padrões.
2. **Notion** (opcional): Documentação de produto colaborativa.
3. **Planner** (opcional): Execução diária (tasks, bugs, code reviews).

---

**Status:** Estrutura de documentação base  
**Última atualização:** 2026-01-21
