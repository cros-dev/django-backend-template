# Registro de Decisões Técnicas (ADR)

Este diretório contém decisões de arquitetura e produto do projeto criado a partir do template.

## Decisões Aceitas

1. **Backend como fonte única da verdade**
   * **Motivo:** Evitar inconsistência de dados entre clientes.
   * **Impacto:** Validações críticas centralizadas no servidor.

2. **UUIDs gerados no backend**
   * **Motivo:** Garantir unicidade em cenários offline ou distribuídos.
   * **Impacto:** Evita colisões de identificadores.

---

**Status:** Estrutura base de ADR  
**Última atualização:** 2026-01-21
