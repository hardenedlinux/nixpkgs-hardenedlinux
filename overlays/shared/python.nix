final: prev: {
  __dontExport = true;
  python3 = prev.python3.override (
    old: {
      packageOverrides = prev.lib.composeExtensions (old.packageOverrides or (_: _: {})) (
        selfPythonPackages: pythonPackages: {
          scikit-learn = pythonPackages.scikit-learn.overridePythonAttrs (oldAttrs: {doCheck = false;});
        }
      );
    }
  );
}
