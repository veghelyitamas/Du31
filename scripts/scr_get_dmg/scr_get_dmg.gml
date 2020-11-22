function scr_get_dmg(){
	
	var crit = choose(0,1);	
	var num = irandom_range(10,15);
	
	if (crit == 1) {
		num = num * 2;
	}
	
	return num;
}