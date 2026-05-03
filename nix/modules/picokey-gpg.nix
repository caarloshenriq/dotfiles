{ config, lib, pkgs, ... }:

let
  cfg = config.carlin.hardware.picokey;
in
{
  options.carlin.hardware.picokey = {
    enable = lib.mkEnableOption "Pico Key OpenPGP/GPG smartcard support";
  };

  config = lib.mkIf cfg.enable {

    nixpkgs.overlays = [
      (final: prev: {
        ccid = prev.ccid.overrideAttrs (old: {
          nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ final.perl ];

          postInstall = (old.postInstall or "") + ''
            plist="$out/pcsc/drivers/ifd-ccid.bundle/Contents/Info.plist"

            if ! grep -q "0x2E8A" "$plist"; then
              perl -0pi -e 's|(<key>ifdVendorID</key>\s*<array>\s*)|$1<string>0x2E8A</string>\n        |' "$plist"
              perl -0pi -e 's|(<key>ifdProductID</key>\s*<array>\s*)|$1<string>0x10FF</string>\n        |' "$plist"
              perl -0pi -e 's|(<key>ifdFriendlyName</key>\s*<array>\s*)|$1<string>Pico Key OpenPGP</string>\n        |' "$plist"
            fi
          '';
        });
      })
    ];

    services.pcscd = {
      enable = true;
      plugins = [ pkgs.ccid ];
    };

    hardware.gpgSmartcards.enable = true;

    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="2e8a", ATTR{idProduct}=="10ff", MODE="0660", TAG+="uaccess"
    '';
  };
}
