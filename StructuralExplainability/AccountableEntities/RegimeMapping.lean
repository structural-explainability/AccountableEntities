-- StructuralExplainability/AccountableEntities/RegimeMapping.lean

import StructuralExplainability.AccountableEntities.EntityKinds

namespace StructuralExplainability.AccountableEntities

/--
The six necessary and sufficient identity regimes from the proof series.
These correspond to k1 through k6 in the formal theorem.
-/
inductive IdentityRegime where
  /-- k1: Identity bound to actor (agent with persistent self). -/
  | ActorBound
  /-- k2: Identity bound to locus (spatial position or reference frame). -/
  | LocusBound
  /-- k3: Identity bound to instrument (tool, method, or mechanism). -/
  | InstrumentBound
  /-- k4: Identity bound to event (temporal occurrence). -/
  | EventBound
  /-- k5: Identity bound to scope (boundary, domain, or context). -/
  | ScopeBound
  /-- k6: Identity bound to observation (measurement or attestation). -/
  | ObservationBound
  deriving Repr, BEq, DecidableEq

/--
Primary mapping from core named entity kinds to identity regimes.
This is total: every NamedEntityKind maps to exactly one IdentityRegime.
-/
def mapCoreToRegime : NamedEntityKind -> IdentityRegime
  | .Actor => .ActorBound
  | .Locus => .LocusBound
  | .Instrument => .InstrumentBound
  | .Event => .EventBound
  | .Scope => .ScopeBound
  | .Observation => .ObservationBound

/--
Inverse enumeration: which core entity kinds map to a given regime.
For the core six, this is one-to-one.
-/
def regimeInstances (r : IdentityRegime) : List NamedEntityKind :=
  match r with
  | .ActorBound => [.Actor]
  | .LocusBound => [.Locus]
  | .InstrumentBound => [.Instrument]
  | .EventBound => [.Event]
  | .ScopeBound => [.Scope]
  | .ObservationBound => [.Observation]

end StructuralExplainability.AccountableEntities
