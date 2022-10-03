{ pkgs ? import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; } }:
with pkgs;
let
  vapoursynth = pkgs.python310Packages.vapoursynth.withPlugins [
    knlmeanscl
    vapoursynth-bm3d
    vapoursynth-descale
    vapoursynth-fft3dfilter
    vapoursynth-fmtconv
    vapoursynth-lsmash
    vapoursynth-mvtools
    vapoursynth-nnedi3
  ];
in mkShell {
  nativeBuildInputs = [
    ffmpeg
    l-smash
    python310
    vapoursynth
  ];
}
