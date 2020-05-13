//ini file name
/*

This script assigns a number to global.Local_Player from data sent from a host server game
infomation is extracted from a ini file that has already been saved to appData folder
(master controls async event)

*/
file_name = argument0;

//chech if script is active
global.last_network_event = "Ran script: net_playerNumAssign"

//open file and read data
ini_open(file_name);
var new_num = ini_read_real("num" , "num", 0)

//change number
global.Local_Player = new_num;

//read out
global.last_network_event = "assigned to slot " + string(global.Local_Player) ;



 
