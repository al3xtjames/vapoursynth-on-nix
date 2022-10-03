{ lib, stdenv, fetchFromGitHub, autoreconfHook, vapoursynth }:

stdenv.mkDerivation rec {
  pname = "vapoursynth-fmtconv";
  version = "r30";

  src = fetchFromGitHub {
    owner  = "EleonoreMizo";
    repo   = "fmtconv";
    rev    = version;
    sha256 = "0k0szac9rc98rchx8m3v6731kvbkd4hpdnxql6w2ljb8gcvyi1qv";
  };

  nativeBuildInputs = [ autoreconfHook ];

  buildInputs = [ vapoursynth ];

  preAutoreconf = "cd build/unix";

  configureFlags = [ "--libdir=$(out)/lib/vapoursynth" ];

  meta = with lib; {
    description = "Format conversion tools for Vapoursynth";
    homepage    = "https://github.com/EleonoreMizo/fmtconv";
    license     = licenses.wtfpl;
    platforms   = platforms.x86_64;
  };
}
