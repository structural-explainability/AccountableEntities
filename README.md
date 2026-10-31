# ARCHIVED: Retired Research

> **Status:** Retired October 2026. No longer maintained.
>
> This repository preserves an earlier Lean 4 formalization developed
> during the Structural Explainability research program.
> It informed the current research, which no longer builds on it.
>
> Its definitions, assumptions, and results
> **no longer authoritative** and do not reflect current Structural
> Explainability theory.
>
> It is preserved unchanged for historical reference and
> research provenance.
>
> Current formalizations are maintained in
> [Structural Explainability](https://github.com/structural-explainability)
> in the **`se-theory-` repositories**.

---

## Structural Explainability: Accountable Entities

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
![Build Status](https://github.com/structural-explainability/AccountableEntities/actions/workflows/ci-lean.yml/badge.svg?branch=main)
[![Check Links](https://github.com/structural-explainability/AccountableEntities/actions/workflows/links.yml/badge.svg)](https://github.com/structural-explainability/AccountableEntities/actions/workflows/links.yml)

> Lean 4 formalization of Accountable Entities (AE):
> the six named entity kinds,
> and their conformance mapping onto the canonical identity-regime profiles
> defined in `se-theory-identity-regimes`.

## Entity Kinds

AE defines six accountable entity kinds (ALIESO).
This is AE's own axis: _what kind of thing_ a record refers to.
These are intended to be used directly as types by downstream information systems.

| Entity Kind | Letter | Meaning                                     |
| ----------- | ------ | ------------------------------------------- |
| Actor       | A      | Agents with standing (person, organization) |
| Locus       | L      | Site, asset, or place                       |
| Instrument  | I      | Document, tool, or artifact                 |
| Event       | E      | Temporal occurrence                         |
| Scope       | S      | Jurisdiction or boundary                    |
| Observation | O      | Dataset, measurement, or attestation        |

## Mapping to Identity-Regime Profiles

Identity regimes are **not** defined here.
The six regime _families_ and their refinement into nine regime _profile kinds_ are owned by
[`se-theory-identity-regimes`](https://github.com/structural-explainability/se-theory-identity-regimes).
Lean is the source of truth, certified against the `regime-*.toml` registries.
AE references those profile kinds; it does not redefine them.

Entity kind and identity-regime profile are distinct axes:
_what a thing is_ versus _how its identity persists under transformation_.
They are related.
Each profile carries an identity basis
(`locus`, `instrument`, event-`extension`,
`scope`/`structure`, `content`, single referential continuity),
and several of those bases correspond directly to entity kinds.
The mapping below assigns each entity kind the profile(s)
whose basis it satisfies.
It is generally one-to-many, not a bijection.

| Entity Kind | Identity-Regime Profile(s)         | Profile Basis                 |
| ----------- | ---------------------------------- | ----------------------------- |
| Locus       | `ENR_L`                            | locus                         |
| Instrument  | `ENR_I`                            | instrument                    |
| Observation | `REC` _(proposed)_                 | single referential continuity |
| Actor       | _(assign)_                         | —                             |
| Event       | _(assign: `OCC` and/or `CTX_E`)_   | occurrence / event-extension  |
| Scope       | _(assign: `CTX_S` and/or `NOR_S`)_ | scope / structure             |

Profiles are drawn from the canonical nine:
`OBL`, `OCC`, `REC`, `ENR_L`, `ENR_I`, `CTX_E`, `CTX_S`, `NOR_C`, `NOR_S`.

## Build and Run

```bash
lake update
lake build
lake exe verify

npx markdownlint-cli2 --fix
```

## Annotations

[Annotations.md](./ANNOTATIONS.md)

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)
