##
# Medical University of Vienna - Thesis template
# 2026 (c) Felix D.
#
# @file
# @version 0.1

# !/usr/bin/env nix-shell
# !nix-shell --pure -i Rscript
# SHELL := /bin/zsh

# overriding the version from the command line
#  `make TYPST_VERSION=ec2389e`
TYPST_VERSION ?= ec2389e  # typst 0.14.2 (ec2389e)
TYPST_FLAKE   := github:typst/typst-flake/$(TYPST_VERSIOIN)
TYPST         := nix run $(TYPST_FLAKE) --

# or use docker ...
# docker run --rm -v "$PWD":/work ghcr.io/typst/typst:latest --version

GIT_VERSION := $(shell git describe --tags --first-parent --abbrev=6 --long --always --dirty)

# possible values:
# [1.4, 1.5, 1.6, 1.7, 2.0,
#  a-1b, a-1a, a-2b, a-2u, a-2a, a-3b,
#  a-3u, a-3a, a-4, a-4f, a-4e, ua-1]
PDF_STANDARD := "a-3b"  # "a-1b"

FLAGS := --pdf-standard $(PDF_STANDARD) \
	--input gitversion=$(GIT_VERSION) \
	--input date="`date`"

# date {--iso-8601=min, --rfc-3339=sec, --rfc-email}
# --font-path ~/fonts/ \
# --make-deps --ignore-system-fonts


SRC := main.typ
OUT := main.pdf


default: $(OUT) open
# default: w

$(OUT): $(SRC)
	$(TYPST) compile $(FLAGS) $< $@


w: watch

watch: $(OUT) open
	# note: date will not update when recompiled
	$(TYPST) watch $(FLAGS) $(SRC) $(OUT)


o: open

open: $(OUT)
	@xdg-open $(OUT)  # firefox


# ps2pdf -dPDFSETTINGS=/ebook $(OUT) "./thesis-compressed.pdf"

# publish:
#	rsync -avPz --mkpath -e 'ssh' ./*.pdf domain:/path/to/public-thesis-dir/

# spell:
#	# cat thesis.org | aspell --lang=en list | uniq | wc -l
#	aspell --lang=en -c thesis.org


c: clean

.PHONY: clean
clean:
	rm -f $(OUT)

# end
