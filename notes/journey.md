# The journey

Four generations of the same idea, built by one person: a way to track production at a
screen-printing and apparel-decoration shop. It started as a single-user Java Swing desktop
app in high school and is now an API-first platform with web, Windows, Android and
customer-facing clients. This page is the long version that does not belong on the resume;
the resume gets one line from it.

Numbers below were read from the repositories on 2026-10-08 (commit counts are the default
branch; line counts are code files at HEAD, excluding vendored and generated files). "Own
commits" are commits under my name, which since mid-2026 includes agent-written commits I
reviewed and merged; see the honesty note at the end.

| Era | Years | Stack | Size | What it was |
|---|---|---|---|---|
| ProductionLog | high school to 2018 | Java Swing, SQL, Jackson, Joda | 19 classes, ~4,800 lines (decompiled) | single-user desktop production log |
| Production Tracking | 2019 to present | Ruby on Rails, Devise, Postgres | 664 commits, ~12,000 lines | multi-user web production log, still in production |
| IDInet v2 | 2020 to 2023 (maintained to 2025) | Flask, SQLAlchemy, Alembic, Azure App Service | 1,302 commits, ~10,500 lines | the monolith that grew into "a manufacturing ERP" |
| Core + IDInet | 2024 to present | Litestar + Postgres API; Astro/Svelte on Cloudflare Workers | 1,243 + 747 commits, ~120k + ~130k lines | API-first platform with seven client workloads |

## 1. ProductionLog: Java Swing (high school to 2018)

