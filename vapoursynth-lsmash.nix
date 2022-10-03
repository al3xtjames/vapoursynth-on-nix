{ lib, stdenv, fetchFromGitHub, meson, ninja, pkg-config, which
, ffmpeg, l-smash, vapoursynth
}:

stdenv.mkDerivation rec {
  pname = "vapoursynth-lsmash";
  version = "vA.3i";

  src = fetchFromGitHub {
    owner  = "AkarinVS";
    repo   = "L-SMASH-Works";
    rev    = version;
    sha256 = "1ca8pylb1fpjr08x1n4w6f18jpnrn8snzd4bjhk10k7wkgd0gvx4";
  };

  nativeBuildInputs = [ meson ninja pkg-config which ];

  buildInputs = [ vapoursynth ffmpeg l-smash ];

  patches = [
    ./patches/fix-export-lsmash.patch
  ];

  preConfigure = ''
    cd VapourSynth
  '';

  postInstall = ''
    mkdir -p $out/lib/vapoursynth
    ln -s $out/lib/libvslsmashsource.so $out/lib/vapoursynth/libvslsmashsource.so
  '';

  meta = with lib; {
    description = "Vapoursynth plugin for lsmash";
    homepage    = "https://github.com/VFR-maniac/L-SMASH-Works/tree/master/VapourSynth";
    license     = licenses.isc;
    platforms   = platforms.x86_64;
  };
}
