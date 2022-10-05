{ lib, stdenv, fetchFromGitHub, meson, ninja, pkg-config, which
, vapoursynth
}:

stdenv.mkDerivation rec {
  pname = "vapoursynth-remapframes";
  version = "v1.1";

  src = fetchFromGitHub {
    owner  = "Irrational-Encoding-Wizardry";
    repo   = "Vapoursynth-RemapFrames";
    rev    = version;
    sha256 = "1ki5yvlrw1x3hr3jb9mi7va66kl6lq5f2aynylz5lsx2f14iavra";
  };

  nativeBuildInputs = [ meson ninja pkg-config which ];

  buildInputs = [ vapoursynth ];

  meta = with lib; {
    description = "Vapoursynth port of RemapFrames";
    homepage    = "https://github.com/Irrational-Encoding-Wizardry/Vapoursynth-RemapFrames";
    license     = licenses.bsd2;
    platforms   = platforms.x86_64;
  };
}
