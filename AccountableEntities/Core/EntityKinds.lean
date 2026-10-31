-- Archived.
-- Retired and no longer authoritative. See repository README.md.
namespace AccountableEntities.Core

/--
Core named entity kinds derived from common entity recognition taxonomies
and extended for civic accountability contexts.
-/
inductive NamedEntityKind where
  | Actor
  | Locus
  | Instrument
  | Event
  | Scope
  | Observation
  deriving Repr, BEq, DecidableEq

end AccountableEntities.Core
