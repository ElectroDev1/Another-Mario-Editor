
w=0; wt=0;

Angle=0;

DrawSprite=1;
UsesSprite=-4;
image_speed=0;

//Id to use as reference in the map
Entity_id="Coin";

//Tile id
tile=-4;

alarm[0]=2;

//Tile width and height
width=16;
height=16;

child=-4;

//Special attributes
item=noone; //Item inside, used for container objects like blocks


Edited=0;

Attribute[Attributes.Mushroom]=false;
Attribute[Attributes.Wings]=false;
Attribute[Attributes.Direction]=0;
Attribute[Attributes.Parachute]=false;
Attribute[Attributes.Width]=1;
Attribute[Attributes.Height]=1;

//This value is used to check if the item was edited, useful to prevent unnecessary temp saves
prev_value=0;

//Delete if the space is occupied
if(collision_rectangle(bbox_left+1,bbox_top+1,bbox_right-1,bbox_bottom-1,obj_editor_entity,0,1)){instance_destroy();}


