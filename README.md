# Introduction to machine learning

Weekly submissions for the lecture `Introduction to machine learning` at University of Bonn.

## Run

You can open the notebooks in the code editor of your choice. As I'm toying around with the package manager `nix`, I've included a way to spin up a consistent jupyter lab.

To install via `nix`:
 - first install nix: https://zero-to-nix.com/concepts/nix-installer
   ```sh
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```
  - then run jupyter lab via: `nix run`
    - make sure you are in the root directory of this project and can see the `flake.nix` file
