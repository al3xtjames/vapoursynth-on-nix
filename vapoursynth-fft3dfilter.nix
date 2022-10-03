{ lib, stdenv, fetchFromGitHub, meson, pkg-config, ninja
, fftwFloat, vapoursynth
}:

stdenv.mkDerivation rec {
  pname = "vapoursynth-fft3dfilter";
  version = "R2";

  src = fetchFromGitHub {
    owner  = "myrsloik";
    repo   = "VapourSynth-FFT3DFilter";
    rev    = version;
    sha256 = "0kwzkhhsw5wsrcxcg11n2gava2wq1w96bvdz6s188c1090c0gm61";
  };

  nativeBuildInputs = [ meson ninja pkg-config ];

  buildInputs = [ vapoursynth fftwFloat ];

  patches = [
    ./patches/fix-export-fft3d.patch
  ];

  postInstall = ''
    mkdir -p $out/lib/vapoursynth
    ln -s $out/lib/libfft3dfilter.so $out/lib/vapoursynth/libfft3dfilter.so
  '';

  meta = with lib; {
    description = "VapourSynth port of FFT3DFilter";
    homepage    = "https://github.com/myrsloik/VapourSynth-FFT3DFilter";
    license     = licenses.gpl2;
    platforms   = platforms.x86_64;
  };
}
