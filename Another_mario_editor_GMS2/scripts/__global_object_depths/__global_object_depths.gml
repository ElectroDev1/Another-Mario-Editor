function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = -200; // obj_controller
	global.__objectDepths[1] = -2; // obj_semisolid
	global.__objectDepths[2] = -5; // obj_slope_l
	global.__objectDepths[3] = -4; // obj_slope_r
	global.__objectDepths[4] = -4; // obj_slope_sl
	global.__objectDepths[5] = 0; // obj_slope_sr
	global.__objectDepths[6] = -2; // obj_solid
	global.__objectDepths[7] = -2; // obj_slopeparent
	global.__objectDepths[8] = 0; // obj_physicsparent
	global.__objectDepths[9] = -2; // obj_playerparent
	global.__objectDepths[10] = 0; // obj_entity_parent
	global.__objectDepths[11] = -6; // obj_camera
	global.__objectDepths[12] = -1; // obj_pinkplatform
	global.__objectDepths[13] = 0; // obj_game_controller
	global.__objectDepths[14] = -2; // obj_mario
	global.__objectDepths[15] = 0; // obj_metal_block
	global.__objectDepths[16] = 0; // obj_flipblock
	global.__objectDepths[17] = 0; // obj_inv_block
	global.__objectDepths[18] = 0; // obj_question_block
	global.__objectDepths[19] = 0; // obj_spiketrap
	global.__objectDepths[20] = 1; // obj_cloud
	global.__objectDepths[21] = 1; // obj_bridge
	global.__objectDepths[22] = 0; // obj_coin
	global.__objectDepths[23] = 0; // obj_onoff_switch
	global.__objectDepths[24] = 0; // obj_onoff_block_red
	global.__objectDepths[25] = 0; // obj_onoff_block_blue
	global.__objectDepths[26] = 3; // obj_arrow
	global.__objectDepths[27] = 0; // obj_firebar
	global.__objectDepths[28] = -1; // obj_spring
	global.__objectDepths[29] = 1; // obj_editor_entity
	global.__objectDepths[30] = -1; // obj_entity_dead
	global.__objectDepths[31] = 0; // obj_editor_controller
	global.__objectDepths[32] = 0; // obj_mario_editor
	global.__objectDepths[33] = 2; // obj_mario_shadow
	global.__objectDepths[34] = -5; // obj_reset_rocket
	global.__objectDepths[35] = -2; // obj_ring_effect
	global.__objectDepths[36] = 0; // obj_mousechek
	global.__objectDepths[37] = 1; // obj_levelselect_controller


	global.__objectNames[0] = "obj_controller";
	global.__objectNames[1] = "obj_semisolid";
	global.__objectNames[2] = "obj_slope_l";
	global.__objectNames[3] = "obj_slope_r";
	global.__objectNames[4] = "obj_slope_sl";
	global.__objectNames[5] = "obj_slope_sr";
	global.__objectNames[6] = "obj_solid";
	global.__objectNames[7] = "obj_slopeparent";
	global.__objectNames[8] = "obj_physicsparent";
	global.__objectNames[9] = "obj_playerparent";
	global.__objectNames[10] = "obj_entity_parent";
	global.__objectNames[11] = "obj_camera";
	global.__objectNames[12] = "obj_pinkplatform";
	global.__objectNames[13] = "obj_game_controller";
	global.__objectNames[14] = "obj_mario";
	global.__objectNames[15] = "obj_metal_block";
	global.__objectNames[16] = "obj_flipblock";
	global.__objectNames[17] = "obj_inv_block";
	global.__objectNames[18] = "obj_question_block";
	global.__objectNames[19] = "obj_spiketrap";
	global.__objectNames[20] = "obj_cloud";
	global.__objectNames[21] = "obj_bridge";
	global.__objectNames[22] = "obj_coin";
	global.__objectNames[23] = "obj_onoff_switch";
	global.__objectNames[24] = "obj_onoff_block_red";
	global.__objectNames[25] = "obj_onoff_block_blue";
	global.__objectNames[26] = "obj_arrow";
	global.__objectNames[27] = "obj_firebar";
	global.__objectNames[28] = "obj_spring";
	global.__objectNames[29] = "obj_editor_entity";
	global.__objectNames[30] = "obj_entity_dead";
	global.__objectNames[31] = "obj_editor_controller";
	global.__objectNames[32] = "obj_mario_editor";
	global.__objectNames[33] = "obj_mario_shadow";
	global.__objectNames[34] = "obj_reset_rocket";
	global.__objectNames[35] = "obj_ring_effect";
	global.__objectNames[36] = "obj_mousechek";
	global.__objectNames[37] = "obj_levelselect_controller";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
