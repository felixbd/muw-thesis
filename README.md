# muw-thesis
Medical University of Vienna thesis template

## Building

Build the thesis using `make`:

```bash
make
```

### Typst Backend Selection

You can select which Typst backend to use by setting the `TYPST_BACKEND` variable:

- **nix** (default): Uses Nix to run Typst
  ```bash
  make TYPST_BACKEND=nix
  ```
  
  You can also specify a different Typst version when using nix:
  ```bash
  make TYPST_BACKEND=nix TYPST_VERSION=ec2389e
  ```

- **docker**: Uses Docker with the official Typst image
  ```bash
  make TYPST_BACKEND=docker
  ```

- **local**: Uses locally installed Typst
  ```bash
  make TYPST_BACKEND=local
  ```

### Other Targets

- `make watch` or `make w`: Watch for changes and recompile automatically
- `make open` or `make o`: Open the generated PDF
- `make clean` or `make c`: Remove generated PDF
- `make thumbnail`: Generate PNG thumbnails of specific pages
- `make check`: Run typst package check
