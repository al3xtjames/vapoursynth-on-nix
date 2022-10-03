self: super: rec {
  knlmeanscl = super.callPackage ./knlmeanscl.nix {};
  vapoursynth-bm3d = super.callPackage ./vapoursynth-bm3d.nix {};
  vapoursynth-descale = super.callPackage ./vapoursynth-descale.nix {};
  vapoursynth-fft3dfilter = super.callPackage ./vapoursynth-fft3dfilter.nix {};
  vapoursynth-fmtconv = super.callPackage ./vapoursynth-fmtconv.nix {};
  vapoursynth-lsmash = super.callPackage ./vapoursynth-lsmash.nix {};
  vapoursynth-nnedi3 = super.callPackage ./vapoursynth-nnedi3.nix {};
}
