# Mago Configuration

A shareable Mago configuration.

## Installation

Install these packages as a dev dependencies in the project:

```sh
composer rerquire alpheus/mago
```

## Usage

Implement the configuration into `mago.toml`:

```toml
extends = "vendor/alpheus/mago"

[source]
paths = [
    "./src",
]
```

Or go with different presets:

```toml
extends = [
    "vendor/alpheus/mago",
    "vendor/alpheus/mago/presets/psl",
    "vendor/alpheus/mago/presets/phpunit",
]

[source]
paths = [
    "./src",
]
```

## License

This project is licensed under the terms of the MIT license.
