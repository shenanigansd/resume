"""Nox sessions."""

import shutil
from pathlib import Path

import nox

nox.options.default_venv_backend = "none"
nox.options.sessions = ["build_pdfs"]

SRC_DIR = Path("src")
BUILD_DIR = Path("build")


@nox.session
def build_pdfs(session: nox.Session) -> None:
    """Build PDFs from LaTeX sources."""
    BUILD_DIR.mkdir(exist_ok=True)
    for src_file in SRC_DIR.iterdir():
        session.run(
            "typst",
            str(src_file),
            Path(BUILD_DIR, src_file.with_suffix(".pdf").name)
        )


@nox.session
def clean(_: nox.Session) -> None:
    """Clean build artifacts."""
    shutil.rmtree(BUILD_DIR, ignore_errors=True)
