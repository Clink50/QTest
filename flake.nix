{
  description = "An example project using flutter";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.android_sdk.accept_license = true;
      };
    in {
      devShells.default = let
        android = pkgs.callPackage ./nix/android.nix {};
      in
        pkgs.mkShell {
          buildInputs = with pkgs; [
            flutter
            jdk11
            android.platform-tools
          ];

          ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
          JAVA_HOME = pkgs.jdk11;
          ANDROID_AVD_HOME = (toString ./.) + "/.android/avd";
        };
    });
}
