{
  description = "Satisfied?";

  outputs = { self }: rec {
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
