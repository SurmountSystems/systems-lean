/-
  SYSTEMS_LEAN_HOST partial -- parse live src/systems/SystemsLean/IrProgram.lean.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Short role: HostFrontLiveIrProgram. Reuses HostFrontLiveExtract / Types / Mult.
  Not HostFront G1. Not HostTerm.multFixtureModule. Not parseLiveExtractSource
  on IrProgram text.

  Spec (readable):
  - parseLiveIrProgramSource turns live IrProgram.lean text into HostTerm.Module.
  - Module name is SystemsLean.IrProgram even without a module line.
  - kernelCheckLiveIrProgramSource is HostKernel.kernelCheck of that parse.

  Intentional non-claims:
  - Not full Lean 4. Not FullHost. Not live IrGraph.lean.
  - Not freestanding residual free. Not PROVABLY. Not occupancy name 50.

  Greppable: SYSTEMS_LEAN_HOST, HOST-FRONT-LIVE-IR-PROGRAM,
  SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_V0, PARSE-LIVE-IR-PROGRAM,
  parseLiveIrProgramSource, kernelCheckLiveIrProgramSource,
  hostFrontLiveIrProgramReady, liveIrProgramSource, liveIrProgramRel,
  UNIT_SURFACE host surface.
  Module: SystemsLean.HostFrontLiveIrProgram
  Red/green: just systems-host; lake build SystemsLean.HostFrontLiveIrProgram on
  surmount-1. Not package typecheck GREEN. Not FullHost. Not Lake-gone.
  Module must stay ASCII.
-/

import SystemsLean.HostFrontLiveExtract
import SystemsLean.HostKernel

namespace SystemsLean.HostFrontLiveIrProgram

open SystemsLean.HostTerm
open SystemsLean.HostFront
open SystemsLean.HostKernel
open SystemsLean.HostFrontLiveMult
open SystemsLean.HostFrontLiveTypes
open SystemsLean.HostFrontLiveExtract

/-- Greppable primary stage id. -/
def stageId : String := "SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_V0"

/-- Greppable host map id. -/
def hostId : String := "HOST-FRONT-LIVE-IR-PROGRAM"

/-- Greppable parse id. -/
def parseId : String := "PARSE-LIVE-IR-PROGRAM"

/-- Live file relative to repo root. Dual-pin path. -/
def liveIrProgramRel : String := "src/systems/SystemsLean/IrProgram.lean"

/-- Honesty: this parser is not the HostTerm Mult fixture. -/
def liveParseDoesNotUseMultFixture : Bool := true

def hostFrontLiveIrProgramFullHost : Bool := false
def hostFrontLiveIrProgramResidualFreeClaimed : Bool := false
def hostFrontLiveIrProgramProvablyUnlocked : Bool := false
def liveIrProgramParseFuel : Nat := 192

/-- Stop tokens: Extract stops plus list/compare/append. -/
def irIsStop (t : String) : Bool :=
  extractIsStop t || t == "++" || t == ">=" || t == "<=" || t == "]"

/-- Atom start: allow `[` list lits; stop infix. -/
def irAtomStart : List String -> Bool
  | [] => false
  | t :: rest =>
    if irIsStop t then false
    else if t == "[" then true
    else extractAtomStart (t :: rest)

/-- Binder field chain `p.nodes.length` is nested proj. -/
def identTermIr (bs : List String) (s : String) : Term :=
  match s.splitOn "." with
  | [] => Term.const (HostTerm.n s)
  | a :: segs =>
    if isBinder bs a then
      segs.foldl (fun t f => Term.proj t (HostTerm.n f)) (Term.var (HostTerm.n a))
    else
      identTerm bs s

