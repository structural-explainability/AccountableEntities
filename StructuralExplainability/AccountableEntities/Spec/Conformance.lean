import StructuralExplainability.AccountableEntities.Spec.Kind
import StructuralExplainability.AccountableEntities.Spec.KindNames

namespace StructuralExplainability.AccountableEntities.Spec

/-!
Accountable Entities (AE) -- Conformance Predicate (v1, named kinds)

This file keeps the internal Kind constructors as K1..K6 for stability,
and introduces named kind requirements at the specification layer.

Names are mapped to K1..K6 using abbrev declarations in:
- AccountableEntities/Spec/KindNames.lean

Conformance evidence fields and requirement names align with AE SPEC.md
identifiers (AE.KIND.ACTOR, AE.KIND.LOCUS, etc.).
-/

/-- Conjunction of a list of propositions. -/
def AndList : List Prop -> Prop
| [] => True
| p :: ps => p ∧ AndList ps

section

/- Placeholder wiring: integrate with SE later. -/
variable {SEEvidence : Type}

/- Placeholder: "this artifact conforms to SE". Replace with SE.Conforms. -/
variable (SEConforms : SEEvidence -> Prop)

/- Abstract identity regime type (left uninterpreted at this layer). -/
variable (Regime : Type)

/- Kind-to-regime mapping. -/
variable (kindToRegime : Kind -> Regime)

/-
AE v1 requirements as stable propositions.

Fields are alphabetized by identifier name to reduce editorial discretion.
-/
structure ConformanceEvidence where
  AE_CONFORMANCE_SE_REQUIRED : Prop
  AE_DEFINITION_CORE : Prop
  AE_EXTENSION_ADMISSIBILITY : Prop
  AE_EXTENSION_VERSIONED_ONLY : Prop
  AE_IDENTITY_REGIME_MAPPING : Prop
  AE_KIND_CLOSED_SET_V1 : Prop
  AE_KIND_EXACT_COUNT_V1 : Prop

  AE_KIND_ACTOR : Prop
  AE_KIND_EVENT : Prop
  AE_KIND_INSTRUMENT : Prop
  AE_KIND_LOCUS : Prop
  AE_KIND_OBSERVATION : Prop
  AE_KIND_SCOPE : Prop

  AE_SCOPE_EXCLUSIONS : Prop

/-- Alphabetized requirements list for AE v1. -/
def requirements (e : ConformanceEvidence) : List Prop :=
  [ e.AE_CONFORMANCE_SE_REQUIRED
  , e.AE_DEFINITION_CORE
  , e.AE_EXTENSION_ADMISSIBILITY
  , e.AE_EXTENSION_VERSIONED_ONLY
  , e.AE_IDENTITY_REGIME_MAPPING
  , e.AE_KIND_ACTOR
  , e.AE_KIND_CLOSED_SET_V1
  , e.AE_KIND_EVENT
  , e.AE_KIND_EXACT_COUNT_V1
  , e.AE_KIND_INSTRUMENT
  , e.AE_KIND_LOCUS
  , e.AE_KIND_OBSERVATION
  , e.AE_KIND_SCOPE
  , e.AE_SCOPE_EXCLUSIONS
  ]

/-- AE conformance predicate: all AE requirements hold. -/
def Conforms (e : ConformanceEvidence) : Prop :=
  AndList (requirements e)

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
  -- unfold Conforms to get AndList (requirements e)
  unfold Conforms at hconf
  exact andList_of_mem (ps := requirements e) (p := p) hmem hconf

/-- Injectivity of kind->regime (distinct kinds correspond to distinct regimes). -/
def kindToRegimeInjective : Prop :=
  Function.Injective kindToRegime

end

end StructuralExplainability.AccountableEntities.Spec
