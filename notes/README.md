# Brag file

A running list of things worth remembering when the resumes need new bullets. Each entry
records what happened, what I did versus what an AI agent did, and candidate bullets for the
dev and sysadmin resumes. Started 2026-10-08.

Entries live in one file per ecosystem, newest first, and every entry carries its date in
its heading. The table below is the chronological view; add a row when you add an entry.

| File | What goes there |
|---|---|
| [impress-platform.md](impress-platform.md) | the internal platform: API, web, desktop, mobile, queue |
| [infrastructure.md](infrastructure.md) | identity, endpoints, network, supply chain, investigations |
| [utvendor.md](utvendor.md) | the vendor-tooling brand, K-ERP Scout, SDK, dashboard, docs |
| [side-projects.md](side-projects.md) | one-off tools, reverse engineering, volunteer work |
| [responsible-ai.md](responsible-ai.md) | the AI-use framing and its bullets |
| [ideas.md](ideas.md) | parking lot: numbers to confirm, sections to add, things to leave out |

This repository is public. Keep out: customer and client names, colleague names, internal
hostnames and addresses, credentials, dollar figures. Employer name, product names that are
already public and internal app code names are fine.

## How to read the AI tag

Every entry carries one of these so the resume never claims more than is true:

- **hands-on**: I did the work myself (code, console, config, investigation).
- **directed**: I set the design, constraints and acceptance criteria, an AI agent wrote most
  of the code, and I reviewed it, ran it and own the result. In my own languages (Python, SQL,
  YAML, shell) I could have written it; I chose not to.
- **ai-built**: an AI agent wrote essentially all of it in a stack I do not write (Svelte and
  TypeScript UI, C#/.NET, Kotlin). I own the requirements, the behaviour, the tests that prove
  it, the review of outcomes and the consequences. I do not own the lines.
- **(confirm)**: my best guess at the tag; correct it.

How this reads on a resume: "directed" and "ai-built" work is still my work in the sense an
engineering manager's team output is theirs, but the verb changes. Use "designed",
"specified", "reviewed", "shipped", "own" rather than "wrote" or "implemented" for those
entries. [responsible-ai.md](responsible-ai.md) has bullets that say so outright.

## Timeline

Newest first. Dates are when the work landed; multi-year items carry the end date.

| Date | Entry | File |
|---|---|---|
| 2026-10-08 | [Per-workload view routes and API boundary rules](impress-platform.md#per-workload-view-routes-and-api-boundary-rules-2026-10-08) | impress-platform.md |
| 2026-10-08 | [Customer portal moved onto shared API routes](impress-platform.md#customer-portal-moved-onto-shared-api-routes-2026-10-08) | impress-platform.md |
| 2026-10-08 | [Order import, ERP push, shipping model and ShipStation v2](impress-platform.md#order-import-erp-push-shipping-model-and-shipstation-v2-2026-10-07-to-2026-10-08) | impress-platform.md |
| 2026-10-08 | [Sentry log quota: 99.99% of volume was one logger](impress-platform.md#sentry-log-quota-9999-of-volume-was-one-logger-2026-10-08) | impress-platform.md |
| 2026-10-07 | [Backend latency investigation](impress-platform.md#backend-latency-investigation-2026-10-07) | impress-platform.md |
| 2026-10-07 | [Printer service-report decoder](side-projects.md#printer-service-report-decoder-2026-10-06-to-2026-10-07) | side-projects.md |
| 2026-10-06 | [IDInet UX consistency pass and theme system](impress-platform.md#idinet-ux-consistency-pass-and-theme-system-2026-10-02-to-2026-10-06) | impress-platform.md |
| 2026-10-05 | [Observability rollout across every workload](impress-platform.md#observability-rollout-across-every-workload-2026-10-05) | impress-platform.md |
| 2026-10-05 | [K-ERP Scout: Avalonia port, multi-platform CI, publishing standard](utvendor.md#k-erp-scout-avalonia-port-multi-platform-ci-publishing-standard-2026-10-02-to-2026-10-05) | utvendor.md |
| 2026-10-05 | [UT Vendor product line refresh](utvendor.md#ut-vendor-product-line-refresh-2026-09-27-to-2026-10-05) | utvendor.md |
| 2026-09-30 | [Durable task queue and cross-device printing](impress-platform.md#durable-task-queue-and-cross-device-printing-september-2026) | impress-platform.md |
| 2026-09-30 | [Monday.com retired into the platform](impress-platform.md#mondaycom-retired-into-the-platform-september-2026) | impress-platform.md |
| 2026-09-11 | [File-share disconnect investigation](infrastructure.md#file-share-disconnect-investigation-2026-06-to-2026-09) | infrastructure.md |
| 2026-07-15 | [Supply chain and release engineering](infrastructure.md#supply-chain-and-release-engineering-2025-to-2026) | infrastructure.md |
| 2019 to present | [Identity and endpoint platform](infrastructure.md#identity-and-endpoint-platform-2019-to-present-already-on-the-sysadmin-resume) | infrastructure.md |
