DrawSetText(c_white, fDefault, fa_center, fa_top);
var xx = display_get_gui_width()/2;
var yy = display_get_gui_height()/2 - 300;
draw_text(xx, yy, string(distanceTravelled) + "m" );
draw_text(xx, yy-60, "HP: " +string(hp));
draw_text(xx, yy-40, "Combo Count: " +string(StateManager.currentComboCount));


//view_w_half = view_wport[0]/2;
//view_h_half = view_hport[0]/2;

//draw_sprite(sHealthBarBg, 0, view_w_half - healthBarWidth/2, view_h_half/4);
//draw_sprite_stretched(sHealthBar, 0, view_w_half - healthBarWidth/2, view_h_half/4, min(healthBarWidth, currentHealth/maxHealth * healthBarWidth), healthBarHeight);
//draw_sprite(sHealthBarBorder, 0, view_w_half - healthBarWidth/2, view_h_half/4);