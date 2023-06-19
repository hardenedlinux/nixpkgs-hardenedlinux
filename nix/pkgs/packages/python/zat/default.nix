{
  stdenv,
  lib,
  python3Packages,
  nixpkgs-hardenedlinux-python-sources,
}:
python3Packages.buildPythonPackage rec {
  inherit (nixpkgs-hardenedlinux-python-sources.zat) pname src version;
  propagatedBuildInputs = with python3Packages; [pandas scikit-learn pyarrow requests watchdog numpy pyspark];
  doCheck = false;
  meta = with lib; {
    description = "Bro Analysis Tools (BAT): Processing and analysis of Bro network data with Pandas, scikit-learn, and Spark";
    homepage = "https://github.com/SuperCowPowers/bat";
    license = licenses.asl20;
  };
}
