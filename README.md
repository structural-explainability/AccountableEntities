# Structural Explainability: Accountable Entities

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Build Status](https://github.com/civic-interconnect/AccountableEntities/actions/workflows/ci.yml/badge.svg)
[![Check Links](https://github.com/civic-interconnect/AccountableEntities/actions/workflows/links.yml/badge.svg)](https://github.com/civic-interconnect/AccountableEntities/actions/workflows/links.yml)

> This repository formalizes the mapping from named entity kinds to the six necessary and sufficient identity regimes established in the ontological neutrality proof series.

## Repository Structure

- `Main.lean` - Executable

- In StructuralExplainability.AccountableEntities:

- `EntityKinds.lean` - Defines core and extended named entity types
- `RegimeMapping.lean` - Formal mappings to the six identity regimes
- `MappingJustification.lean` - Semantic rationale for each mapping
- `Coverage.lean` - Completeness and correctness proofs


## The Six Identity Regimes

1. **ActorBound (k1)** - Identity bound to agent with persistent self
2. **LocusBound (k2)** - Identity bound to spatial position or reference frame
3. **InstrumentBound (k3)** - Identity bound to tool, method, or mechanism
4. **EventBound (k4)** - Identity bound to temporal occurrence
5. **ScopeBound (k5)** - Identity bound to boundary, domain, or context
6. **ObservationBound (k6)** - Identity bound to measurement or attestation

## Core Mappings

| Entity Kind | Identity Regime | Justification |
|-------------|----------------|---------------|
| Actor | ActorBound | Agency, persistent identity, accountability |
| Locus | LocusBound | Spatial extent, stable position, site, asset |
| Event | EventBound | Temporal extent, represents change |
| Instrument | InstrumentBound | Tool, document, model |
| Scope | ScopeBound | Defines procedural or jurisdicational boundaries |
| Observation | ObservationBound | Observation |

## Build and Run
```bash
lake build
lake exe ae
```

## Context

Part of Structural Explainability.

This repository is designed to interoperate with the neutral substrate
and identity-regime results of the Structural Explainability framework,
which establish six identity regimes as necessary and sufficient for
maintaining a neutral substrate that supports persistent disagreement.

## License

[MIT](./LICENSE)
