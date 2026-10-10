/-
  Compiler spec: tactic proofs.
  Slake must accept a tactic proof: a proof written with tactics, not only a bare proof term.
  The HostKernel toy grammar checks def bodies as terms. It has no tactic proof.
  Host Lean contract. Not an input the toy checker must parse.
  Module: SystemsLean.CompilerSpec.Tactic
-/

namespace SystemsLean.CompilerSpec.Tactic

/-- bareTerm is a bare proof term. tacticScript is a tactic proof. -/
inductive ProofForm where
  | bareTerm (name proposition term : String)
  | tacticScript (name proposition tactics : String)

/-- Unimplemented Slake entry. The theorem below is the contract, not this stub. -/
def slakeAcceptsProof (form : ProofForm) : Bool :=
  sorry

/-- Slake must accept a tactic proof, not only a bare proof term. -/
theorem slake_must_accept_tactic_proof
    (name proposition tactics : String)
    (hName : Not (name = ""))
    (hProposition : Not (proposition = ""))
    (hTactics : Not (tactics = "")) :
    slakeAcceptsProof (ProofForm.tacticScript name proposition tactics) = true :=
  sorry

end SystemsLean.CompilerSpec.Tactic
