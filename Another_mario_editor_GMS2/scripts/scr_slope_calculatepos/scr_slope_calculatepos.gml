/// @description scr_slope_calculatepos
function scr_slope_calculatepos() {
	//math by SuperSledgeBro
	var slopepos;
	var spriteh;
	spriteh=other.sprite_height-sprite_get_yoffset(other.sprite_index);
	slopepos=y+
	(  (y2-y1)*
	( (other.x-(x+x1))/(x2-x1) ) 
	);

	//Check if inside the area
	if(other.x>=(x+x1))
	&&(other.x<=(x+x2))
	&&(other.y>=slopepos-16)
	&&(other.y<=slopepos+44){

	   if(object_index==obj_slope_sr)
	   ||(object_index==obj_slope_r)||(object_index==obj_slope_l){
   
	   if(other.hspeed<6)||(other.hspeed>-6){
	   other.y=(slopepos-spriteh+4 -44 +6);
	   }else{
	   other.y=(slopepos-spriteh -44 +6);
	   }
   
	   }
	   else{
	   other.y=slopepos-spriteh+4 +6 ;
	   }
	}





}
