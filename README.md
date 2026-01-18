# muw-thesis
Medical University of Vienna thesis template

> [!NOTE]
> This is not an official template, but it is strongly based on one.
> The target audience is primarily medical informatics graduates from MedUni,
> but this template can also be used for writing dissertations in medicine,
> dentistry or molecular precision medicine.
> It should also be fairly easy to adapt for doctoral programmes or PhDs.
> 
> - https://www.meduniwien.ac.at/web/studierende/service-center/meduni-wien-vorlagen/
> - https://www.meduniwien.ac.at/web/studierende/mein-studium/masterstudium-medizinische-informatik/masterarbeit/
> - https://ub.meduniwien.ac.at/fileadmin/content/OE/ub/dokumente/MusterfuerAbschlussarbeit2025.docx
> - https://www.meduniwien.ac.at/web/studierende/mein-studium/diplomstudium-humanmedizin/diplomarbeit/
> - https://ub.meduniwien.ac.at/services/plagiatspruefung/


### see [pdf](./thesis-out.pdf)


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
