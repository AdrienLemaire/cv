{
  description = "LaTeX toolchain to build the CV";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs:
        let
          tex = pkgs.texlive.withPackages (ps: with ps; [
            scheme-small
            boxedminipage
            catoptions
            collectbox
            cv4tw
            fancyhdr
            fontawesome
            forloop
            lastpage
            libertine
            navigator
            needspace
            newenviron
            pbox
            picinpar
            realboxes
            wrapfig
            xstring
          ]);
        in
        {
          default = pkgs.mkShell {
            packages = [ tex pkgs.gnumake pkgs.poppler-utils ];
            FONTCONFIG_FILE = pkgs.makeFontsConf {
              fontDirectories = [ "${tex}/share/texmf/fonts/opentype" ];
            };
          };
        });
    };
}
