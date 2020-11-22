if debug_mode {
	draw_text(x,y,mana);
	draw_text(x,y-16,hp);
	draw_text(x,y-32,string(level)+" | "+string(experience)+"/"+string(max_experience));
}

if (alpha < 1) {
	alpha += .01;
}