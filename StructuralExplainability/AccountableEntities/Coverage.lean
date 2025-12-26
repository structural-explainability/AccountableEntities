-- StructuralExplainability/AccountableEntities/Coverage.lean
/-
Completeness and correctness proofs for the entity-kind -> identity-regime mapping.

This file proves that the core mapping is bijective and that the inverse
enumeration regimeInstances is correct (sound and complete) without relying
on Classical.choose.

Reminders:
- A function is injective if different inputs never map to the same output.
- A function is surjective if every possible output is hit by some input.
- A function is bijective if it is both injective and surjective.
-/

import StructuralExplainability.AccountableEntities.RegimeMapping

namespace StructuralExplainability.AccountableEntities

open NamedEntityKind
open IdentityRegime

/-- All core entity kinds (the six). -/
def allKinds : List NamedEntityKind :=
  [.Actor, .Locus, .Instrument, .Event, .Scope, .Observation]

/-- All identity regimes (the six). -/
def allRegimes : List IdentityRegime :=
  [.ActorBound, .LocusBound, .InstrumentBound, .EventBound, .ScopeBound, .ObservationBound]

/-- Surjectivity: every regime is hit by some core kind. -/
theorem mapCoreToRegime_surjective :
    ∀ r : IdentityRegime, ∃ k : NamedEntityKind, mapCoreToRegime k = r := by
  intro r
  cases r with
  | ActorBound =>
      exact ⟨.Actor, rfl⟩
  | LocusBound =>
      exact ⟨.Locus, rfl⟩
  | InstrumentBound =>
      exact ⟨.Instrument, rfl⟩
  | EventBound =>
      exact ⟨.Event, rfl⟩
  | ScopeBound =>
      exact ⟨.Scope, rfl⟩
  | ObservationBound =>
      exact ⟨.Observation, rfl⟩

/-- Injectivity: equal images imply equal kinds. -/
theorem mapCoreToRegime_injective :
    ∀ k1 k2 : NamedEntityKind,
      mapCoreToRegime k1 = mapCoreToRegime k2 -> k1 = k2 := by
  intro k1 k2 h
  cases k1 <;> cases k2 <;> simp [mapCoreToRegime] at h <;> cases h <;> rfl

/-- Bijectivity packaged. -/
theorem mapCoreToRegime_bijective :
    (∀ r : IdentityRegime, ∃ k : NamedEntityKind, mapCoreToRegime k = r) /\
    (∀ k1 k2 : NamedEntityKind, mapCoreToRegime k1 = mapCoreToRegime k2 -> k1 = k2) := by
  exact ⟨mapCoreToRegime_surjective, mapCoreToRegime_injective⟩

/-- List-level completeness: mapping allKinds produces allRegimes. -/
theorem allKinds_maps_to_allRegimes :
    List.map mapCoreToRegime allKinds = allRegimes := by
  rfl

/-
regimeInstances: correctness facts
-/

/-- regimeInstances returns a singleton list for each regime (core six). -/
theorem regimeInstances_singleton :
    ∀ r : IdentityRegime, ∃ k : NamedEntityKind, regimeInstances r = [k] := by
  intro r
  cases r <;> (first | (exact ⟨.Actor, rfl⟩) | (exact ⟨.Locus, rfl⟩) | (exact ⟨.Instrument, rfl⟩) | (exact ⟨.Event, rfl⟩) | (exact ⟨.Scope, rfl⟩) | (exact ⟨.Observation, rfl⟩))


/--
Soundness: any kind listed as an instance of regime r maps back to r.
-/
theorem regimeInstances_sound :
    ∀ r : IdentityRegime, ∀ k : NamedEntityKind,
      k ∈ regimeInstances r -> mapCoreToRegime k = r := by
  intro r k hk
  cases r <;> simp [regimeInstances] at hk <;> cases hk <;> rfl

/--
Completeness: regimeInstances always contains some preimage of r.
-/
theorem regimeInstances_complete :
    ∀ r : IdentityRegime, ∃ k : NamedEntityKind, k ∈ regimeInstances r := by
  intro r
  cases r with
  | ActorBound =>
      exact ⟨.Actor, by simp [regimeInstances]⟩
  | LocusBound =>
      exact ⟨.Locus, by simp [regimeInstances]⟩
  | InstrumentBound =>
      exact ⟨.Instrument, by simp [regimeInstances]⟩
  | EventBound =>
      exact ⟨.Event, by simp [regimeInstances]⟩
  | ScopeBound =>
      exact ⟨.Scope, by simp [regimeInstances]⟩
  | ObservationBound =>
      exact ⟨.Observation, by simp [regimeInstances]⟩

/--
Uniqueness: each regime has exactly one core instance in regimeInstances.
(Expressed as length = 1.)
-/
theorem regimeInstances_unique_length :
    ∀ r : IdentityRegime, (regimeInstances r).length = 1 := by
  intro r
  cases r <;> rfl

end StructuralExplainability.AccountableEntities
