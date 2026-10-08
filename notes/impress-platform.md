# Impress Designs platform (dev)

The internal operations platform: Python/Litestar API, Astro web app, Windows and Android clients, task queue, on-prem ERP bridge, customer portal. Newest first. Tags and rules: see [README](README.md).

## Per-workload view routes and API boundary rules (2026-10-08)

**What:** Wrote the rule that resource endpoints return strictly their own data and that
client-specific projections and aggregates live under a per-workload `/views/<workload>/`
router, then shipped the router and its first view. The view's query runs two statements per
page and a partial covering index took a 500-order page from about 50 ms to 3 ms. The rule is
written into the repo's agent instructions and contributing docs so every future PR, human or
agent, is checked against it.

**My part:** the rule, the compromise shape, the review, rejecting a PR that embedded one
resource inside another. **AI part:** the router code, the query, the index migration, the
client change. Tag: **directed**.

Suggested bullets:
- Established REST API boundaries for a multi-client backend (resource routes return only
  their own data, per-workload view routes for projections) and encoded them in the repo's
  contributor and agent instructions so generated code is held to the same rule.
- Specified a read-only projection route whose covering index cut a 500-row aggregate page
  from 50 ms to 3 ms, replacing a proposal that joined the data into every order read.

## Customer portal moved onto shared API routes (2026-10-08)

**What:** The external customer portal had its own copy of the order, Action Center and
owner routes. Replaced them with a per-caller read policy on the shared routes (employees and
services see everything, partner users see rows for partners where they hold a role, with a
customer-safe response shape and filter allowlist), then deleted the duplicate route set.

