

if (lifetime > 0) {
	lifetime -= 0.02;
	draw_set_alpha(lifetime);
} else {
	draw_set_alpha(0);
	instance_destroy();	
}

draw_set_font(fnt_damage);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x,y,"-"+string(dmg_draw));	
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(fnt_normal);
draw_set_alpha(1);