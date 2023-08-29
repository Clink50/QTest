{androidenv}:
androidenv.composeAndroidPackages {
  toolsVersion = "26.1.1";
  platformToolsVersion = "34.0.4";
  buildToolsVersions = ["33.0.1"];
  includeEmulator = false;
  platformVersions = ["33"];
  includeSources = false;
  includeSystemImages = false;
  systemImageTypes = ["google_apis_playstore"];
  abiVersions = ["armeabi-v7a" "arm64-v8a"];
  cmakeVersions = ["3.22.1"];
  includeNDK = true;
  ndkVersions = ["25.2.9519653"];
  useGoogleAPIs = false;
  useGoogleTVAddOns = false;
}
