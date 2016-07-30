/*
QUICK SAVE
this script is calle dfrom the system menue and saves the entire state of the game so it can be paused
*/

quick_save_data = argument0;

//delete exsisting save
if (file_exists(saving_map)) file_delete(saving_map);
//create and open file
ini_open(saving_map);

//write to meta section [ map name and size ]
ini_write_string("Meta","name",obj_map.name); //save name as protoland
ini_write_real( "Meta", "Width", global.mapW);
ini_write_real( "Meta", "Height", global.mapH);

//save game data
ini_write_real( "Game Data", "Day", global.Day);

//players in play
ini_write_real( "Game Data", "P1 in play", global.P1_in_play);
ini_write_real( "Game Data", "P2 in play", global.P2_in_play);
ini_write_real( "Game Data", "P3 in play", global.P3_in_play);
ini_write_real( "Game Data", "P4 in play", global.P4_in_play);
//player turn
ini_write_real( "Game Data", "P_Turn", global.P_Turn.number);

//player data




//start loop to all positions in map
for( i = 0 ; i < global.mapW ; i += 1 )         // i is to X
    {
    for( j = 0 ; j < global.mapH; j += 1 )      // j is to Y
        {
        //save terrain   
        posKey = string(i)+ "X" + string(j) + "Y";       
        ini_write_real("Terrains", posKey, obj_map.terrains[i,j].object_index);
        //save property ownership
        ini_write_real("Terrains", posKey+"owership", obj_map.terrains[i,j].ownership);
        //save visibility
        ini_write_real("Terrains", posKey+"isVisible", obj_map.terrains[i,j].isVisible);
        if ( obj_map.terrains[i,j].isProperty )
            {
            //ownership
            ini_write_real("Terrains", posKey+"ownership", obj_map.terrains[i,j].ownership);
            //standing
            ini_write_real("Terrains", posKey+"isStanding", obj_map.terrains[i,j].isStanding);
            }
        //save units and stats
        if (obj_map.units[i,j] != 0)
            {
            ini_write_real("Units", posKey , obj_map.units[i,j].object_index);
            //save unit ownership
            ini_write_real("Units", posKey+"ownership" , obj_map.units[i,j].ownership);
            //hp
            ini_write_real("Units", posKey+"hp" , obj_map.units[i,j].hp);
            //fuel
            ini_write_real("Units", posKey+"fuel" , obj_map.units[i,j].fuel);
            //ammo
            ini_write_real("Units", posKey+"ammo" , obj_map.units[i,j].ammo);
            //is Disruptes
            ini_write_real("Units", posKey+"isDisrupted" , obj_map.units[i,j].isDisrupted);
            //isVisible
            ini_write_real("Units", posKey+"isVisible" , obj_map.units[i,j].isVisible);
            //isHidden
            ini_write_real("Units", posKey+"isHidden" , obj_map.units[i,j].isHidden);
            //isStanding
            ini_write_real("Units", posKey+"isStanding" , obj_map.units[i,j].isStanding);//used for radio check
            //capturing
             ini_write_real("Units", posKey+"capturing" , obj_map.units[i,j].capturing);
            
            
            }
        }
    }
ini_close();
