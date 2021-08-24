///scr_approach(Value,Final Value,Speed);
/*
**    Useage:
**         a = scr_approach(Value,Final Value,Speed)
**
**    Purpose:
**         Changes a value to a new one by a set amount
**
*/
var StartValue=argument0;
var FinalValue=argument1;
var SpeedValue=argument2;
if(StartValue>FinalValue){StartValue-=SpeedValue;}
if(StartValue<FinalValue){StartValue+=SpeedValue;}  

return StartValue;              