Repo: [darbiadev/ProductionLog](https://github.com/darbiadev/ProductionLog).

A desktop app for logging what the production floor did: employees, orders, times, and
averages per employee, with a settings dialog, bulk employee import and an HTML export. The
most recent build carries a 2018-12-04 timestamp, which lines up with starting at Impress
Designs that December. The original source was lost; the repo holds the decompiled source of
the last known version plus every release binary, committed in June 2022 so the history
survives.

What it taught: the domain. Every later rewrite tracked the same nouns (employee, order,
activity, time) and the same question (what did the floor do today, and how fast).

Tag: **hands-on**, every line.

## 2. Production Tracking: Ruby on Rails (2019 to present)

Repo: impressdesigns/production-tracking (private).

The moment the log had to serve more than one person it became a web app. First commit
2019-01-26, then 409 commits in 2019 alone (105 in May 2019). Thirty activity models, one
per floor task: screen making, ink mixing, tape screens, catching, folding, hanging,
packaging, reclaiming, reworks, machine logs, shift-change and HR forms, and more. Devise
authentication, Postgres, a SonarCloud badge in the README, a test suite that the README
told you to run first.

It is still running. In 2026 it moved to Ruby 4.0.5 and Rails 8.1, got RuboCop and
CODEOWNERS, and gained a "Warehouse" department option in April 2026 because the floor asked
for it. A seven-year-old app that still gets small feature requests is the quietest kind of
success.

What it taught: multi-user web apps, auth, migrations, and that a shipped app outlives the
framework argument you had about it.

Tag: **hands-on** for the build; 2024 to 2026 maintenance is a mix of my commits, Dependabot
and a handful of Copilot PRs.

## 3. IDInet v2: the Flask monolith (2020 to 2023, maintained to 2025)

Repo: impressdesigns/idinet-v2-flask-monolith (private).

In March 2020 I switched to Flask because I thought it was simpler. It was not simpler, but it
was where I learned the Python stack I still use: SQLAlchemy, Alembic migrations, Sentry,
containers on Azure App Service, nox, uv. Over three and a half years of steady work (279,
268, 195 and then 469 commits a year) the app grew blueprints for admin, auth, departments,
employees, labels, production, purchasing, reports, sales, UPS shipments, users, warehouse,
and the on-premises ERP, plus clients for two supplier catalogues and the on-prem Local API.
Its README by the end called it, accurately, "a manufacturing ERP". 999 of its 1,302 commits
are mine; the rest are Dependabot.

The last thing added to it was a client for Core. The monolith became a consumer of the new
API before it was retired, which is how the cut-over avoided a big-bang migration.

What it taught: the Python backend craft, and the cost of a monolith when more than one kind
of client (browser, desktop, scanner) needs the same data.

Tag: **hands-on**.

## 4. Core and IDInet: the API-first split (2024 to present)

Repos: impressdesigns/core and impressdesigns/idinet (private).

Both were born in the same week: IDInet's first commit on 2024-01-07, Core's on 2024-01-08
("Init Fast API"). Core moved from FastAPI to Litestar on 2024-09-16. The decision that
mattered was not the framework but the shape: one API owns all durable state, and every
client is thin. That is what let a Windows desktop app, an Android scanner app, a task queue
with producers and workers, an on-prem ERP bridge and an external customer portal join over
the next two years without any of them owning data.

Where it stands on 2026-10-08:

- **Core:** 1,243 commits, 510 Python files, about 120,000 lines, 129 test files, some 35
  route modules (orders, designs, work items, printing, tasks, WMS, CRM, audit, search,
  entitlements, callbacks, per-workload views), PostgreSQL 18 with a squashed Alembic chain,
  Entra ID auth, a durable task queue, Azure Blob file storage.
- **IDInet:** 747 commits, 440 TypeScript, 206 Astro and 106 Svelte files, about 130,000
  lines, 113 pages, 190 test files, six themes with contrast enforced by tests, deployed to
  Cloudflare Workers.
- **Around them:** IDI Tools (Windows), IDI Hub (Android), Chimera and Argus (queue workers
  and producers), Local API (on-prem bridge), Customer Portal (Cloudflare Worker), and a
  dozen SDK repositories.

The API-first split is now simply how the company's software works. Nobody who joined after
2024 has reason to know it was a choice, which is the point: it stopped being an architecture
and became the floor.

Tag: **hands-on** through 2024 and most of 2025 (confirm the hand-over point); **directed**
for Core and **ai-built** for the IDInet front end since mid-2026.

## 5. The inflection (2026)

The commit history shows exactly when AI agents became the primary authors. Commits under my
name on IDInet in 2026: between 3 and 12 a month from January to May, then 30 in June, 34 in
July, 26 in August, 140 in September and 94 in the first eight days of October. Core shows
the same curve (28 in May, 99 in September). Those September and October commits are mostly
agent-written and reviewed by me, including tens of thousands of lines of Svelte and
TypeScript I could not write by hand.

The honest reading: the architecture that made agents productive, one API with typed schemas,
thin clients, CI that runs the full suite on every draft, repo instructions that encode the
rules, was built by hand over 2024 and 2025. The agents are fast because the ground was
prepared. [responsible-ai.md](responsible-ai.md) has the guardrails and the bullets.

## Totals

| | |
|---|---|
| Own commits across the five repositories | about 3,000 (424 + 49 Rails, 999 Flask, 577 IDInet, 971 Core, 4 ProductionLog) |
| Lines of code at HEAD across the five | about 278,000, of which roughly 250,000 is the 2024-onward platform |
| Rewrites of the same domain | three (Swing to Rails, Rails to Flask, Flask to API-first) |
| Oldest app still in production | the 2019 Rails app |

## What the resume gets from this

One line, not the saga. Options:

- Built the company's production system four times as it outgrew each shape: a Java desktop
  app, a Rails web app (2019, still in production), a Flask monolith (2020), and an API-first
  platform with web, desktop and mobile clients (2024 to present).
- Evolved a single-user production log into an API-first platform serving seven client
  workloads, choosing each rewrite for a concrete constraint (multi-user, hosting, multiple
  client types) rather than for the framework.

For the Technologies block it justifies listing Ruby on Rails as past experience, with a year
range, and Java as "early".
