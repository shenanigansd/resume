# Side projects and tooling

One-off tools, reverse engineering, volunteer work. Newest first. Tags and rules: see [README](README.md).

## Printer service-report decoder (2026-10-06 to 2026-10-07)

**What:** A flatbed printer vendor's service tool exports encrypted reports. Decoded the
format by running the tool's own 2,304-byte codec under Unicorn CPU emulation, then rebuilt
the printer's report-fetch protocols (LPD, SNMP, framed TCP) as a Python CLI with 175 pytest
tests against fake printers, validated on the shop's real machine. Vendor binaries were
analysed statically only.

**My part:** the ask, the hardware validation, the Python project conventions (latest
Python, uv project, ruff strict, no abbreviations). **AI part:** the reverse engineering and
the code. Tag: **directed**.

Suggested bullet (Projects section):
- Reverse-engineered a flatbed printer's encrypted service-report format by emulating the
  vendor codec under Unicorn, and rebuilt its LPD/SNMP/TCP fetch protocols as a tested Python
  CLI validated on hardware.
