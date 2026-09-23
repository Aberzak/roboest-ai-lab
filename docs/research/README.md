# Research notes

One Markdown note per question, written by `/research` (a background agent) and read by a human before it is merged. File name: `NNN-<slug>.md`, NNN = the issue number that asked the question.

## House format

```markdown
# <The question or the finding, as one sentence>

| | |
|---|---|
| Asked by | #<issue> |
| Looked up / measured | <date> |
| Where | <URL of each primary source, or the environment of a probe> |
| As whom | <anonymous web / a test account / n.a.> |
| Tool versions | <if a CLI or SDK was used> |

## The answer in short
<Three to five sentences. The answer a colleague needs, with the one number that matters.>

## Method
<What was read or run, in order. Quote the exact sentence of the source that carries each claim.>

## Limits
<What this note does not cover. What was not tested. Where the source is ambiguous.>

## Reproducibility
<Links and commands someone else can repeat to get the same answer.>

## Open points
<Questions this raised. Each one becomes an issue (label needs-triage) or goes into a /to-questionnaire.>
```

## Rules

- **Primary sources only**: official government or regulator pages, the law text, Microsoft Learn, a product's own documentation, a CLI's `--help`, a probe you ran. A blog, a forum or "the model knows" is not a source.
- Every claim has a link or a command next to it.
- A number with a date: amounts and rates change; write the date the source was read and the period it applies to.
- This repo is public: no internal facts, no customer names, `<REDACTED>` for anything secret.
