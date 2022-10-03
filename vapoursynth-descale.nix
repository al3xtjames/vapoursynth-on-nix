{ lib, stdenv, fetchFromGitHub, meson, ninja, pkg-config, which
, vapoursynth
}:

stdenv.mkDerivation rec {
  pname = "vapoursynth-descale";
  version = "r8";

  src = fetchFromGitHub {
    owner  = "Irrational-Encoding-Wizardry";
    repo   = "descale";
    rev    = version;
    sha256 = "1ix1k5hkq9yp1yhj2z7rp35z2kack7w72whb0m67s338vjhfi1kn";
  };

  nativeBuildInputs = [ meson ninja pkg-config which ];

  buildInputs = [ vapoursynth ];

  patches = [
    ./patches/fix-export-descale.patch
  ];

  postInstall = ''
    mkdir -p $out/lib/vapoursynth
    ln -s $out/lib/libdescale.so $out/lib/vapoursynth/libdescale.so
  '';

  meta = with lib; {
    description = "VapourSynth plugin to undo upscaling";
    homepage    = "https://github.com/Irrational-Encoding-Wizardry/descale";
    license     = licenses.mit;
    platforms   = platforms.x86_64;
  };
}
