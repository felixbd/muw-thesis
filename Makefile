##
# Medical University of Vienna - Thesis template
# 2026 (c) Felix D.
#
# @file
# @version 0.1

# Select typst backend: nix, docker, or local
# Override from command line: `make TYPST_BACKEND=docker`
TYPST_BACKEND ?= nix

# Typst version for nix backend
# Override from command line: `make TYPST_VERSION=ec2389e`
TYPST_VERSION ?= ec2389e  # typst 0.14.2 (ec2389e)

# Configure TYPST command based on selected backend
ifeq ($(TYPST_BACKEND),nix)
    TYPST_FLAKE := github:typst/typst-flake/$(TYPST_VERSION)
    TYPST := nix run $(TYPST_FLAKE) --
else ifeq ($(TYPST_BACKEND),docker)
    TYPST := docker run --rm -v "$(PWD)":/work -w /work ghcr.io/typst/typst:latest
else ifeq ($(TYPST_BACKEND),local)
    TYPST := typst
else
    $(error Invalid TYPST_BACKEND: $(TYPST_BACKEND). Valid options: nix, docker, local)
endif

GIT_VERSION := $(shell git describe --tags --first-parent --abbrev=6 --long --always --dirty)

# PDF standard specification
# Possible values: 1.4, 1.5, 1.6, 1.7, 2.0, a-1b, a-1a, a-2b, a-2u, a-2a, a-3b, a-3u, a-3a, a-4, a-4f, a-4e, ua-1
PDF_STANDARD := "a-3b"

# Typst compilation flags
# Date formats: --iso-8601=min, --rfc-3339=sec, --rfc-email
# Additional options: --font-path ~/fonts/, --make-deps, --ignore-system-fonts
FLAGS := --pdf-standard $(PDF_STANDARD) \
	--input gitversion=$(GIT_VERSION) \
	--input date="`date`"

SRC := main.typ
OUT := main.pdf


default: $(OUT) open

$(OUT): $(SRC)
	$(TYPST) compile $(FLAGS) $< $@

w: watch

watch: $(OUT) open
	# Note: date will not update when recompiled
	$(TYPST) watch $(FLAGS) $(SRC) $(OUT)

o: open

open: $(OUT)
	@xdg-open $(OUT)

c: clean

.PHONY: clean
clean:
	rm -f $(OUT)

# Publishing example:
# rsync -avPz --mkpath -e 'ssh' ./*.pdf domain:/path/to/public-thesis-dir/

# Compression example:
# ps2pdf -dPDFSETTINGS=/ebook $(OUT) "./thesis-compressed.pdf"

# Spell checking example:
# cat thesis.org | aspell --lang=en list | uniq | wc -l
# aspell --lang=en -c thesis.org

# end
