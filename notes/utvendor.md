# UT Vendor and K-ERP Scout (contract/B2B)

The vendor-tooling brand and its desktop app, SDK, CLI, Worker proxy, dashboard and docs. Newest first. Tags and rules: see [README](README.md).

## K-ERP Scout: Avalonia port, multi-platform CI, publishing standard (2026-10-02 to 2026-10-05)

**What:** K-ERP Scout is a B2B desktop app that checks artwork and licensing against a
client's legacy ERP. In one week: embroidery support in the Python SDK and the app, a UX
cohesion pass, a port from WPF to Avalonia 12 with CI building a Windows MSIX, an ad-hoc
signed macOS dmg and an Arch package, headless UI tests on Linux, a move to the public CDN
with an `.appinstaller` feed, syft SBOMs beside each release, errors-only crash reporting on
a separate tenant with an in-app off switch, and a written telemetry statement. The MSIX
packaging bug (the packaging project cannot handle a multi-target csproj) was found by
dumping the desktop-bridge targets on a Windows runner.

**My part:** the product decisions (what ships from a public CDN, what needs a login, who
signs, telemetry rules), release approvals, the user-facing docs direction. **AI part:** all
of the C#, the CI, the packaging fix. I do not write .NET. Tag: **ai-built**.

Suggested bullets:
- Own a cross-platform desktop app (C#/Avalonia; Windows MSIX, macOS, Linux) that validates
  artwork and licensing against a client's legacy ERP, from product decisions and release
  policy through signed releases, SBOMs and a public update feed.
- Wrote the publishing standard for a resold product (telemetry statement, errors-only crash
  reporting with an off switch, SBOM publication, immutable releases) and applied it before
  launch.

## UT Vendor product line refresh (2026-09-27 to 2026-10-05)

**What:** A small vendor-tooling brand around the same client ERP: a Python SDK (6.x) and
CLI, a Cloudflare Worker API proxy, a user dashboard with per-user GitHub-federated sign-in
and the user's own submitted issues, consolidated docs on one site, GitHub Issues as the
branded support portal behind Cloudflare Zero Trust, an anonymous-only art lookup on the web
with login-only lookups kept in the desktop app.

**My part:** the roadmap, the auth and privacy rules (never collect a user's credentials for
another organisation's system on the web apps), the information architecture. **AI part:**
the dashboard, docs site and SDK changes. Tag: **directed** (Python) and **ai-built**
(TypeScript sites) (confirm).

Suggested bullet:
- Own a B2B product line for a vendor-tooling brand: an ERP SDK and CLI, a Cloudflare Worker
  API proxy, a user dashboard with GitHub-federated sign-in, consolidated docs, and a support
  flow built on GitHub Issues behind Cloudflare Zero Trust.
