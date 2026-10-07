{
  description = "Satisfied?";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { ... }: rec {
    overlays.default = overlays.lazycontainer;
    overlays.lazycontainer = final: prev: {
      lazycontainer = prev.lazydocker.overrideAttrs (prevAttrs: {
        pname = "lazycontainer";
        postInstall = ''
          mv $out/bin/lazydocker $out/bin/lazycontainer
        '';
        meta = prevAttrs.meta // { mainProgram = "lazycontainer"; };
      });
    };
  };
}
