-- Archived.
-- Retired and no longer authoritative. See repository README.md.
import AccountableEntities.Spec.Kind
import AccountableEntities.Spec.KindNames

namespace AccountableEntities.Conformance

/-!
# Accountable Entities (AE) Conformance Predicate Surface (v1)

REQ:
  Provide a single, deterministic, identifier-aligned conformance surface for AE v1.

WHY:
  AE identifiers are the sole normative references across prose, schema, and proof.
  Lean conformance evidence must therefore be keyed to the canonical identifiers,
  not to human-friendly names that may change.

OBS:
  - The canonical AE kind constructors are `Kind.K1 .. Kind.K6`.
  - Human-readable kind names (Actor/Locus/...) are definitional abbreviations only,
    defined in `AccountableEntities/Spec/KindNames.lean`.
  - Canonical AE v1 kind identifiers are `AE.KIND.K1 .. AE.KIND.K6`.
  - This file does not assign domain semantics; it only provides structural shapes.
-/


/-- Conjunction of a list of propositions. -/
def AndList : List Prop -> Prop
| [] => True
| p :: ps => p ∧ AndList ps

section

/- Abstract identity regime type (left uninterpreted at this layer). -/
variable (Regime : Type)

/- Kind-to-regime mapping. -/
variable (kindToRegime : Kind -> Regime)

/-
REQ.AE.CONFORMANCE.EVIDENCE:
  AE v1 requirements as stable propositions.

WHY:
  Fields are the Lean-level mirror of identifiers. This supports:
  - deterministic "exactly once" traceability, and
  - stable referencing from other Lean modules without relying on prose order.

OBS:
  Fields are alphabetized by canonical identifier name to reduce editorial discretion.
-/
structure ConformanceEvidence where
  AE_CONFORMANCE_SE_REQUIRED : Prop
  AE_DEFINITION_CORE : Prop
  AE_EXTENSION_ADMISSIBILITY : Prop
  AE_EXTENSION_VERSIONED_ONLY : Prop
  AE_IDENTITY_REGIME_MAPPING : Prop
  AE_KIND_CLOSED_SET_V1 : Prop
  AE_KIND_EXACT_COUNT_V1 : Prop
  AE_KIND_K1 : Prop
  AE_KIND_K2 : Prop
  AE_KIND_K3 : Prop
  AE_KIND_K4 : Prop
  AE_KIND_K5 : Prop
  AE_KIND_K6 : Prop
  AE_SCOPE_EXCLUSIONS : Prop

/-
REQ.AE.CONFORMANCE.REQUIREMENTS_LIST:

WHY:
  Conformance is defined as conjunction over this list.
  The list must preserve the same canonical, alphabetical order used everywhere else.

OBS:
  Alphabetical order here is by identifier string, not by KindNames.
-/
/-- Alphabetized requirements list for AE v1. -/
def requirements (e : ConformanceEvidence) : List Prop :=
  [ e.AE_CONFORMANCE_SE_REQUIRED
  , e.AE_DEFINITION_CORE
  , e.AE_EXTENSION_ADMISSIBILITY
  , e.AE_EXTENSION_VERSIONED_ONLY
  , e.AE_IDENTITY_REGIME_MAPPING
  , e.AE_KIND_CLOSED_SET_V1
  , e.AE_KIND_EXACT_COUNT_V1
  , e.AE_KIND_K1
  , e.AE_KIND_K2
  , e.AE_KIND_K3
  , e.AE_KIND_K4
  , e.AE_KIND_K5
  , e.AE_KIND_K6
  , e.AE_SCOPE_EXCLUSIONS
  ]

/-- AE conformance predicate: all AE requirements hold. -/
def Conforms (e : ConformanceEvidence) : Prop :=
  AndList (requirements e)

/-
REQ.AE.CONFORMANCE.EXTRACTOR:

WHY:
  Conformance evidence is often consumed indirectly.
  This lemma provides a stable way to extract any required proposition from Conforms.
-/
/- If `AndList ps` holds, then every member of `ps` holds. -/
theorem andList_of_mem {ps : List Prop} {p : Prop} :
    p ∈ ps -> AndList ps -> p := by
  intro hmem hand
  induction ps with
  | nil =>
      cases hmem
  | cons a as ih =>
      -- unfold gives hand : a ∧ AndList as
      dsimp [AndList] at hand
      have ha : a := hand.1
      have hrest : AndList as := hand.2
      have hmem' : p = a ∨ p ∈ as := by
        simpa using hmem
      cases hmem' with
      | inl hpa =>
          subst hpa
          exact ha
      | inr htail =>
          exact ih htail hrest

/-- Generic extractor: if `p` is a listed requirement and `Conforms` holds, then `p` holds. -/
theorem conforms_of_mem (e : ConformanceEvidence) (p : Prop) :
  p ∈ requirements e -> Conforms e -> p := by
  intro hmem hconf
  unfold Conforms at hconf
  exact andList_of_mem (ps := requirements e) (p := p) hmem hconf

/-
REQ.AE.IDENTITY.REGIME.MAPPING.INJECTIVE:

WHY:
  AE requires distinct kinds to correspond to distinct identity regimes.
  This is one structurally checkable formulation of that requirement.
-/
/-- Injectivity of kind->regime (distinct kinds correspond to distinct regimes). -/
def kindToRegimeInjective : Prop :=
  Function.Injective kindToRegime

end

end AccountableEntities.Conformance
