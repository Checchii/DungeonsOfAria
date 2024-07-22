/// @description Insert description here
// You can write your code in this editor

if alarm_turnedOn {
instance_create_layer(choose(x, x, x+50, x+30, x-50, x-30), choose(y, y, y+50, y+30, y-50, y-30), "Enemies", oSlimeNormal);
numOfEnemies += 1;
alarm[0] = irandom_range(600 , 1800);
}









