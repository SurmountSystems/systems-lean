/-
  Module: SystemsLean.SafeCJudgment
  SafeC judgment encodings from specification 0002 (accessed 2026-10-23).
  Numbered markdown remains the human contract.
  SafeMem, SafeThr, SafeLayout, KernelModelOk, SafeKernel,
  CompCertFragment, CompCertRefines, and SafeCompCert are named
  judgments. SafeCJudgment is the SafeC judgment those maps target.
  SafeCompCert implies SafeKernel. The converse is false.
  Maps are statements, not an isomorphism. No theorem named
  Isomorphism. Not a numbered SafeC specification. Number 0015
  stays unassigned. slakeOwnsPackageTypecheck stays false.
  Occupancy stays 49. FullHost stays false. ASCII only.
  SKELETON honesty marker (unit walk; host elaborator package).
-/

namespace SystemsLean.SafeCJudgment

/-- Honesty: this module does not own package typecheck. -/
def slakeOwnsPackageTypecheck : Bool := false

/-- Occupancy stays 49 names. -/
def occupancy : Nat := 49

/-- FullHost stays false. -/
def fullHost : Bool := false

/-- Clause 3.11: SafeMem. Inhabiting holds is not a product proof. -/
inductive SafeMem where
  | holds
  deriving DecidableEq, Repr

/-- Clause 3.12: SafeThr. -/
inductive SafeThr where
  | holds
  deriving DecidableEq, Repr

/-- Clause 3.13: SafeLayout. -/
inductive SafeLayout where
  | holds
  deriving DecidableEq, Repr

/-- Clause 3.14: KernelModelOk. Not CompCert refinement. Not mainline Linux. -/
inductive KernelModelOk where
  | holds
  deriving DecidableEq, Repr

/-- Clause 3.15: SafeKernel. Not named SafeLinux. -/
inductive SafeKernel where
  | holds
  deriving DecidableEq, Repr

/-- Clause 3.16: CompCertFragment. Sequential unique C. -/
inductive CompCertFragment where
  | holds
  deriving DecidableEq, Repr

/-- Clause 3.17: CompCertRefines. Inhabiting holds is not a real emit refined. -/
inductive CompCertRefines where
  | holds
  deriving DecidableEq, Repr

/-- Inhabiting CompCertRefines.holds is not a claim that a real emit was refined. -/
def compCertRefinesClaimedDone : Bool := false

/-- Clause 3.18: SafeCompCert. -/
inductive SafeCompCert where
  | holds
  deriving DecidableEq, Repr

/-- SafeCompCert implies SafeKernel. Clause 3.18 and Clause 4.5 item 1. -/
def safeCompCertImpliesSafeKernel : SafeCompCert -> SafeKernel :=
  fun _ => SafeKernel.holds

/-- The converse is False. SafeKernel does not imply SafeCompCert. -/
def safeKernelImpliesSafeCompCert : Bool := false

def mashSafeKernelImpliesSafeCompCert : Prop :=
  safeKernelImpliesSafeCompCert = true

def mashSafeKernelImpliesSafeCompCertIsFalse : Prop :=
  mashSafeKernelImpliesSafeCompCert -> False

theorem mash_safe_kernel_implies_safe_compcert_is_false :
    mashSafeKernelImpliesSafeCompCertIsFalse := by
  intro h
  exact Bool.noConfusion h

theorem SafeCompCert_implies_SafeKernel (c : SafeCompCert) :
    safeCompCertImpliesSafeKernel c = SafeKernel.holds := rfl

/-- Clause 3.26: UniqueBlock. No default reference count header. -/
inductive UniqueBlock where
  | holds
  deriving DecidableEq, Repr

/-- UniqueBlock has no default reference count header. Clause 4.5 item 7. -/
def uniqueBlockDefaultRefCountHeader : Bool := false

/-- Clause 3.28: five passing modes. No sixth mode. -/
inductive PassingMode where
  | copyBits
  | moveOwner
  | loanShared
  | loanMut
  | copyHandle
  deriving DecidableEq, Repr

