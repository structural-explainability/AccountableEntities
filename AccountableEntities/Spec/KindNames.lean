-- Archived.
-- Retired and no longer authoritative. See repository README.md.
import AccountableEntities.Spec.Kind

namespace AccountableEntities.Spec

-- Repo: structural-explainability/AccountableEntities
-- Path: AccountableEntities/Spec/KindNames.lean

/-!
Accountable Entities (AE) -- Kind Name Abbreviations

This file introduces human-readable names for AE v1 kinds.
These are definitional abbreviations only.

Structural content, proofs, and conformance depend on `Kind.K1 .. Kind.K6`,
not on these names. Renaming here has no semantic effect.
-/


/-- Accountable agent with agency. -/
abbrev Actor : Kind := Kind.K1

/-- Accountable place, site, or asset locus. -/
abbrev Locus : Kind := Kind.K2

/-- Accountable artifact, mechanism, or authority-bearing means. -/
abbrev Instrument : Kind := Kind.K3

/-- Accountable temporally bounded occurrence. -/
abbrev Event : Kind := Kind.K4

/-- Accountable interpretive or jurisdictional boundary. -/
abbrev Scope : Kind := Kind.K5

/-- Accountable recorded claim, measurement, or assertion. -/
abbrev Observation : Kind := Kind.K6

end AccountableEntities.Spec
