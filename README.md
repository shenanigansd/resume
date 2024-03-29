# My resume

Canonical version is at https://bradleyreynolds.blob.core.windows.net/$web/Resume-BradleyReynolds.pdf

# Building Locally
## tlmgr
**Note you will need `perl` to install `tlmgr`**

`tlmgr` is used to manage tex live packages.

Install with https://tug.org/texlive/quickinstall.html.
I recommend running `install-tl` with these arguments:
```shell
$ perl ./install-tl --no-interaction --scheme=scheme-minimal --no-doc-install --no-src-install
```
which will download a minimal installation without docs and package sources.

## Resume deps
You can install the packages the resume depends on with
```shell
$ tlmgr install $(cat DEPENDS.txt)
```
which is a bit scuffed, but what can you do.

## Actually building it
`make` will build both an anonymous version and a not-anonymous version.

## Other ways to get TeX Live
It is also possible to get TeX Live without `tlmgr` through an OS's package manager (like `apt`).