/-- Tokenize stripped source; keeps `{` `}` `[` `]` Nat `&&` `!` `++` `<=` `>=`. -/
def tokenizeIrN : Nat -> List Char -> List String -> List String
  | 0, _, acc => acc.reverse
  | Nat.succ _, [], acc => acc.reverse
  | Nat.succ n, c :: rest, acc =>
    if c == ' ' || c == '\t' || c == '\n' || c == '\r' then
      tokenizeIrN n rest acc
    else if HostFront.isDigit c then
      let (rev, rest2) := takeNatN liveIrProgramParseFuel [c] rest
      tokenizeIrN n rest2 (String.ofList rev.reverse :: acc)
    else if c == '"' then
      match takeStringN liveIrProgramParseFuel [c] rest with
      | none => tokenizeIrN n rest acc
      | some (rev, rest2) =>
        tokenizeIrN n rest2 (String.ofList rev.reverse :: acc)
    else if c == ':' then
      match rest with
      | '=' :: rest2 => tokenizeIrN n rest2 (":=" :: acc)
      | _ => tokenizeIrN n rest (":" :: acc)
    else if c == '=' then
      match rest with
      | '>' :: rest2 => tokenizeIrN n rest2 ("=>" :: acc)
      | _ => tokenizeIrN n rest ("=" :: acc)
    else if c == '-' then
      match rest with
      | '>' :: rest2 => tokenizeIrN n rest2 ("->" :: acc)
      | _ => tokenizeIrN n rest ("-" :: acc)
    else if c == '&' then
      match rest with
      | '&' :: rest2 => tokenizeIrN n rest2 ("&&" :: acc)
      | _ => tokenizeIrN n rest acc
    else if c == '!' then
      tokenizeIrN n rest ("!" :: acc)
    else if c == '+' then
      match rest with
      | '+' :: rest2 => tokenizeIrN n rest2 ("++" :: acc)
      | _ => tokenizeIrN n rest acc
    else if c == '>' then
      match rest with
      | '=' :: rest2 => tokenizeIrN n rest2 (">=" :: acc)
      | _ => tokenizeIrN n rest acc
    else if c == '<' then
      match rest with
      | '=' :: rest2 => tokenizeIrN n rest2 ("<=" :: acc)
      | _ => tokenizeIrN n rest acc
    else if c == '|' || c == '(' || c == ')' || c == ',' || c == '.'
        || c == '{' || c == '}' || c == '[' || c == ']' then
      tokenizeIrN n rest (String.singleton c :: acc)
    else if isIdentStart c then
      let (rev, rest2) := takeIdentN liveIrProgramParseFuel [c] rest
      tokenizeIrN n rest2 (String.ofList rev.reverse :: acc)
    else
      tokenizeIrN n rest acc

/-- Tokenize after comment strip. -/
def tokenizeIr (src : String) : List String :=
  tokenizeIrN (src.length + 8) src.toList []

/-- HostType plus `List T` (element consumed, named List) and `Type`. -/
def parseHostTypeIr (toks : List String) : Option (Prod HostType (List String)) :=
  match toks with
  | "List" :: rest =>
    match parseHostType rest with
    | some (_, rest2) => some (HostType.named (HostTerm.n "List"), rest2)
    | none => some (HostType.named (HostTerm.n "List"), rest)
  | "Type" :: rest => some (HostType.named (HostTerm.n "Type"), rest)
  | _ => parseHostType toks

/-- Full consume HostType. -/
def parseHostTypeAllIr (toks : List String) : Option HostType :=
  match parseHostTypeIr toks with
  | some (ty, []) => some ty
  | _ => none

