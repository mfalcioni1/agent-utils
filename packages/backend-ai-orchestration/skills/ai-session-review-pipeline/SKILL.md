---
name: ai-session-review-pipeline
description: Implements the end-of-session Diff and Accept review pipeline — Celery extraction, structured JSON, and wizard UI handoff. Use when building note session completion, entity reconciliation, timeline routing, or todo export flows. Requires Celery, PostgreSQL, and LLM orchestration packages.
---

# AI Session Review Pipeline

**Pattern:** User completes a note session → background extraction → interactive **Diff & Accept** wizard → committed graph updates.

AI never silently edits note text. All graph changes require explicit user approval.

## When to use

- "Complete session" or navigate-away triggers for note editors
- Entity reconciliation (`Sam` → profile link)
- Indirect context routing (mention in meeting → snippet on profile timeline)
- Todo extraction and external sync confirmation

## Architecture

```
Client (Expo)          API (FastAPI)           Worker (Celery)
     |                      |                        |
     |-- POST /sessions/complete (markdown snapshot) ->|
     |                      |-- process_session.delay ->|
     |<-- { task_id } ------|                        |
     |                      |                        |-- fetch team nodes (DB)
     |                      |                        |-- LLM structured extract
     |                      |                        |-- store pending result
     |-- GET /sessions/{id}/review ------------------>|
     |<-- SessionExtractionResult JSON ---------------|
     |-- wizard UI (accept/reject per item)           |
     |-- POST /sessions/{id}/commit (accepted only) ->|
```

## Workflow

```
Session Review Progress:
- [ ] Step 1: API accepts snapshot, enqueues Celery task
- [ ] Step 2: Worker loads tenant team nodes for context
- [ ] Step 3: LLM returns validated SessionExtractionResult
- [ ] Step 4: API exposes review payload to client
- [ ] Step 5: Client renders 3-step wizard
- [ ] Step 6: Commit endpoint applies only accepted items
```

### Step 1: Session complete endpoint

Accept `note_id`, `markdown_snapshot`, `tenant_id`. Enqueue `process_session`. Return `task_id` or poll URL.

### Step 2: Worker context

Load established team member nodes (id, display name, role hints) for the tenant. Pass to the LLM as grounding context — not the full database.

### Step 3: Structured extraction

GPT-4o-mini (or equivalent) via LangChain structured output. Target schema:

```json
{
  "entity_reconciliation": [
    {
      "original_text": "Sam",
      "matched_id": "emp_01H8X",
      "confidence_reason": "Matched to Sam Rogers based on migration context."
    }
  ],
  "timeline_routes": [
    {
      "snippet": "Alex is blocked on API design",
      "target_profile_id": "emp_02Y9Z"
    }
  ],
  "extracted_todos": [
    {
      "text": "Clear database flags",
      "target_assignee_id": "emp_01H8X",
      "suggested_due_date": "2026-06-30"
    }
  ]
}
```

Validate with Pydantic before persisting.

### Step 4: Review API

Store pending result keyed by session/note. Client fetches when task completes (poll or websocket).

### Step 5: Wizard UI (client)

Three rapid confirmation steps:

1. **Entity reconciliation** — accept, reject, or search alternate profile per match.
2. **Timeline routing** — verify snippet placement on collateral profiles.
3. **Task matrix** — edit todos; choose local notification vs external sync (GitHub, Monday, etc.).

### Step 6: Commit

`POST /sessions/{id}/commit` with only user-approved items. Idempotent; safe to retry.

## Security

- ZDR LLM providers for all note content.
- Tenant scope on every DB read/write in the pipeline.
- Do not log raw note text at info level in production.

## Additional resources

- Model routing and RAG patterns: `backend-ai-orchestration` rule
- Celery task conventions: `backend-celery-redis` rule
