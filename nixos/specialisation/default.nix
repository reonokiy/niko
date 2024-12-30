{
  specialisation = {
    performance.configuration = {
      system.nixos.tags = [ "performance" ];
      imports = [
        ./performance.nix
      ];
    };
  };
}
