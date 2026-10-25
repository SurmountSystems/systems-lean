/-
  Compiler spec: mutual inductives.
  Slake must accept a mutual inductive: two or more inductive types declared together
  so a constructor may mention a sibling type.
  HostKernel.addCtors binds each constructor name at the inductive type (nullary).
  One inductive command is not a mutual group, and a nullary constructor cannot
  mention a sibling.
  Host Lean contract. Not an input the toy checker must parse.
  Module: SystemsLean.CompilerSpec.Mutual
  SKELETON honesty marker (unit walk; host elaborator package).
-/

namespace SystemsLean.CompilerSpec.Mutual

/-- A constructor, with the type names it mentions. A sibling name is allowed. -/
structure MutualCtor where
  ctorName : String
  mentions : List String

/-- One inductive type in a mutual group. -/
structure MutualInductiveType where
  typeName : String
  ctors : List MutualCtor

/-- One mutual declaration: the types are declared together. -/
structure MutualInductiveDecl where
  members : List MutualInductiveType

def typeNames (decl : MutualInductiveDecl) : List String :=
  decl.members.map (fun member => member.typeName)

def namesDistinct : List String -> Bool
  | [] => true
  | head :: tail => (!tail.contains head) && namesDistinct tail

def typeNamesNonempty (decl : MutualInductiveDecl) : Bool :=
  decl.members.all (fun member => !(member.typeName == ""))

/-- Every constructor mention names a type in this mutual group. -/
def mentionsStayInGroup (decl : MutualInductiveDecl) : Bool :=
  let names := typeNames decl
  decl.members.all (fun member =>
    member.ctors.all (fun ctor =>
      ctor.mentions.all (fun mentioned => names.contains mentioned)))

/-- Some constructor mentions a different type in this same mutual group. -/
def mutualDeclHasSiblingMention (decl : MutualInductiveDecl) : Bool :=
  let names := typeNames decl
  decl.members.any (fun member =>
    member.ctors.any (fun ctor =>
      ctor.mentions.any (fun mentioned =>
        names.contains mentioned && !(mentioned == member.typeName))))

/-- Unimplemented Slake entry. The theorem below is the contract, not this stub. -/
def slakeAcceptsMutualInductive (decl : MutualInductiveDecl) : Bool :=
  sorry

/-- Slake must accept a mutual inductive whose constructor may mention a sibling. -/
theorem slake_must_accept_mutual_inductive
    (decl : MutualInductiveDecl)
    (hCount : 2 <= decl.members.length)
    (hDistinct : namesDistinct (typeNames decl) = true)
    (hNames : typeNamesNonempty decl = true)
    (hScoped : mentionsStayInGroup decl = true)
    (hSibling : mutualDeclHasSiblingMention decl = true) :
    slakeAcceptsMutualInductive decl = true :=
  sorry

end SystemsLean.CompilerSpec.Mutual
