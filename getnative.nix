{ lib, buildPythonPackage, fetchFromGitHub, matplotlib, vapoursynth }:

buildPythonPackage rec {
  pname = "getnative";
  version = "3.2.1";

  src = fetchFromGitHub {
    owner  = "Infiziert90";
    repo   = "getnative";
    rev    = version;
    sha256 = "0jnkwd84z72yl96vbz08rcwgn65ldhyiwpcyj0wdgmr3nyxivlmb";
  };

  buildInputs = [ vapoursynth ];

  propagatedBuildInputs = [ matplotlib ];

  doCheck = false;

  meta = with lib; {
    description = "Find the native resolution(s) of upscaled material (mostly anime)";
    homepage    = "https://github.com/Infiziert90/getnative";
    license     = licenses.mit;
  };
}