/-- Binders `(n : T)` plus skip `{alpha : Type}`. -/
def parseBindersIr : Nat -> List String -> List (Prod String HostType) ->
    Option (Prod (List (Prod String HostType)) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "(" :: rest =>
      match parseBinderNamesN n [] rest with
      | some (names, ":" :: rest2) =>
        match parseHostTypeIr rest2 with
        | some (ty, ")" :: rest3) =>
          parseBindersIr n rest3 (acc ++ names.map (fun nm => (nm, ty)))
        | _ => none
      | _ => none
    | "{" :: rest =>
      match parseBinderNamesN n [] rest with
      | some (_, ":" :: rest2) =>
        match parseHostTypeIr rest2 with
        | some (_, "}" :: rest3) => parseBindersIr n rest3 acc
        | _ => none
      | _ => none
    | _ => some (acc, toks)

/-- Structure fields `name : Type` including List T. -/
def parseStructFieldDeclsIr : Nat -> List String -> List FieldDecl ->
    Option (Prod (List FieldDecl) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "deriving" :: rest => some (acc, "deriving" :: rest)
    | t :: ":" :: rest =>
      if !liveIsIdent t then none
      else
        match parseHostTypeIr rest with
        | some (ty, rest2) =>
          parseStructFieldDeclsIr n rest2
            (acc ++ [{ name := HostTerm.n (lastSeg t), ty := ty }])
        | none => none
    | _ => some (acc, toks)

/-- `| ctor` or `| ctor (x : T)` until deriving. -/
def parseCtorBarsIr : Nat -> List String -> List CtorDecl ->
    Option (Prod (List CtorDecl) (List String))
  | 0, toks, acc => some (acc, toks)
  | Nat.succ n, toks, acc =>
    match toks with
    | "|" :: name :: rest =>
      if liveIsIdent name then
        let ctor : CtorDecl := { name := HostTerm.n (lastSeg name) }
        match rest with
        | "(" :: b :: ":" :: t :: ")" :: rest2 =>
          if liveIsIdent b && liveIsIdent t then
            parseCtorBarsIr n rest2 (acc ++ [ctor])
          else
            none
        | _ => parseCtorBarsIr n rest (acc ++ [ctor])
      else
        none
    | _ => some (acc, toks)

mutual
  /-- Struct lit fields `name := term`. -/
  def parseStructLitFieldsIr : Nat -> List String -> List String ->
      List (Prod Name Term) -> Option (Prod (List (Prod Name Term)) (List String))
    | 0, _, _, _ => none
    | Nat.succ n, bs, toks, acc =>
      match toks with
      | "}" :: rest => some (acc, rest)
      | t :: ":=" :: rest =>
        if !liveIsIdent t then none
        else
          match parseTermIr n bs rest with
          | none => none
          | some (val, rest2) =>
            let acc2 := acc ++ [(HostTerm.n t, val)]
            match rest2 with
            | "," :: rest3 => parseStructLitFieldsIr n bs rest3 acc2
            | "}" :: rest3 => some (acc2, rest3)
            | _ => none
      | _ => none

  /-- Atom including list lit / some / none / struct lit. -/
  def parseAtomIr : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | [] => none
      | "none" :: rest => some (Term.none_, rest)
      | "true" :: rest => some (Term.litBool true, rest)
      | "false" :: rest => some (Term.litBool false, rest)
      | "some" :: rest =>
        match parseAtomIr n bs rest with
        | some (t, rest2) => some (Term.some_ t, rest2)
        | none => none
      | "decide" :: "(" :: rest =>
        match parseTermIr n bs rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | some (a, op :: rest2) =>
          if op == "=" || op == "<=" || op == ">=" then
            match parseTermIr n bs rest2 with
            | some (b, ")" :: rest3) => some (Term.decideEq a b, rest3)
            | _ => none
          else
            none
        | _ => none
      | "[" :: "]" :: rest =>
        some (Term.const (HostTerm.n "nil"), rest)
      | "[" :: rest =>
        match parseTermIr n bs rest with
        | some (t, "]" :: rest2) =>
          some (Term.app (Term.const (HostTerm.n "singleton")) t, rest2)
        | _ => none
      | "{" :: rest =>
        match parseStructLitFieldsIr n bs rest [] with
        | some (fs, rest2) =>
          if fs.isEmpty then none else some (Term.structLit fs, rest2)
        | none => none
      | "(" :: rest =>
        match parseTermIr n bs rest with
        | some (t, ")" :: rest2) => some (t, rest2)
        | _ => none
      | t :: rest =>
        if isNatLit t then
          match ofNatLit? t with
          | some k => some (Term.litNat k, rest)
          | none => none
        else if isStringLit t then
          some (Term.litString (stripStringLit t), rest)
        else if liveIsIdent t && t != "=" && t != "&&" && t != "!" then
          some (identTermIr bs t, rest)
        else
          none

  /-- App, `.isSome` builtin, and field proj. -/
  def parseTermTailIr : Nat -> List String -> Term -> List String ->
      Option (Prod Term (List String))
    | 0, _, t, rest => some (t, rest)
    | Nat.succ n, bs, t, rest =>
      match rest with
      | "." :: field :: rest2 =>
        if field == "isSome" then
          parseTermTailIr n bs
            (Term.app (Term.const (HostTerm.n "isSome")) t) rest2
        else if liveIsIdent field then
          let t2 :=
            match t with
            | Term.const _ => Term.const (HostTerm.n field)
            | _ => Term.proj t (HostTerm.n field)
          parseTermTailIr n bs t2 rest2
        else
          some (t, rest)
      | _ =>
        if irAtomStart rest then
          match parseAtomIr n bs rest with
          | some (a, rest2) => parseTermTailIr n bs (Term.app t a) rest2
          | none => some (t, rest)
        else
          some (t, rest)

  /-- Term entry: if / match / prefix `!` / && / ++ / compare / atom. -/
  def parseTermIr : Nat -> List String -> List String ->
      Option (Prod Term (List String))
    | 0, _, _ => none
    | Nat.succ n, bs, toks =>
      match toks with
      | "if" :: rest =>
        match parseTermIr n bs rest with
        | some (c, "then" :: rest2) =>
          match parseTermIr n bs rest2 with
          | some (t1, "else" :: rest3) =>
            match parseTermIr n bs rest3 with
            | some (e, rest4) => some (Term.ite c t1 e, rest4)
            | none => none
          | _ => none
        | _ => none
      | "!" :: rest =>
        match parseAtomIr n bs rest with
        | some (t, rest2) =>
          match parseTermTailIr n bs t rest2 with
          | some (t2, rest3) =>
            let neg := Term.ite t2 (Term.litBool false) (Term.litBool true)
            match rest3 with
            | "&&" :: rest4 =>
              match parseTermIr n bs rest4 with
              | some (t3, rest5) =>
                some (Term.ite neg t3 (Term.litBool false), rest5)
              | none => none
            | _ => some (neg, rest3)
          | none => none
        | none => none

      | _ =>
        match parseAtomIr n bs toks with
        | none => none
        | some (t, rest) =>
          match parseTermTailIr n bs t rest with
          | none => none
          | some (t2, rest2) =>
            match rest2 with
            | "&&" :: rest3 =>
              match parseTermIr n bs rest3 with
              | some (t3, rest4) =>
                some (Term.ite t2 t3 (Term.litBool false), rest4)
              | none => none
            | "++" :: rest3 =>
              match parseTermIr n bs rest3 with
              | some (t3, rest4) =>
                some (
                  Term.app
                    (Term.app (Term.const (HostTerm.n "append")) t2) t3,
                  rest4)
              | none => none
            | ">=" :: rest3 =>
              match parseTermIr n bs rest3 with
              | some (t3, rest4) => some (Term.decideEq t2 t3, rest4)
              | none => none
            | "<=" :: rest3 =>
              match parseTermIr n bs rest3 with
              | some (t3, rest4) => some (Term.decideEq t2 t3, rest4)
              | none => none
            | _ => some (t2, rest2)
end

/-- Parse `def` body after the name (typed assign). -/
def parseDefIr (fuel : Nat) (dname : String) (rest : List String) :
    Option (Prod Cmd (List String)) :=
  match parseBindersIr fuel rest [] with
  | none => none
  | some (bs, rest2) =>
    match rest2 with
    | ":" :: rest3 =>
      match splitDefBody rest3 with
      | none => none
      | some (kind, (tyToks, bodyToks)) =>
        match parseHostTypeAllIr tyToks with
        | none => none
        | some retTy =>
          let ty := addBinderArrows bs retTy
          let bnames := bs.map (fun p => p.fst)
          let dn := HostTerm.n dname
          match kind with
          | DefBodyKind.assign =>
            match parseTermIr liveIrProgramParseFuel bnames bodyToks with
            | some (body, rest4) =>
              if bs.isEmpty then
                some (Cmd.def_ dn (some ty) body, rest4)
              else
                let nbs := bs.map (fun p => (HostTerm.n p.fst, p.snd))
                some (Cmd.defBind dn nbs retTy body, rest4)
            | none => none
          | DefBodyKind.equation => none
    | _ => none

/-- Parse one command (import / open / structure / inductive / IrProgram def). -/
def parseOneCmdIr (fuel : Nat) (toks : List String) :
    Option (Prod Cmd (List String)) :=
  match toks with
  | "import" :: name :: rest =>
    if liveIsIdent name then some (Cmd.importModule (HostTerm.n name), rest)
    else none
  | "open" :: name :: rest =>
    if !liveIsIdent name then none
    else
      match rest with
      | "(" :: inner :: ")" :: rest2 =>
        if liveIsIdent inner then some (Cmd.openNs [HostTerm.n inner], rest2)
        else none
      | _ => some (Cmd.openNs [HostTerm.n name], rest)
  | "structure" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseStructFieldDeclsIr fuel rest [] with
      | none => none
      | some (fields, rest2) =>
        if fields.isEmpty then none
        else
          match rest2 with
          | "deriving" :: rest3 =>
            match parseDerivingLive rest3 with
            | some (der, rest4) =>
              some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields der, rest4)
            | none => none
          | _ =>
            some (Cmd.structure_ (HostTerm.n (lastSeg name)) fields [], rest2)
  | "inductive" :: name :: "where" :: rest =>
    if !liveIsIdent name then none
    else
      match parseCtorBarsIr fuel rest [] with
      | none => none
      | some (ctors, rest2) =>
        if ctors.isEmpty then none
        else
          match rest2 with
          | "deriving" :: rest3 =>
            match parseDerivingLive rest3 with
            | some (der, rest4) =>
              some (Cmd.inductive_ (HostTerm.n (lastSeg name)) ctors der, rest4)
            | none => none
          | _ =>
            some (Cmd.inductive_ (HostTerm.n (lastSeg name)) ctors [], rest2)
  | "def" :: rest =>
    match parseDefHead rest with
    | some (dname, rest2) => parseDefIr fuel dname rest2
    | none => none
  | _ => parseOneCmdN liveParseFuel toks

/-- Fold commands. Fail closed. -/
def parseCmdsIr : Nat -> List String -> List Cmd -> Option (List Cmd)
  | 0, [], acc => some acc
  | 0, _ :: _, _ => none
  | Nat.succ _, [], acc => some acc
  | Nat.succ n, toks, acc =>
    match parseOneCmdIr liveIrProgramParseFuel toks with
    | none => none
    | some (c, rest) => parseCmdsIr n rest (acc ++ [c])

/-- Parse live IrProgram.lean text.
    Greppable: parseLiveIrProgramSource, PARSE-LIVE-IR-PROGRAM. -/
def parseLiveIrProgramSource (src : String) : FrontResult :=
  let toks := tokenizeIr (stripComments src)
  if toks.isEmpty then FrontResult.reject reasonEmptyModule
  else
    match parseCmdsIr liveIrProgramParseFuel toks [] with
    | none => FrontResult.reject reasonParseFail
    | some cmds =>
      if cmds.isEmpty then FrontResult.reject reasonEmptyModule
      else
        let m : Module :=
          { name := HostTerm.n "SystemsLean.IrProgram", commands := cmds }
        if isWellFormed m then FrontResult.accept m
        else FrontResult.reject reasonNotWellFormed

/-- Kernel-check live IrProgram parse. Not kernelCheckMultFixture.
    Greppable: kernelCheckLiveIrProgramSource, PARSE-LIVE-IR-PROGRAM. -/
def kernelCheckLiveIrProgramSource (src : String) : Bool :=
  match parseLiveIrProgramSource src with
  | FrontResult.accept m => HostKernel.kernelCheck m
  | FrontResult.reject _ => false

/-- Dual-pinned live IrProgram.lean bytes (must match on-disk file).
    Greppable: liveIrProgramSource, PARSE-LIVE-IR-PROGRAM. -/
def liveIrProgramSource : String := r#"/-
  SYSTEMS_LEAN_HOST partial -- ordered IR program (node list) on Systems Lean host.
  Side: classic Lean elaborator under src/systems/ (not freestanding C).
  Pair map (read-only): Types.slake / types.md ir_program notes,
    emit slake_ir_program_* (historical stage id IR_PROGRAM_V0 on frozen wire).
  Shared core map: doc/shared-ir-sketch.md.

  Spec (readable, separate from any future proof):
  - An ordered IR program is a fixed-capacity ordered list of typed IR nodes.
  - Capacity honesty: programCap = 8 (emit SLAKE_IR_PROGRAM_CAP).
  - Host uses List under the cap; emit uses a fixed array of the same capacity.
  - push appends a well-typed node; fail closed on bad node or full capacity.
  - isWellTyped: non-empty, length <= programCap, and every live node well-typed.
  - EMPTY-PROGRAM-FAIL-CLOSED: empty program (count 0) is NOT well-typed as a
    program (matches emit slake_ir_program_is_well_typed).
  - Oversize lists (length > programCap) fail well-typed (emit count > CAP reject).
  - foldWellTyped folds left-to-right only when the program is well-typed;
    otherwise none (fail closed).
  - Not a control-flow graph. Not graph edges (see SystemsLean.IrGraph for edge host surface).

  Theorems live in SystemsLean.IrProgramTheorems (same namespace; long-file split):
  IR-PROGRAM-THEOREM / HOST-IR-PROGRAM-THEOREM --
  empty_isEmpty / empty_length_zero / isWellTyped_empty_false / empty_not_well_typed /
  checkFailClosed_eq_isWellTyped / foldWellTyped_ill_typed_none /
  foldWellTyped_empty_none / push_bad_node / programCap_eq_eight /
  push_value_one_ok / length_single_value / isWellTyped_single_value /
  foldWellTyped_single_value_some / isWellTyped_two_values / length_two_values /
  foldWellTyped_two_values_some / push_second_value_ok / push_full_at_cap /
  isWellTyped_mixed_kinds / length_mixed_kinds / foldWellTyped_mixed_kinds_some /
  isWellTyped_mixed_bad_false (multi-node VALUE+LINEAR+ERASED kind/mult pairing).
  Core Program defs (programCap, push, isWellTyped, foldWellTyped, checkFailClosed)
  stay here.
  These IrProgram theorems do NOT set SpecProof.proofCompleteClaimed true.
  Partial theorems on IrProgram != host proof complete != residual free.

  Intentional non-claims:
  - Not freestanding residual free. Not product C residual free.
  - Not PROVABLY. Not freestanding emit residual free.
  - Not proof complete (SpecProof.proofCompleteClaimed stays false).
  - Classic Lean elaborator still has managed runtime residual (host != product wire).
  - Not a full elaborator. Not CFG / dominance / SSA.
  - Historical wire id IR_PROGRAM_V0 is emit map only; new host names prefer
    ordered IR program / node list (no banned metaphor jargon in this module).

  Greppable: SYSTEMS_LEAN_HOST, ORDERED-IR-PROGRAM, EMPTY-PROGRAM-FAIL-CLOSED,
  IR-PROGRAM-THEOREM, HOST-IR-PROGRAM-THEOREM, isWellTyped_empty_false,
  empty_not_well_typed, empty_isEmpty, empty_length_zero,
  checkFailClosed_eq_isWellTyped, foldWellTyped_empty_none,
  foldWellTyped_ill_typed_none, push_bad_node, programCap_eq_eight,
  push_value_one_ok, length_single_value, isWellTyped_single_value,
  foldWellTyped_single_value_some, isWellTyped_two_values, length_two_values,
  foldWellTyped_two_values_some, push_second_value_ok, push_full_at_cap,
  isWellTyped_mixed_kinds, length_mixed_kinds, foldWellTyped_mixed_kinds_some,
  isWellTyped_mixed_bad_false,
  IrProgramTheorems, SLAKE_IR_PROGRAM_CAP, MULT-0, MULT-1, MULT-OMEGA, TYPED_IR_V0
  UNIT_SURFACE host surface. Module: SystemsLean.IrProgram
  Long-file split: IR-PROGRAM-THEOREM in SystemsLean.IrProgramTheorems
  (same namespace). Core Program surface stays here.
  Red/green: just systems-host (nix/systems-host-presence/; flake checks.systems-host-presence); lake build when toolchain installed.
  Module must stay ASCII.
-/

import SystemsLean.Types

namespace SystemsLean.IrProgram

open SystemsLean.Types (IrNode)

/-- Fixed capacity matching emit SLAKE_IR_PROGRAM_CAP (honesty map). -/
def programCap : Nat := 8

/-- Ordered IR program: ordered list of typed IR nodes under programCap.
    ORDERED-IR-PROGRAM host surface. -/
structure Program where
  nodes : List IrNode
  deriving DecidableEq, Repr

/-- Empty ordered IR program (not well-typed as a program; see isWellTyped). -/
def empty : Program := { nodes := [] }

/-- Live node count. -/
def length (p : Program) : Nat := p.nodes.length

/-- True when no live nodes. -/
def isEmpty (p : Program) : Bool := p.nodes.isEmpty

/-- Result of push: ok with new program, bad node, or full capacity.
    Emit map: 0 ok; -1 null/bad; -2 full. -/
inductive PushResult where
  | ok (p : Program)
  | badNode
  | full
  deriving DecidableEq, Repr

/-- push p n -- append a well-typed node.
    Fail closed: badNode when n is not well-typed; full when at programCap.
    Bad push leaves the original program unchanged (caller keeps p). -/
def push (p : Program) (n : IrNode) : PushResult :=
  if !n.isWellTyped then
    PushResult.badNode
  else if p.nodes.length >= programCap then
    PushResult.full
  else
    PushResult.ok { nodes := p.nodes ++ [n] }

/-- isWellTyped p -- non-empty, within programCap, and every live node well-typed.
    EMPTY-PROGRAM-FAIL-CLOSED: empty program is not well-typed as a program.
    Oversize (length > programCap) fails closed (emit count > CAP parity). -/
def isWellTyped (p : Program) : Bool :=
  !p.nodes.isEmpty
    && decide (p.nodes.length <= programCap)
    && p.nodes.all IrNode.isWellTyped

/-- foldWellTyped p init f -- left-to-right fold over ordered nodes when the
    program is well-typed; none when empty or any node fails well-typed.
    Fail closed: does not fold an ill-typed program. -/
def foldWellTyped {alpha : Type} (p : Program) (init : alpha)
    (f : alpha -> IrNode -> alpha) : Option alpha :=
  if isWellTyped p then
    some (List.foldl f init p.nodes)
  else
    none

/-- Fail-closed program check (host V0): same bar as isWellTyped.
    Emit compose path adds FAIL_CLOSED_CHECKER_V1 per node; that is product wire. -/
def checkFailClosed (p : Program) : Bool := isWellTyped p

/-! ### IR-PROGRAM-THEOREM split to IrProgramTheorems
    (same namespace). Greppable cites live on IrProgramTheorems:
    IR-PROGRAM-THEOREM, HOST-IR-PROGRAM-THEOREM, isWellTyped_empty_false,
    empty_not_well_typed, empty_isEmpty, empty_length_zero,
    checkFailClosed_eq_isWellTyped, foldWellTyped_empty_none,
    foldWellTyped_ill_typed_none, push_bad_node, programCap_eq_eight,
    push_value_one_ok, length_single_value, isWellTyped_single_value,
    foldWellTyped_single_value_some, isWellTyped_two_values, length_two_values,
    foldWellTyped_two_values_some, push_second_value_ok, push_full_at_cap,
    isWellTyped_mixed_kinds, length_mixed_kinds, foldWellTyped_mixed_kinds_some,
    isWellTyped_mixed_bad_false, IrProgramTheorems.
    Import SystemsLean.IrProgramTheorems from the package root. Core Program
    defs stay here -- ordered IR program surface only; free claims stay false;
    not llvm / PROVABLY unlock. -/

end SystemsLean.IrProgram
"#

/-- Accepted live module when parse succeeds. -/
def liveIrProgramParsed? : Option Module :=
  match parseLiveIrProgramSource liveIrProgramSource with
  | FrontResult.accept m => some m
  | FrontResult.reject _ => none

/-- Live parse has no check command. -/
def liveParseHasNoCheckCmd : Bool :=
  match liveIrProgramParsed? with
  | none => false
  | some m =>
    !(m.commands.any fun c =>
      match c with
      | Cmd.check _ _ => true
      | _ => false)

/-- Live parse command count (14: import, namespace, open, def, structure,
    two def, inductive, four def, end). -/
def liveParseCmdCountOk : Bool :=
  match liveIrProgramParsed? with
  | some m => m.commands.length == 14
  | none => false

/-- Live parse has Program structure with nodes field. -/
def liveParseHasProgramStruct : Bool :=
  match liveIrProgramParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.structure_ name fields _ =>
        name.raw == "Program" && fields.any (fun f => f.name.raw == "nodes")
      | _ => false

/-- Live parse has PushResult inductive with three ctors. -/
def liveParseHasPushResult : Bool :=
  match liveIrProgramParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.inductive_ name ctors _ =>
        name.raw == "PushResult" && ctors.length == 3
          && ctors.any (fun x => x.name.raw == "ok")
          && ctors.any (fun x => x.name.raw == "badNode")
          && ctors.any (fun x => x.name.raw == "full")
      | _ => false

/-- Live parse has core IrProgram defs (def_ or defBind). -/
def liveParseHasCoreDefs : Bool :=
  match liveIrProgramParsed? with
  | none => false
  | some m =>
    let has (nm : String) : Bool :=
      m.commands.any fun c =>
        match c with
        | Cmd.def_ x _ _ => x.raw == nm
        | Cmd.defBind x _ _ _ => x.raw == nm
        | _ => false
    has "programCap" && has "empty" && has "length" && has "isEmpty"
      && has "push" && has "isWellTyped" && has "foldWellTyped"
      && has "checkFailClosed"

/-- Live parse imports SystemsLean.Types (not the Mult fixture). -/
def liveParseHasTypesImport : Bool :=
  match liveIrProgramParsed? with
  | none => false
  | some m =>
    m.commands.any fun c =>
      match c with
      | Cmd.importModule x => x.raw == "SystemsLean.Types"
      | _ => false

/-- End-to-end ready: live text parse kernel-checks.
    Greppable: hostFrontLiveIrProgramReady, PARSE-LIVE-IR-PROGRAM,
    HOST-FRONT-LIVE-IR-PROGRAM.
    Real conjunction: parse+kernel plus honesty pins. Not hardcoded true. -/
def hostFrontLiveIrProgramReady : Bool :=
  (stageId == "SLAKE_HOST_FRONT_LIVE_IR_PROGRAM_V0")
    && (hostId == "HOST-FRONT-LIVE-IR-PROGRAM")
    && (parseId == "PARSE-LIVE-IR-PROGRAM")
    && (liveIrProgramRel == "src/systems/SystemsLean/IrProgram.lean")
    && liveParseDoesNotUseMultFixture
    && !hostFrontLiveIrProgramFullHost
    && !hostFrontLiveIrProgramResidualFreeClaimed
    && !hostFrontLiveIrProgramProvablyUnlocked
    && kernelCheckLiveIrProgramSource liveIrProgramSource
    && liveParseHasNoCheckCmd
    && liveParseCmdCountOk
    && liveParseHasProgramStruct
    && liveParseHasPushResult
    && liveParseHasCoreDefs
    && liveParseHasTypesImport

/-- Empty source rejects. -/
def liveParseRejectsEmpty : Bool :=
  match parseLiveIrProgramSource "" with
  | FrontResult.reject _ => true
  | FrontResult.accept _ => false

/-! ### Driver (short banners; dual-pin file equality). Not mill 70. -/

def runLiveIrProgram (root : System.FilePath) : IO Unit := do
  IO.println s!"== {stageId}: PARSE-LIVE-IR-PROGRAM =="
  IO.println s!"  host={hostId} file={liveIrProgramRel}"
  let path := root / liveIrProgramRel
  unless (<- path.pathExists) do
    IO.eprintln s!"error: missing {liveIrProgramRel}"
    throw (IO.userError s!"missing {liveIrProgramRel}")
  let disk <- IO.FS.readFile path
  if disk != liveIrProgramSource then
    IO.eprintln "error: dual-pin mismatch: on-disk IrProgram.lean != liveIrProgramSource"
    throw (IO.userError "dual-pin mismatch live IrProgram.lean")
  let r := parseLiveIrProgramSource disk
  match r with
  | FrontResult.reject reason =>
    IO.eprintln s!"error: PARSE-LIVE-IR-PROGRAM reject {reason}"
    throw (IO.userError s!"PARSE-LIVE-IR-PROGRAM reject {reason}")
  | FrontResult.accept m =>
    let k := HostKernel.kernelCheck m
    IO.println s!"PASS PARSE-LIVE-IR-PROGRAM ACCEPT cmds={m.commands.length} kernelCheck={k}"
    unless k do
      IO.eprintln "error: kernelCheck live IrProgram parse false"
      throw (IO.userError "kernelCheck live IrProgram parse false")
    unless hostFrontLiveIrProgramReady do
      IO.eprintln "error: hostFrontLiveIrProgramReady false"
      throw (IO.userError "hostFrontLiveIrProgramReady false")
    IO.println s!"GREEN {stageId}: live IrProgram.lean parse kernelCheck; not multFixtureModule"

def main (args : List String) : IO UInt32 := do
  let root : System.FilePath :=
    match HostFront.filterArgs args with
    | r :: _ => System.FilePath.mk r
    | [] => "."
  try
    runLiveIrProgram root
    pure 0
  catch e =>
    IO.eprintln s!"{e}"
    pure 1

end SystemsLean.HostFrontLiveIrProgram
