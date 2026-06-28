set shell := ["bash", "-cu"]
set windows-shell := ["pwsh", "-Command"]

composer := "$(which composer.phar)"

vendor_bin := "vendor/bin/"
mago := vendor_bin + "mago"

# Default action
_:
    just --list -u

# Install dependencies
i:
    {{composer}} install

# Update dependencies
up:
    {{composer}} update

# Format code
fmt:
    ./{{mago}} format

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

# Analyze code
analyze:
    ./{{mago}} analyze --unsafe --fix

# Check code
check:
    just fmt
    just ls-lint
    just typos
    just lint
    just analyze

# Clean (Linux)
clean-linux:
    rm -rf ./vendor

# Clean (macOS)
clean-macos:
    just clean-linux

# Clean (Windows)
clean-windows:
    if (Test-Path "./vendor") { Remove-Item -Recurse -Force "./vendor" }

# Clean
clean:
    just clean-{{os()}}
