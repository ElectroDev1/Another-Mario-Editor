/// @description scr_approach(Value,Final Value,Speed);
/// @param Value
/// @param Final Value
/// @param Speed
function scr_approach(argument0, argument1, argument2) {
	/*
	Use this script to make a value go to another at a given speed
	*/
	var StartValue=argument0;
	var FinalValue=argument1;
	var SpeedValue=argument2;
	if(StartValue>FinalValue){StartValue-=SpeedValue;}
	if(StartValue<FinalValue){StartValue+=SpeedValue;}  

	return StartValue;             



}
