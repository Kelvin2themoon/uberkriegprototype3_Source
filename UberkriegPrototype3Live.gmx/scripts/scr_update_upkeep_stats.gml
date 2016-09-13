//save play data to ini file on upkeep

upkeep_data = argument0     //ini file (string)
player = argument1          //player object


// open or create file
ini_open (upkeep_data +"_P"+ string(player.number)+".ukr");//write from this variable to create file (UberKriegRecords)

ini_write_real(string(global.Day), "Funds", player.funds);
ini_write_real(string(global.Day), "Revenue", player.revenue);
ini_write_real(string(global.Day), "Units", player.unit_count);
ini_write_real(string(global.Day), "Battle Strength", player.battle_strength);

ini_close();

