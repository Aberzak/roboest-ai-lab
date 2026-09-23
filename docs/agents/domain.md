# docs/agents/domain.md

Single context.

- Glossary: `CONTEXT.md` at the repo root (format: bold headword, one or two sentences, `_NL_`, `_UI_`, `_Avoid_`).
- Decisions: `docs/adr/NNNN-<tension>.md`, numbered in order of acceptance, template in `docs/adr/TEMPLATE.md`.
- Facts: `docs/research/NNN-<slug>.md`, NNN = the issue number that asked the question, format in `docs/research/README.md`.
- Prototypes: code on `prototype/<name>` branches; `prototypes/README.md` on `main` lists each branch, its question and its answer.

`/grill-with-docs` writes new headwords into `CONTEXT.md` and proposes an ADR when a decision is hard to reverse, surprising without context and a real trade-off. All three, or no ADR.
