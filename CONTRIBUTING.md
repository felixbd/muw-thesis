# Contributing to muw-thesis

Thank you for your interest in contributing to the Medical University of Vienna thesis template!

## How to Contribute

### Reporting Issues

If you find a bug or have a feature request, please [open an issue](https://github.com/felixbd/muw-thesis/issues) and include:

- A clear description of the problem or request
- Steps to reproduce the issue (if applicable)
- The Typst version you are using (`make version`)
- The backend you are using (`nix`, `docker`, or `local`)

### Submitting Changes

1. Fork the repository and create a new branch from `main`.
2. Make your changes, keeping commits focused and descriptive.
3. Verify the thesis builds successfully before opening a pull request:
   ```bash
   make TYPST_BACKEND=local
   ```
4. Open a pull request with a clear description of what was changed and why.

### Coding Guidelines

- This project uses [Typst](https://typst.app/) for typesetting. Follow existing code style and formatting in `.typ` files.
- Keep changes minimal and focused — avoid unrelated cleanups in the same pull request.
- If you add a new Typst package dependency, document it in the README and ensure it is available on the [Typst Universe](https://typst.app/universe/).

### Building the Project

See the [README](./README.md) for full build instructions. A quick start:

```bash
# Using the nix backend (default)
make

# Using a locally installed Typst
make TYPST_BACKEND=local

# Using Docker
make TYPST_BACKEND=docker
```

## License

By contributing, you agree that your contributions will be licensed under the [MIT License](./LICENSE).
