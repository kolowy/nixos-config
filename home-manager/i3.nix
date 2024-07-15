{ config, lib, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      bars = [{
        position = "top";
      }];
    };
  };
}
