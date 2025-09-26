{
  settings = {
    theme = "snazzy";

    font-size = 13;
    font-family = "JetBrains Mono NF";
    

    window-height = 30
    window-width = 134
    macos-titlebar-style = "tabs"
    
    keybind = [
      # Splits
      "super+b>\=new_split:right"
      "super+b>-=new_split:down"
      "super+b>e=equalize_splits"
      "super+b>z=toggle_split_zoom"

      # Split Navigation
      "super+b>h=goto_split:left"
      "super+b>j=goto_split:bottom"
      "super+b>k=goto_split:top"
      "super+b>l=goto_split:right"
      "super+b>left=goto_split:left"
      "super+b>down=goto_split:bottom"
      "super+b>up=goto_split:top"
      "super+b>right=goto_split:right"
    ];
}
} 