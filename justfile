set shell := ["bash", "-cu"]
set windows-shell := ["pwsh", "-Command"]

composer := "$(which composer.phar)"
oxfmt := "pnpm exec oxfmt"

vendor_bin := "vendor/bin/"
mago := vendor_bin + "mago"

# Default action
_:
    just --list -u

# Install dependencies
i:
    {{composer}} install
    pnpm install

# Update dependencies
up:
    {{composer}} update

# Format code
fmt:
    {{oxfmt}}

# Lint code with ls-lint
ls-lint:
    ls-lint -config ./.ls-lint.yaml

# Lint code with ls-lint
lslint: ls-lint

# Lint code with typos-cli
typos:
    typos

# Lint code
lint:
    ./{{mago}} lint --unsafe --fix

# Check code
check: fmt ls-lint typos lint

# Clean (Linux)
clean-linux:
    rm -rf ./node_modules
    rm -rf ./vendor

# Clean (macOS)
clean-macos:
    just clean-linux

# Clean (Windows)
clean-windows:
    if (Test-Path "./node_modules") { Remove-Item -Recurse -Force "./node_modules" }
    if (Test-Path "./vendor") { Remove-Item -Recurse -Force "./vendor" }

# Clean
clean:
    just clean-{{os()}}
