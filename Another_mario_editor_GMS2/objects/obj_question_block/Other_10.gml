state=1;

var coin = collision_rectangle(bbox_left+1,bbox_top-2,bbox_right-1,bbox_top+2,obj_coin,0,0);

if(coin){

   with(coin){
        instance_destroy();
   }

}

switch(item){
       
       default:
          obj_game_controller.Coins++;
       break;

}

offsetT=-8;
alarm[0]=10;

