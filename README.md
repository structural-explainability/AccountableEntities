# Structural Explainability: Accountable Entities

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
![Build Status](https://github.com/structural-explainability/AccountableEntities/actions/workflows/ci-lean.yml/badge.svg?branch=main)
[![Check Links](https://github.com/structural-explainability/AccountableEntities/actions/workflows/links.yml/badge.svg)](https://github.com/structural-explainability/AccountableEntities/actions/workflows/links.yml)

> Lean 4 formalization of Accountable Entities (AE): six named entity kinds and their mapping to six identity regimes.

## Core Mapping (AE -> Identity Regime)

| Entity Kind | Identity Regime  |
| ----------- | ---------------- |
| Actor       | ActorBound       |
| Locus       | LocusBound       |
| Instrument  | InstrumentBound  |
| Event       | EventBound       |
| Scope       | ScopeBound       |
| Observation | ObservationBound |

This mapping is total and one-to-one over the six accountable entity kinds.
Formal coverage properties are proven in Lean.

## Build and Run

```bash
lake update
lake build
lake exe verify
```

## Annotations

[Annotations.md](./ANNOTATIONS.md)

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)
