/// @description Level up system

if (experience >= max_experience) {
	reget_stat();
	audio_play_sound(snd_levelup,99,false);
	levelup = true;
	level++;
	max_experience = max_experience*2;
	experience= 0;
}
if (levelup) {
		levelup_reload_timer ++;
		
		if (mana <= max_mana) {
		mana	= lerp(mana,max_mana,.05); }
		if (hp <= max_hp) {
		hp		= lerp(hp,max_hp,.05); }
		
		if (levelup_reload_timer >= 120) {
			levelup_reload_timer = 0;
			levelup = false;	
		}
		
}	