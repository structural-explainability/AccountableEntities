namespace StructuralExplainability.AccountableEntities.Spec

-- Repo: structural-explainability/AccountableEntities
-- Path: AccountableEntities/Spec/Kind.lean

/-- AE v1 kind: closed set of exactly six constructors. -/
inductive Kind where
  | K1 | K2 | K3 | K4 | K5 | K6
  deriving Repr, DecidableEq

end StructuralExplainability.AccountableEntities.Spec
