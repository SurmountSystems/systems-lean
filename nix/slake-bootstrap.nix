# SPDX-License-Identifier: Unlicense
# Upstream Lean 4.35.0, built by Nix so the interpreter is in the store.
# The sandbox stays on. Do not set a no-chroot attribute on these
# derivations, and do not fetch the linux release tarball.
# This binary is the bootstrap. It does not mean Slake compiles Slake.
# Do not claim slakeOwnsPackageTypecheck.
#
# The compiler source is leanprover/lean4 tag v4.35.0, the same pin as
# src/systems/lean-toolchain. It is not the nixpkgs lean 4.30.0 package.
# GMP 6.3.0, OpenSSL 3, and LibUV come from nixpkgs. USE_MIMALLOC is off
# so CMake does not clone mimalloc. Cadical 2.1.3 and leantar 0.1.20 are
# on PATH so CMake does not clone or download them either.
# There is no LEAN4LEAN or USE_LEAN4LEAN option. EXCLUDE_FROM_ALL does
# not skip the configure-time git check. lean4lean tag lean4-bundle-4.35
# is fetched, and postPatch copies that tree only if the target is built.
# nanoda, con-leche, and con-ron are not part of ALL, so postPatch drops
# their git clones and does not fetch them. The LibUV git clone is only
# in the Emscripten branch. Linux configure uses find_package(LibUV).
#
# The driver is PackageTypecheck.lean. lean loads each import from an
# olean on LEAN_PATH. A search path that is only the Lean 4 library
# reports an unknown module prefix SystemsLean.
#
# The import closure is 19 modules, dependencies first. It is not the
# package walk and it does not include OccupancyProbe. Each module is
# one lean process (-j 1, LEAN_NUM_THREADS=1). findOLean resolves every
# SystemsLean module under the first SystemsLean directory on
# LEAN_PATH, so each olean is installed into one shared tree. rsync is
# the builder that merges that tree. There is no shell script.
#
# HostFront.lean also defines main. Its C file and the driver C file
# both emit int main. The link allows multiple definitions and passes
# the driver C file first, so the driver's main is the one that is kept.
#
# Stage A emits C for the driver. The store name ends in .c so the C
# compiler treats the file as C. -R is the closure root: lean requires
# the source to sit under the module root. The derivation does not run
# the driver, so it does not walk the package, and it does not compile
# ref/lean4 or mathlib.
{
  lib,
  pkgs,
  system,
  driver,
}:
let
  # Lean 4.34.1 vendors cadical rel-2.1.2. This nixpkgs has a hash for
  # 2.1.3, not 2.1.2. Checks are off so a flaky cadical test cannot fail
  # the bootstrap.
  cadical213 = (pkgs.cadical.override { version = "2.1.3"; }).overrideAttrs (_old: {
    doCheck = false;
  });

  # readelf -l: static-pie, no PT_INTERP, no NEEDED libs. Copy it.
  # Do not patchelf. pkgs.leangz is 0.1.19 and is the wrong version.
  leantar = pkgs.stdenv.mkDerivation {
    pname = "leantar";
    version = "0.1.20";
    src = pkgs.fetchzip {
      url = "https://github.com/digama0/leangz/releases/download/v0.1.20/leantar-v0.1.20-x86_64-unknown-linux-musl.tar.gz";
      hash = "sha256-zz6zDl07qKplGsi04YhKnOFyF3Xz4jzNQ2fW7m4imR8=";
    };
    dontConfigure = true;
    dontBuild = true;
    dontFixup = true;
    installPhase = ''
      runHook preInstall
      mkdir -p "$out/bin"
      cp leantar "$out/bin/leantar"
      chmod 755 "$out/bin/leantar"
      runHook postInstall
    '';
  };

  # Same tag in src/CMakeLists.txt and stage0/src/CMakeLists.txt.
  # Nested stage cmake does not receive the root cmakeFlags, so postPatch
  # writes this store path into both lists. make all does not build it.
  lean4leanSrc = pkgs.fetchFromGitHub {
    owner = "Kha";
    repo = "lean4lean";
    tag = "lean4-bundle-4.35";
    hash = "sha256-VTxvXgJrHeY4ZFRHuyCVFS+iMhTIgTn2h9CWK3BuA9k=";
  };

  # The CMake setup hook treats a missing parallel flag as on, and then
  # make would add -j. Clear that after configure so this stays one job.
  lean = pkgs.stdenv.mkDerivation {
    pname = "lean4";
    version = "4.35.0";

    src = pkgs.fetchFromGitHub {
      owner = "leanprover";
      repo = "lean4";
      tag = "v4.35.0";
      hash = "sha256-WjyIRo2BvfnNq13r+YSnTc6VaYupKJIsgfQhFBMa0aU=";
    };

    # Copy lean4lean into the external-project source dir, which is under
    # the build tree, not the store. Drop git clones that configure would
    # evaluate. LibUV stays in the unevaluated Emscripten branch.
    postPatch = ''
      lean4lean_src=${lean4leanSrc}
      rewrite_cmake() {
        srcfile="$1"
        tmpfile="$srcfile.rewritten"
        awk -v lean4lean_src="$lean4lean_src" '
          function drop_git_tag() {
            if ((getline nxt) > 0) {
              if (nxt ~ /^[[:space:]]*GIT_TAG[[:space:]]/) {
                return
              }
              print nxt
            }
          }
          /^[[:space:]]*GIT_REPOSITORY https:\/\/github.com\/Kha\/lean4lean$/ {
            print "    DOWNLOAD_COMMAND ''${CMAKE_COMMAND} -E copy_directory " lean4lean_src " <SOURCE_DIR>"
            print "    UPDATE_COMMAND \"\""
            drop_git_tag()
            next
          }
          /^[[:space:]]*GIT_REPOSITORY https:\/\/github.com\/(ammkrn\/nanoda_lib|leanprover\/con-leche|leanprover\/con-ron)$/ {
            print "    DOWNLOAD_COMMAND ''${CMAKE_COMMAND} -E echo \"not part of ALL\""
            print "    UPDATE_COMMAND \"\""
            drop_git_tag()
            next
          }
          /^[[:space:]]*GIT_SUBMODULES ""$/ {
            next
          }
          { print }
        ' "$srcfile" > "$tmpfile"
        mv "$tmpfile" "$srcfile"
      }
      rewrite_cmake src/CMakeLists.txt
      rewrite_cmake stage0/src/CMakeLists.txt
      for f in src/CMakeLists.txt stage0/src/CMakeLists.txt; do
        if grep -q "GIT_REPOSITORY https://github.com/Kha/lean4lean" "$f" \
          || grep -q "GIT_REPOSITORY https://github.com/ammkrn/nanoda_lib" "$f" \
          || grep -q "GIT_REPOSITORY https://github.com/leanprover/con-leche" "$f" \
          || grep -q "GIT_REPOSITORY https://github.com/leanprover/con-ron" "$f"; then
          echo "git clone still present in $f" >&2
          exit 1
        fi
        if ! grep -q "copy_directory $lean4lean_src" "$f"; then
          echo "lean4lean source path missing in $f" >&2
          exit 1
        fi
      done
    '';

    preConfigure = ''
      patchShebangs stage0/src/bin src/bin
    '';

    postConfigure = ''
      unset enableParallelBuilding
      unset enableParallelInstalling
      unset CMAKE_BUILD_PARALLEL_LEVEL
    '';

    nativeBuildInputs = [
      pkgs.cmake
      pkgs.pkg-config
      cadical213
      leantar
    ];

    buildInputs = [
      pkgs.gmp
      pkgs.libuv
      pkgs.openssl
    ];

    cmakeFlags = [
      "-DUSE_GITHASH=OFF"
      "-DINSTALL_LICENSE=OFF"
      "-DINSTALL_CADICAL=OFF"
      "-DCCACHE=OFF"
      "-DLLVM=OFF"
      "-DUSE_MIMALLOC=OFF"
    ];

    enableParallelBuilding = false;
    doCheck = false;
  };

  path = lib.makeBinPath [
    lean
    pkgs.coreutils
    pkgs.stdenv.cc
  ];
  gmpLib = "${pkgs.gmp}/lib";
  libuvLib = "${pkgs.libuv}/lib";
  libraryPath = "${gmpLib}:${libuvLib}";
  nixLdFlags = "-L${gmpLib} -L${libuvLib}";
  buildEnv = {
    PATH = path;
    LIBRARY_PATH = libraryPath;
    NIX_LDFLAGS = nixLdFlags;
    LEAN_NUM_THREADS = "1";
  };

  # Dependencies first. PackageTypecheck is compiled last, to C.
  # Mult, HostFrontGoldens, EqSomeBinder, and LessThan have no
  # SystemsLean import. The rest follow the import edges.
  closureMods = [
    "Mult"
    "HostFrontGoldens"
    "EqSomeBinder"
    "LessThan"
    "HostTerm"
    "ProofByCases"
    "EdmontonTypecheckDriver"
    "EdmontonLivePin"
    "EdmontonLiveCheck"
    "EdmontonTheoremOnly"
    "EdmontonTheoremMix"
    "EdmontonProductForward"
    "EdmontonStringBody"
    "EdmontonTheoremMain"
    "EdmontonClosedBody"
    "EdmontonMainClosed"
    "EdmontonTwoEnd"
    "EdmontonMutualForm"
    "EdmontonChain"
    "HostFrontLine"
    "HostFront"
    "TheoremBinder"
    "MultFrontBinders"
    "MultFrontType"
    # Readers before FranciscoChain. Chain imports them. MultFront
    # imports Chain, so Chain stays before MultFront.
    "FranciscoTopScan"
    "FranciscoLiveSource"
    "FranciscoStringAlias"
    "FranciscoLiveParser"
    "FranciscoEmbeddedMain"
    "FranciscoPinnedChecker"
    "FranciscoIrWriter"
    "FranciscoClaimBundle"
    "FranciscoTheoremSurface"
    "FranciscoStructSurface"
    "FranciscoCfgTable"
    "FranciscoProductSurface"
    "FranciscoPackageEnv"
    "FranciscoPathProject"
    "FranciscoPackageWriter"
    "FranciscoWalkJoin"
    "FranciscoUseCheck"
    "FranciscoChain"
    "MultFront"
    "HostKernelReduce"
    "HostKernelRfl"
    "HostKernelSsot"
    "HostKernelRequire"
    "HostKernelDual"
    "HostKernelSpecs"
    "HostKernelRead"
    "HostKernelMarker"
    "HostKernelMeasure"
    "HostKernelApply"
    "HostKernelFilter"
    "HostKernelBy"
    "HostKernelIte"
    "HostKernelForward"
    "HostKernel"
    "BellerophonLongLiteral"
    "HonestyFront"
    "HonestyDecide"
    "HonestyThmFront"
    "HonestyBound"
    "HonestyLetRec"
    "HonestySpecList"
    "HonestyCompose"
    "HonestyRequire"
    "HonestySearch"
    "HonestyCapable"
    "ThinMainFront"
    "BellerophonHmcBarrel"
    # LivePin before HonestyEqFront. EqFront imports it, and the
    # compiler looks for that object in the previous module tree.
    "BellerophonLivePin"
    "HonestyEqFront"
    "HonestyMeasureFront"
    "HonestyMeasureMainFront"
    "HonestyFullBarFront"
    "HonestyReadFront"
    "HonestyReadThmFront"
    "HonestyPipelineThmFront"
    "HonestyStepThmFront"
    "HonestyGapThmFront"
    "HonestyPipelineFront"
    "DiaphenesTacticForm"
    "HonestyWriteFront"
    "HonestyLoadFront"
    "HonestyCatchFront"
    "HonestyVerdictFront"
    "HonestyNatClaimFront"
    "DiaphenesDriverPins"
    "DiaphenesRawCarrier"
    "DiaphenesLivePins"
    "HonestyStrCatFront"
    "HonestyExampleFront"
    "HonestyBoolExFront"
    "DiaphenesNsAtoms"
    "HonestyTrueCatFront"
    "HonestyQualFront"
    "HonestyDecideFront"
    "HonestyGapEqFront"
    "HonestyCloseEqFront"
    "CallistoLiveTriple"
    "CallistoLivePair"
    "CallistoKernelTwo"
    "CallistoRawEmbed"
    "CallistoLiveTrue"
    "CallistoLiveMut"
    "CallistoLiveFour"
    "CallistoLiveRear"
    "CallistoLiveSurface"
    "CallistoLoadPair"
    "CallistoFiveTrue"
    "CallistoCheckDriver"
    "CallistoCheckBarrel"
    "CallistoCheckCite"
    "CallistoLinearStruct"
    "CallistoLinearThm"
    "CallistoMultFront"
    "CallistoPathPlan"
    "CallistoProofCases"
    "CallistoBenchMain"
    "CallistoSelfHost"
    "CallistoElfThm"
    "CallistoImportOnly"
    "CallistoThmOne"
    "CallistoThmForm"
    "HonestyParityEqFront"
    "AdastriaScan"
    "AdastriaElabMeet"
    "AdastriaEmitUnit"
    "AdastriaHostFrontLive"
    "AdastriaHostModCheck"
    "AdastriaHostImport"
    "AdastriaEqBinder"
    "AdastriaFsEmitLoad"
    "AdastriaFrontGoldens"
    "HonestyDualResFront"
    "HonestyDualResThmFront"
    "BellerophonRawString"
    "BellerophonImportThm"
    "BellerophonImportLit"
    "BellerophonImportCode"
    "BellerophonNsCode"
    "BellerophonMutualEnd"
    "BellerophonImportNs"
    "HonestyEmitApplyFront"
    "HonestyEmitScafFront"
    "SlakeCheckSource"
    "WalkRoot"
  ];

  closureFiles = map (mod: "SystemsLean/${mod}.lean") (closureMods ++ [ "PackageTypecheck" ]);

  # A flake copy of this repo omits files git does not track. Twenty-one
  # closure modules are untracked, and this file must not git add.
  # SLAKE_SYSTEMS_ROOT is the real src/systems directory so those
  # modules are copied. Without it, the fallback is the flake snapshot.
  systemsRoot =
    let
      envRoot = builtins.getEnv "SLAKE_SYSTEMS_ROOT";
    in
    if envRoot == "" then ../src/systems else /. + envRoot;

  # Only the closure sources. OccupancyProbe and the other product
  # files stay out of this store path.
  closureSrc = builtins.path {
    name = "slake-bootstrap-closure";
    path = systemsRoot;
    filter =
      path: type:
      let
        rootStr = toString systemsRoot;
        pathStr = toString path;
        rel = if pathStr == rootStr then "" else lib.removePrefix (rootStr + "/") pathStr;
      in
      (type == "directory" && (rel == "" || rel == "SystemsLean"))
      || builtins.elem rel closureFiles;
  };

  # One lean, then install the olean into SystemsLean/, then merge it
  # onto the previous tree. The next lean depends on that tree, so Nix
  # does not run two leans at once.
  compileClosure = lib.foldl (
    acc: mod:
    let
      leanAttrs = buildEnv // {
        name = "slake-bootstrap-${mod}.c";
        inherit system;
        outputs = [
          "out"
          "olean"
        ];
        builder = "${lean}/bin/lean";
        args = [
          "-j"
          "1"
          "-R"
          closureSrc
          "-o"
          (builtins.placeholder "olean")
          "-c"
          (builtins.placeholder "out")
          "${closureSrc}/SystemsLean/${mod}.lean"
        ];
      };
      compiled = builtins.derivation (
        if acc.tree == null then leanAttrs else leanAttrs // { LEAN_PATH = acc.tree; }
      );
      placed = builtins.derivation {
        name = "slake-bootstrap-${mod}-place";
        inherit system;
        builder = "${pkgs.coreutils}/bin/install";
        args = [
          "-D"
          "-m"
          "644"
          compiled.olean
          "${builtins.placeholder "out"}/SystemsLean/${mod}.olean"
        ];
      };
      tree =
        if acc.tree == null then
          placed
        else
          builtins.derivation {
            name = "slake-bootstrap-${mod}-tree";
            inherit system;
            builder = "${pkgs.rsync}/bin/rsync";
            args = [
              "-r"
              "--links"
              "${acc.tree}/"
              "${placed}/"
              (builtins.placeholder "out")
            ];
          };
    in
    {
      tree = tree;
      cs = acc.cs ++ [ compiled ];
    }
  ) { tree = null; cs = [ ]; } closureMods;

  # Upstream Lean 4.35.0 emits C for the driver. Thread cap is -j 1.
  # LEAN_PATH is the closure olean tree, not the Lean library alone.
  stageA = builtins.derivation (
    buildEnv
    // {
      name = "slake-bootstrap.c";
      inherit system;
      builder = "${lean}/bin/lean";
      args = [
        "-j"
        "1"
        "-R"
        closureSrc
        "-c"
        (builtins.placeholder "out")
        "${closureSrc}/SystemsLean/PackageTypecheck.lean"
      ];
      LEAN_PATH = compileClosure.tree;
    }
  );

  # leanc links the driver C file and the closure C files. The driver
  # object is first so its main wins over HostFront's main.
  stageB = builtins.derivation (
    buildEnv
    // {
      name = "slake-bootstrap";
      inherit system;
      builder = "${lean}/bin/leanc";
      args = [
        "-Wl,--allow-multiple-definition"
        "-o"
        (builtins.placeholder "out")
        "${stageA}"
      ] ++ map (compiled: "${compiled}") compileClosure.cs;
    }
  );
in
assert lib.hasSuffix "PackageTypecheck.lean" (baseNameOf driver);
stageB
