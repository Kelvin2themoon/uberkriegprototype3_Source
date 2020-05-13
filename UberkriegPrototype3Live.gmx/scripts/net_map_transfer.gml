/*
 this cripts reads the incomming file as a map and copies it as "protoland_c.ubm"
 the starts the game and loads it
*/


//default argument is incomming file name
file_name = argument0;
file_copy(file_name, "protoland_c.ubm") //save as protoland client version

//start the game 
room_goto(rm_game_Basic);
