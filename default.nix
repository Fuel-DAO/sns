{}:
let
  rev = "94035b482d181af0a0f8f77823a790b256b7c3cc";
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  pkgs = import nixpkgs { };
  version = "20240413";
    dfx-env = import (builtins.fetchTarball "https://github.com/ninegua/ic-nix/releases/download/${version}/dfx-env.tar.gz") { version = version; inherit pkgs; };
in
dfx-env.overrideAttrs (old: {
  # nativeBuildInputs = with pkgs; old.nativeBuildInputs ++
  #   [
  #     rustup pkg-config openssl protobuf cmake cachix killall jq coreutils bc python3Full
  #   ] ++ (if pkgs.stdenv.isDarwin then [
  #     darwin.apple_sdk.frameworks.Foundation
  #     pkgs.darwin.libiconv
  #   ] else []);
    shellHook = ''
      echo "$FUEL_DAO_SNS_CONTROLLER_ADMIN_PRIVATE_KEY" > ~/identity.pem
      dfx identity import fuel_dao_sns ~/identity.pem --storage-mode plaintext
      rm ~/identity.pem
      dfx identity use fuel_dao_sns
    '';
})