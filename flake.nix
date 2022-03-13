{
  inputs = {
    nixpkgs.url = "github:NickCao/nixpkgs/nixos-unstable-small";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      with pkgs;{
        packages.default = stdenv.mkDerivation rec {
          pname = "dpc++";
          version = "20220312";
          src = fetchurl {
            url = "https://github.com/intel/llvm/releases/download/sycl-nightly/${version}/dpcpp-compiler.tar.gz";
            hash = "sha256-7ZFlKb5fpYrrA49jU50yyt4ltvBOnVIfTKZicTTXWv0=";
          };
          dontUnpack = true;
          nativeBuildInputs = [ autoPatchelfHook ];
          buildInputs = [ gccForLibs zlib ncurses5 ];
          installPhase = ''
            mkdir -p $out
            tar -x -f $src --strip-components 1 --exclude sys_check --exclude startup.sh -C $out
          '';
        };
      });
}
