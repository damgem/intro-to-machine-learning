{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};

      pythonEnv = pkgs.python3Packages.python.withPackages (ps: [
        ps.ipython
        ps.jupyter
	ps.jupyterlab-git
        ps.numpy
        ps.pandas
	ps.matplotlib
        ps.scikit-learn
      ]);

    in
     {
      defaultPackage = pkgs.mkShell {
        name = "intro-to-ml";
        buildInputs = [ pythonEnv ];
        shellHook = ''
          export LC_ALL=en_US.UTF-8
          export LANG=en_US.UTF-8
          echo "Welcome to your Jupyter environment. Type 'jupyter lab' to start."
        '';
      };

      defaultApp = {
        type = "app";
        program = "${pkgs.writeShellScriptBin "run-jupyter-lab" ''exec ${pythonEnv}/bin/jupyter lab "$@"''}/bin/run-jupyter-lab";
      };
     }
  );
}