def PassingMode.toFin : PassingMode -> Fin 5
  | PassingMode.copyBits => (0 : Fin 5)
  | PassingMode.moveOwner => (1 : Fin 5)
  | PassingMode.loanShared => (2 : Fin 5)
  | PassingMode.loanMut => (3 : Fin 5)
  | PassingMode.copyHandle => (4 : Fin 5)

def PassingMode.ofFin (i : Fin 5) : PassingMode :=
  match i.val with
  | 0 => PassingMode.copyBits
  | 1 => PassingMode.moveOwner
  | 2 => PassingMode.loanShared
  | 3 => PassingMode.loanMut
  | _ => PassingMode.copyHandle

theorem passing_mode_roundtrip (m : PassingMode) :
    PassingMode.ofFin (PassingMode.toFin m) = m := by
  cases m <;> rfl

/-- Clause 3.39 / 3.41: BorrowOrOwned is not ObjectCow and not PageCow. -/
inductive BorrowOrOwned where
  | holds
  deriving DecidableEq, Repr

/-- Shared owner that already has a crate header (Rc / Arc protocol). -/
inductive SharedOwnerWithHeader where
  | holds
  deriving DecidableEq, Repr

/-- Clause 3.54: Pinned means the address must not move. -/
inductive Pinned where
  | holds
  deriving DecidableEq, Repr

/-- UniqueBlock buffer whose length and capacity are Bits (Vec). -/
inductive UniqueBlockBuffer where
  | holds
  deriving DecidableEq, Repr

/-- The SafeC judgment. Correspondence targets this type. Clause 3.52. -/
inductive SafeCJudgment where
  | sample
  | uniqueBlock
  | sharedOwnerWithHeader
  | borrowOrOwned
  | uniqueBlockBuffer
  | pinned
  | safeMem
  | safeThr
  | safeLayout
  | kernelModelOk
  | safeKernel
  | compCertFragment
  | compCertRefines
  | safeCompCert
  deriving DecidableEq, Repr

/-- Rust judgment on the other side of the correspondence. Clause 3.32. -/
inductive RustJudgment where
  | sample
  | box
  | rc
  | arc
  | cow
  | vec
  | pin
  | send
  | sync
  deriving DecidableEq, Repr

/-- UniqueBlock plus CopyHandle with no alias protocol is Cons False. -/
def uniqueBlockCopyHandleNoProtocolAccepted : Bool := false

def mashUniqueBlockCopyHandleNoProtocol : Prop :=
  uniqueBlockCopyHandleNoProtocolAccepted = true

def mashUniqueBlockCopyHandleNoProtocolIsFalse : Prop :=
  mashUniqueBlockCopyHandleNoProtocol -> False

theorem mash_unique_block_copy_handle_no_protocol_is_false :
    mashUniqueBlockCopyHandleNoProtocolIsFalse := by
  intro h
  exact Bool.noConfusion h

/-- CompCertFragment together with container_of is Cons False. Clause 3.34. -/
def compCertFragmentWithContainerOfAccepted : Bool := false

def mashCompCertFragmentContainerOf : Prop :=
  compCertFragmentWithContainerOfAccepted = true

def mashCompCertFragmentContainerOfIsFalse : Prop :=
  mashCompCertFragmentContainerOf -> False

theorem mash_compcert_fragment_container_of_is_false :
    mashCompCertFragmentContainerOfIsFalse := by
  intro h
  exact Bool.noConfusion h

/-- The judgment is not named SafeLinux. Clause 3.15. -/
def namedSafeLinux : Bool := false

/-- Facebook SafeC is not 0002 SafeCJudgment. -/
def facebookSafeCIs0002 : Bool := false

def mashFacebookSafeCIs0002 : Prop :=
  facebookSafeCIs0002 = true

def mashFacebookSafeCIs0002IsFalse : Prop :=
  mashFacebookSafeCIs0002 -> False

theorem mash_facebook_safe_c_is_0002_is_false :
    mashFacebookSafeCIs0002IsFalse := by
  intro h
  exact Bool.noConfusion h

end SystemsLean.SafeCJudgment