**My part:** the direction (no parallel route sets, `/me` only for things that are truly the
caller's own), the review, the merge order. **AI part:** the policy code, the schemas, the
portal Worker changes. Tag: **directed** for the API, **ai-built** for the TypeScript Worker.

Suggested bullet:
- Replaced a parallel set of customer-facing API routes with a per-caller read policy on the
  shared routes, so internal apps and the external customer portal run one code path with
  different row scopes.

## Order import, ERP push, shipping model and ShipStation v2 (2026-10-07 to 2026-10-08)

**What:** A customer-neutral CSV sales-order import (whole-file refusal on duplicate POs),
first-class sales orders and notes in the API, a release flow that builds the ERP payload
server-side and pushes it through the task queue with idempotent external IDs, full editing
after the push, a multi-destination shipping model (one shipping spec per destination,
carriers, services, partner-owned carrier accounts) and ShipStation v2 integration (shipment
sync task, label webhook with a secret header, every label recorded as a carrier shipment,
unknown carrier codes auto-provisioned). First production batch was several hundred
multi-line orders for a national retailer.

**My part:** every data-model decision (no single ship-to column, one spec per destination,
account ownership, how notes map into the ERP, part-number shape for the ERP upload), the
entitlement design, the worker environment fix, the acceptance testing against the real ERP.
**AI part:** the API, queue tasks, SDK bump, migrations, the web UI. Tag: **directed** for
Python, **ai-built** for the web UI.

Suggested bullets:
- Designed and shipped an end-to-end order pipeline: validated CSV import, first-class sales
  orders, a queued idempotent push into the ERP's order API, and a multi-destination shipping
  model with ShipStation v2 label webhooks writing tracking back automatically.
- Replaced hand-keyed order entry with a validated import and one-click ERP release; the
  first production batch loaded hundreds of multi-line orders without a manual adjustment.

## Sentry log quota: 99.99% of volume was one logger (2026-10-08)

**What:** The organisation's Sentry log quota had been rate-limited since mid-September. One
framework access logger was 4.32M of 4.33M log records per week; it ignored the application
log level because the server pinned its own loggers before the app imported. Fixed so the
framework loggers follow the app setting and the access logger is excluded from Sentry.

**My part:** asked the question, approved the fix. **AI part:** the Sentry analysis and the
patch. Tag: **directed**.

Suggested bullet:
- Cut Sentry log ingestion by 99.99% by tracing a quota overrun to one framework access
  logger that ignored the application log level.

## Backend latency investigation (2026-10-07)

**What:** The Windows desktop app felt slow and a bigger Azure plan had been proposed.
Distributed traces showed a ~250 ms floor on every authenticated request: ~170 ms was an
Entra auth path running about eight DB statements and taking a row lock per request, and
every statement paid a ~24 ms round trip because the database and the app service are in
different regions. CPU was not the bottleneck. Shipped a bounded per-worker sign-in cache
(five minutes, successes only), a missing index, one shared open-orders sweep across boards,
and server-side status filtering that cut a full board refresh from 22 pages to one or two.
Post-deploy measurements are parked on the roadmap.

**My part:** the ask, confirming the region placement, deciding the cache TTL ("five minutes,
not instant revocation"), approving the client-visible side effect. **AI part:** the trace
analysis, the write-up, all four patches. Tag: **directed** for the API, **ai-built** for the
C# client changes.

Suggested bullets:
- Traced a slow desktop client to a 250 ms per-request backend floor (an eight-statement auth
  path plus a 24 ms cross-region DB hop) using distributed traces, then removed it with a
  bounded sign-in cache, a missing index and server-side filtering, cutting a full board
  refresh from 22 API pages to one.
- Used tracing evidence to show that a requested infrastructure upgrade would not help
  (request count times a per-request floor, not CPU) and redirected the spend to a region move.

## IDInet UX consistency pass and theme system (2026-10-02 to 2026-10-06)

**What:** Closed a UX backlog across the internal web app: six themes (three light, three
dark) with WCAG contrast enforced in the test suite (AAA 7:1 for the high-contrast pair, AA
plus a 6:1 secondary-text floor elsewhere), every string through a typed message list, raw
values in CSV exports, plain-text statuses in tables, consistent empty values, an Action
Center page, sales-order editing, and a sharded Playwright suite so the full check set runs on
every draft PR.

**My part:** every UX decision as the product owner (date format, default dark theme, where
appearance settings live, no computed counts), review of screenshots. **AI part:** all of the
Astro/Svelte/TypeScript. Tag: **ai-built**.

Suggested bullet:
- Product-owned an internal web app's UX consistency pass: a six-theme system with WCAG
  contrast enforced by tests, a typed message catalogue, and a sharded Playwright suite that
  runs the full check set on every draft PR.

## Observability rollout across every workload (2026-10-05)

**What:** Reviewed what Sentry and PostHog can do, wrote the policy (Sentry for operations,
PostHog for product usage, identify users in internal apps, mask customer data, free plans,
one cron and one uptime monitor), then shipped eight instrumentation PRs in one day, one per
workload (Python API, Cloudflare Worker, Python queue and producers, on-prem API, Windows,
Android), all merged the same day, with route-aware sampling that kept span volume inside the
free plan.

**My part:** the policy decisions, the DSNs, the merges. **AI part:** the review document and
all eight PRs. Tag: **directed** (Python, Worker) and **ai-built** (C#, Kotlin).

Suggested bullets:
- Instrumented seven workloads (Python API, Cloudflare Worker, Windows, Android, task queue)
  with tracing, metrics and structured logs in a single coordinated change set, with
  route-aware sampling that kept span volume inside the free Sentry plan.
- Wrote and applied an observability policy across the estate (operational telemetry versus
  product analytics, identity rules, sampling budgets, customer-data masking).

## Durable task queue and cross-device printing (September 2026)

**What:** Replaced systemd-timer sync jobs with a Postgres-backed queue: claims over HTTP
with `SELECT FOR UPDATE SKIP LOCKED`, dedup keys, delayed retry, lease recovery for dead
runners, outbox-style fan-out, and strict dependency inversion (web and CLI depend on the
engine, never the reverse) enforced by an import-isolation test. The printing MVP went live:
a label requested on an Android scanner is queued in the API and printed by a Windows
workstation agent in ZPL.

**My part:** the architecture (keep the queue slim, HTTP claims instead of direct DB access,
single worker for serialisation, the import boundary), the phase plan. **AI part:** the
implementation; this was the first feature I delegated and walked away from. Tag:
**directed** (Python), **ai-built** (Android and Windows ends) (confirm).

Suggested bullets:
- Replaced cron-style sync jobs with a durable Postgres task queue (SKIP LOCKED claims over
  HTTP, dedup keys, delayed retries, lease recovery, outbox fan-out) shared by web, CLI and
  worker processes, with the dependency direction enforced by an import-isolation test.
- Shipped a cross-device print pipeline: a label requested on an Android scanner is queued in
  the API and printed by a Windows workstation agent, ZPL end to end.

## Monday.com retired into the platform (September 2026)

**What:** Imported the receiving, carrier-returns and production boards into a first-class
Work Items domain (activity timeline, visibility-scoped comments, rich text as a versioned
JSON envelope with server-derived sanitised HTML), then cancelled and deleted the tenant.

**My part:** the domain model review and corrections (aggregate naming, the timeline as a
future global timeline, hard-blocking child tables on unfinished models), the migration,
the cancellation. **AI part:** the implementation (confirm). Tag: **directed** (confirm).

Suggested bullet:
- Replaced Monday.com with a first-class Work Items domain (activity timeline,
  visibility-scoped comments, rich text), migrated the board history and closed the
  subscription.
