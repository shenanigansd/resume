# Infrastructure and IT (sysadmin)

Identity, endpoints, networking, supply chain, release engineering, investigations. Newest first. Tags and rules: see [README](README.md).

## File-share disconnect investigation (2026-06 to 2026-09)

**What:** A three-year file-share disconnect problem. Rewrote the tracking issue into three
distinct symptoms with an evidence plan, analysed 81 helpdesk tickets (about three a month,
dominated by three heavy users) and a domain-controller log capture. Ruled out Kerberos
hardening (NTLM 100% success), lockouts and password expiry. Narrowed to slow storage stalls,
the 15-minute autodisconnect, required SMB signing and a credential that was never
persisted. Found and filed a disabled account still authenticating every four hours from a
re-joined workstation. Still open; the A/B test on credential persistence decides it.

**My part:** the captures, the hypotheses, the ticket export, the client-side tests. **AI
part:** the log analysis and the issue rewrite. Tag: **hands-on** with directed analysis.

Suggested bullet (sysadmin):
- Led a root-cause investigation of a three-year file-share disconnect problem using 81
  helpdesk tickets and domain-controller event logs, ruling out authentication and lockouts
  and narrowing it to storage stalls and credential persistence.

## Supply chain and release engineering (2025 to 2026)

**What:** Reusable GitHub Actions workflows at SLSA Build L3 (build, sign and attest inside
the trusted workflow), OIDC federated credentials to Azure and Cloudflare with no stored
secrets, per-plane GitHub Environments so one merge cannot change DNS, identity and workloads
at once, Azure Trusted Signing for MSIX, automated MSIX publish to Intune through Microsoft
Graph, Dependabot on every ecosystem, CODEOWNERS on workflow files, hardware keys and FIDO2
on the accounts. Learned the hard way that GitHub OIDC subjects became immutable on
2026-07-15 and that SLSA L3 requires the build itself inside the reusable workflow.

**My part:** this one is mostly mine. Tag: **hands-on** (confirm which pieces agents drafted).

Suggested bullets:
- Standardised CI/CD across an 18-repository GitHub Enterprise Cloud tenant on reusable
  workflows at SLSA Build L3, with OIDC federation to Azure and Cloudflare in place of stored
  secrets and Azure Trusted Signing for desktop packages.
- Built the Windows desktop release train: tag-driven MSIX build, cloud code signing,
  provenance attestation and automated publish to Intune via Microsoft Graph.

## Identity and endpoint platform (2019 to present, already on the sysadmin resume)

Entra-native join, SharePoint migration, Windows Update for Business and Autopatch, Defender
for Endpoint and Sentinel, Cloudflare Zero Trust (Access, WARP, Tunnels) with Entra as IdP
and SCIM, Intune-managed Windows and Android (dedicated-device mode), Proxmox and Docker
Compose with Traefik and CoreDNS, DNS as code with OctoDNS. Tag: **hands-on**.

Suggested bullets (sysadmin, additions):
- Moved remote access to Cloudflare Zero Trust (Access, WARP, Tunnels) with Entra ID as the
  identity provider and SCIM provisioning.
- Run DNS, app registrations and deployment manifests as code with per-plane deployment
  credentials, so one merge cannot change identity, DNS and workloads at once.
- Package, sign and deploy Windows desktop software to the Intune fleet (MSIX, Azure Trusted
  Signing, Microsoft Graph publishing); manage Android scanners in dedicated-device mode.
