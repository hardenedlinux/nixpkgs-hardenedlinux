{ self
, inputs
, ...
}:
{
  input = inputs.latest;
  overlaysBuilder = channels: [
    inputs.statix.overlay
  ];
}
