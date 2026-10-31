-- Archived.
-- Retired and no longer authoritative. See repository README.md.
import AccountableEntities.Spec.IdentifierMap
import AccountableEntities.Spec.Kind
import AccountableEntities.Spec.KindNames

/-!
REQ.PUBLIC.SURFACE:
  Canonical public import surface for this layer.
  Do not add any declarations here.
  Do not add empty namespaces.

WHY:
  Downstream layers should have exactly one stable import path for this layer.

OBS:
  - This module re-exports the intended public modules by importing them.
  - It must not define placeholder namespaces.
  - All exported declarations live in imported modules.
-/
