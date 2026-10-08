# Responsible AI use

The honest framing: I am a Python developer and sysadmin who, in 2026, directs AI coding
agents across a seven-application estate, including three stacks I cannot write by hand
(Svelte/TypeScript, C#/.NET, Kotlin). Output went from what one person types to tens of
thousands of lines a month. What makes that responsible rather than reckless is the set of
guardrails below. These are the bullets that say so.

**Guardrails for consistency (the AGENTS.md story).** Every repository carries
version-controlled, machine-readable instructions that every contributor's agent reads,
whichever harness they use. Architecture rules (API boundaries, no beta or legacy layers,
migration conventions, attribution trailers) live there, so generated code from any
contributor follows the same rules, and a rule change is a reviewed commit rather than a
conversation.

- Keep AI-generated contributions consistent across a multi-contributor estate with
  version-controlled, machine-readable repository instructions that every agent harness
  reads, so architecture rules apply to generated code regardless of who prompted it.

**Structural enforcement over prose.** Instructions explain intent; CI prevents. Import-
isolation tests, contrast tests, sharded full suites on every draft PR, branch protection
with bypass logging, CODEOWNERS review on the API and on workflow files.

- Treat repository instructions as policy and CI as enforcement: import-isolation and
  accessibility tests, full sharded suites on every draft PR, and CODEOWNERS gates make the
  wrong generated code unmergeable rather than merely discouraged.

**Human-owned decisions.** Data model and migration review is never skipped; architecture
and UX decisions are mine and recorded; agents propose, people decide.

- Keep schema, migration and architecture decisions human-owned and recorded in decision
  records, while delegating implementation to agents.

**Intake before merge.** Agent output enters as a spec issue (a claim) rather than a PR (a
demand), and is classified into a fast lane or an RFC lane before anyone writes code.

- Route agent-generated proposals through a spec and decision-record intake so they are
  evaluated as claims before they become pull requests.

**Attribution and audit.** Commits from agents carry both a `Co-authored-by` trailer for
visibility and an `Assisted-by: <harness>:<model>` trailer for machine-readable audit. A
daily automated audit compares the organisation's PRs and issues against the roadmap.

- Mandate machine-readable attribution on every AI-assisted commit and run a daily automated
  audit of open work against the roadmap, so AI contribution is visible and reviewable.

**Knowing the boundary.** In stacks I do not write, I own requirements, acceptance tests and
behaviour review rather than line-level review, and I say so.

- Direct AI agents in stacks outside my own (Svelte, .NET, Kotlin) by owning requirements,
  acceptance tests and behavioural review, and disclose that split rather than claim the code.

**Telemetry and privacy posture for AI-built products.** The resold desktop app ships with a
published telemetry statement, errors-only crash reporting, an in-app off switch and SBOMs.

Interview version, in one breath: "I'm a Python and infrastructure person. Since 2025 I've
run a one-person engineering function by directing coding agents. I own the architecture,
the data model, the review gates and the operations; the agents write most of the code,
including in three stacks I couldn't hand-write. The way I keep that safe is version-
controlled agent instructions in every repo, CI that enforces what the instructions say,
mandatory attribution trailers, and human review on anything that touches the schema."
