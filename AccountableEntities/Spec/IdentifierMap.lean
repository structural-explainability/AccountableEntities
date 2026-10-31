-- Archived.
-- Retired and no longer authoritative. See repository README.md.
import AccountableEntities.Spec.Kind
import AccountableEntities.Spec.KindNames

namespace AccountableEntities.Spec

/-!
# Accountable Entities (AE) Identifier Map (v1)

REQ:
  Provide a single, deterministic mapping from AE requirement identifiers
  (as strings) to the Lean artifacts that witness or define them.

WHY:
  - Identifiers are the sole normative reference mechanism across the AE spec.
  - This file is the one place where those identifiers are mirrored in Lean,
    so traceability cannot drift across modules.

OBS:
  - Canonical AE kind constructors are `Kind.K1 .. Kind.K6`.
  - Human-readable names (Actor/Locus/...) are definitional abbreviations only
    (see `AccountableEntities/Spec/KindNames.lean`) and are non-normative.
  - Canonical AE v1 kind identifiers are `AE.KIND.K1 .. AE.KIND.K6`.
  - `leanModule` and `leanDecl` are trace metadata (not proof obligations).
  - The `entries` list is alphabetized by `id` to remove editorial discretion.
-/


abbrev ReqId := String

/-- Requirement entry with trace metadata. -/
structure Entry where
  id : ReqId
  description : String
  leanModule : String
  leanDecl : String
  deriving Repr, BEq, DecidableEq

namespace Req

def AE_CONFORMANCE_SE_REQUIRED : ReqId := "AE.CONFORMANCE.SE.REQUIRED"
def AE_DEFINITION_CORE : ReqId := "AE.DEFINITION.CORE"
def AE_EXTENSION_ADMISSIBILITY : ReqId := "AE.EXTENSION.ADMISSIBILITY"
def AE_EXTENSION_VERSIONED_ONLY : ReqId := "AE.EXTENSION.VERSIONED_ONLY"
def AE_IDENTITY_REGIME_MAPPING : ReqId := "AE.IDENTITY.REGIME.MAPPING"
def AE_KIND_CLOSED_SET_V1 : ReqId := "AE.KIND.CLOSED_SET.V1"
def AE_KIND_EXACT_COUNT_V1 : ReqId := "AE.KIND.EXACT_COUNT.V1"
def AE_KIND_K1 : ReqId := "AE.KIND.K1"
def AE_KIND_K2 : ReqId := "AE.KIND.K2"
def AE_KIND_K3 : ReqId := "AE.KIND.K3"
def AE_KIND_K4 : ReqId := "AE.KIND.K4"
def AE_KIND_K5 : ReqId := "AE.KIND.K5"
def AE_KIND_K6 : ReqId := "AE.KIND.K6"
def AE_SCOPE_EXCLUSIONS : ReqId := "AE.SCOPE.EXCLUSIONS"

end Req


/-
REQ.AE.IDENTIFIER_MAP.ENTRIES:

WHY:
  A canonical list of (id -> Lean artifact) entries enables:
  - deterministic lookup for documentation tooling,
  - stable cross-references in proofs and conformance evidence, and
  - "exactly once" mirroring of IDENTIFIERS.md within Lean.

OBS:
  Alphabetical order is by identifier string value.
-/
def entries : List Entry :=
[
  { id := Req.AE_CONFORMANCE_SE_REQUIRED
    description := "States that Accountable Entities conforms to the Structural Explainability specification."
    leanModule := "AccountableEntities.Spec.Conformance"
    leanDecl := "ConformanceEvidence.AE_CONFORMANCE_SE_REQUIRED" },

  { id := Req.AE_DEFINITION_CORE
    description := "Defines Accountable Entities as a structural specification for entity kinds and identity regimes."
    leanModule := "AccountableEntities.Spec.Conformance"
    leanDecl := "ConformanceEvidence.AE_DEFINITION_CORE" },

  { id := Req.AE_EXTENSION_ADMISSIBILITY
    description := "Defines the criteria that any future extension of the entity kind set MUST satisfy."
    leanModule := "AccountableEntities.Spec.Conformance"
    leanDecl := "ConformanceEvidence.AE_EXTENSION_ADMISSIBILITY" },

  { id := Req.AE_EXTENSION_VERSIONED_ONLY
    description := "States that extension of entity kinds is permitted only in a new major version of the specification."
    leanModule := "AccountableEntities.Spec.Conformance"
    leanDecl := "ConformanceEvidence.AE_EXTENSION_VERSIONED_ONLY" },

  { id := Req.AE_IDENTITY_REGIME_MAPPING
    description := "Requires that each entity kind corresponds to a distinct identity and persistence regime."
    leanModule := "AccountableEntities.Spec.Conformance"
    leanDecl := "ConformanceEvidence.AE_IDENTITY_REGIME_MAPPING" },

  { id := Req.AE_KIND_CLOSED_SET_V1
    description := "States that the set of accountable entity kinds is closed for AE v1."
    leanModule := "AccountableEntities.Spec.Kind"
    leanDecl := "Kind" },

  { id := Req.AE_KIND_EXACT_COUNT_V1
    description := "States that exactly six accountable entity kinds are defined for AE v1."
    leanModule := "AccountableEntities.Spec.Kind"
    leanDecl := "Kind" },

  { id := Req.AE_KIND_K1
    description := "Placeholder for the first accountable entity kind defined in AE v1."
    leanModule := "AccountableEntities.Spec.Kind"
    leanDecl := "Kind.K1" },

  { id := Req.AE_KIND_K2
    description := "Placeholder for the second accountable entity kind defined in AE v1."
    leanModule := "AccountableEntities.Spec.Kind"
    leanDecl := "Kind.K2" },

  { id := Req.AE_KIND_K3
    description := "Placeholder for the third accountable entity kind defined in AE v1."
    leanModule := "AccountableEntities.Spec.Kind"
    leanDecl := "Kind.K3" },

  { id := Req.AE_KIND_K4
    description := "Placeholder for the fourth accountable entity kind defined in AE v1."
    leanModule := "AccountableEntities.Spec.Kind"
    leanDecl := "Kind.K4" },

  { id := Req.AE_KIND_K5
    description := "Placeholder for the fifth accountable entity kind defined in AE v1."
    leanModule := "AccountableEntities.Spec.Kind"
    leanDecl := "Kind.K5" },

  { id := Req.AE_KIND_K6
    description := "Placeholder for the sixth accountable entity kind defined in AE v1."
    leanModule := "AccountableEntities.Spec.Kind"
    leanDecl := "Kind.K6" },

  { id := Req.AE_SCOPE_EXCLUSIONS
    description := "Defines what Accountable Entities explicitly does not specify."
    leanModule := "AccountableEntities.Spec.Conformance"
    leanDecl := "ConformanceEvidence.AE_SCOPE_EXCLUSIONS" }
]

/-
REQ.AE.IDENTIFIER_MAP.LOOKUP:

WHY:
  Provide a stable query surface for tooling and documentation generation.
-/
/-- Lookup a requirement entry by its identifier. -/
def lookup (rid : ReqId) : Option Entry :=
  entries.find? (fun e => e.id = rid)

end AccountableEntities.Spec
