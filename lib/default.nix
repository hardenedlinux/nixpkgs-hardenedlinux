{lib}:
lib.extend (
  final: prev:
    import ./self.nix {lib = prev;}
)
