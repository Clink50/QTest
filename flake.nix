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
      buildToolsVersion = "33.0.1";
    in {
      devShells.default = let
        android = pkgs.callPackage ./nix/android.nix {buildToolsVersions = [buildToolsVersion];};
      in
        pkgs.mkShell rec {
          buildInputs = with pkgs; [
            flutter
            jdk17
            android.platform-tools
          ];

          ANDROID_HOME = "${android.androidsdk}/libexec/android-sdk";
          JAVA_HOME = pkgs.jdk17;
          ANDROID_AVD_HOME = (toString ./.) + "/.android/avd";
          GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${ANDROID_HOME}/build-tools/${buildToolsVersion}/aapt2";
        };
    });
}
