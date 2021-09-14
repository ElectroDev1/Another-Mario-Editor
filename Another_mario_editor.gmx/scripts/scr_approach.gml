///scr_approach(Value,Final Value,Speed);
/*
Use this script to make a value go to another at a given speed
*/
var StartValue=argument0;
var FinalValue=argument1;
var SpeedValue=argument2;
if(StartValue>FinalValue){StartValue-=SpeedValue;}
if(StartValue<FinalValue){StartValue+=SpeedValue;}  

return StartValue;             
