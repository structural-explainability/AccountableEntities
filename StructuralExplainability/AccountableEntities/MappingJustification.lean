-- StructuralExplainability/AccountableEntities/MappingJustification.lean
/-
Semantic justification for entity-to-regime mappings.
Formalizes the rationale for why each entity kind maps to its assigned regime.
-/

import StructuralExplainability.AccountableEntities.RegimeMapping

namespace StructuralExplainability.AccountableEntities

/--
An entity is appropriately ActorBound when it exhibits agency and persistent identity.
-/
structure ActorProperties where
  hasAgency : Bool
  persistentIdentity : Bool
  accountable : Bool
  deriving Repr

/--
An entity is appropriately LocusBound when identity derives from spatial position.
-/
structure LocusProperties where
  spatialExtent : Bool
  stablePosition : Bool
  spatialPersistence : Bool
  deriving Repr

/--
An entity is appropriately InstrumentBound when it serves as tool or mechanism.
-/
structure InstrumentProperties where
  mediatesAction : Bool
  operable : Bool
  functionalIdentity : Bool
  deriving Repr

/--
An entity is appropriately EventBound when identity is a temporal occurrence.
-/
structure EventProperties where
  temporalExtent : Bool
  representsChange : Bool
  temporallyIndexed : Bool
  deriving Repr

/--
An entity is appropriately ScopeBound when identity defines boundaries or domains.
-/
structure ScopeProperties where
  definesBoundaries : Bool
  establishesContext : Bool
  extensionalIdentity : Bool
  deriving Repr

/--
An entity is appropriately ObservationBound when identity is measurement/attestation.
-/
structure ObservationProperties where
  attestsToFacts : Bool
  observationalIdentity : Bool
  providesEvidence : Bool
  deriving Repr

/--
Boolean-valued justification predicates (intentionally lightweight).
These say what must be true for a paradigm instance of each regime.
-/
def IsActorBound (p : ActorProperties) : Prop :=
  p.hasAgency = true /\
  p.persistentIdentity = true /\
  p.accountable = true

def IsLocusBound (p : LocusProperties) : Prop :=
  p.spatialExtent = true /\
  p.stablePosition = true /\
  p.spatialPersistence = true

def IsInstrumentBound (p : InstrumentProperties) : Prop :=
  p.mediatesAction = true /\
  p.operable = true /\
  p.functionalIdentity = true

def IsEventBound (p : EventProperties) : Prop :=
  p.temporalExtent = true /\
  p.representsChange = true /\
  p.temporallyIndexed = true

def IsScopeBound (p : ScopeProperties) : Prop :=
  p.definesBoundaries = true /\
  p.establishesContext = true /\
  p.extensionalIdentity = true

def IsObservationBound (p : ObservationProperties) : Prop :=
  p.attestsToFacts = true /\
  p.observationalIdentity = true /\
  p.providesEvidence = true

/-
Core exemplars (you can rename these later to match your paper language).
-/

def personJustification : ActorProperties :=
  { hasAgency := true
  , persistentIdentity := true
  , accountable := true
  }

def organizationJustification : ActorProperties :=
  { hasAgency := true
  , persistentIdentity := true
  , accountable := true
  }

def locationJustification : LocusProperties :=
  { spatialExtent := true
  , stablePosition := true
  , spatialPersistence := true
  }

def documentJustification : InstrumentProperties :=
  { mediatesAction := true
  , operable := true
  , functionalIdentity := true
  }

def eventJustification : EventProperties :=
  { temporalExtent := true
  , representsChange := true
  , temporallyIndexed := true
  }

def policyScopeJustification : ScopeProperties :=
  { definesBoundaries := true
  , establishesContext := true
  , extensionalIdentity := true
  }

def datasetObservationJustification : ObservationProperties :=
  { attestsToFacts := true
  , observationalIdentity := true
  , providesEvidence := true
  }

/-
Sanity lemmas: each exemplar satisfies the intended predicate.
-/

theorem person_is_actor_bound : IsActorBound personJustification := by
  unfold IsActorBound personJustification
  simp

theorem organization_is_actor_bound : IsActorBound organizationJustification := by
  unfold IsActorBound organizationJustification
  simp

theorem location_is_locus_bound : IsLocusBound locationJustification := by
  unfold IsLocusBound locationJustification
  simp

theorem document_is_instrument_bound : IsInstrumentBound documentJustification := by
  unfold IsInstrumentBound documentJustification
  simp

theorem event_is_event_bound : IsEventBound eventJustification := by
  unfold IsEventBound eventJustification
  simp

theorem policy_scope_is_scope_bound : IsScopeBound policyScopeJustification := by
  unfold IsScopeBound policyScopeJustification
  simp

theorem dataset_is_observation_bound : IsObservationBound datasetObservationJustification := by
  unfold IsObservationBound datasetObservationJustification
  simp

end StructuralExplainability.AccountableEntities
