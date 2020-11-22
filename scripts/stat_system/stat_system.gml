
function init_stat(){
	hp		= 750;
	max_hp	= hp;
	mana	= 100;
	max_mana= mana;

	dmg = scr_get_dmg()*irandom(2);
	
}
function reget_stat() {
		
		hp		+= hp + irandom_range(100,250);
		max_hp	= hp;
		mana	= 100 + irandom(100);
		max_mana= mana;

		dmg += dmg + scr_get_dmg() + irandom_range(1,5);
}