
function scr_drawdmg(xx,yy,dmgnumber){
	var dmg_txt = instance_create_layer(xx,yy,"GUI",o_dmg);
	dmg_txt.dmg_draw = dmgnumber;
}