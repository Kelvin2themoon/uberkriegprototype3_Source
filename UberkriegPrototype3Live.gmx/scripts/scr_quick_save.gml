/*
QUICK SAVE
this script is calle dfrom the system menue and saves the entire state of the game so it can be paused
*/

quick_save= argument0;

//delete exsisting save
if (file_exists(quick_save)) file_delete(quick_save);
//create and open file
ini_open(quick_save);

//write to meta section [ map name and size ]
ini_write_string("Meta","name",obj_map.name); //save name as protoland
ini_write_real( "Meta", "Width", global.mapW);
ini_write_real( "Meta", "Height", global.mapH);

//save game data
ini_write_real( "Game Data", "Day", global.Day);

//players in play
//player1
if (global.P1_in_play){
    ini_write_real("Game Data", "P1 in play",1);
    ini_write_real("Game Data", "P1 funds",global.P1.funds);
    }
else ini_write_real("Game Data", "P1 in play",0);

if (global.P2_in_play){
    ini_write_real("Game Data", "P2 in play",1);
    ini_write_real("Game Data", "P2 funds",global.P2.funds);
    }
else ini_write_real("Game Data", "P2 in play",0);

if (global.P3_in_play){
    ini_write_real("Game Data", "P3 in play",1);
    ini_write_real("Game Data", "P3 funds",global.P3.funds);
    }
else ini_write_real("Game Data", "P3 in play",0);

if (global.P4_in_play){
    ini_write_real("Game Data", "P4 in play",4);
    ini_write_real("Game Data", "P4 funds",global.P4.funds);
    }
else ini_write_real("Game Data", "P4 in play",0);

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
        //save visibility
        ini_write_real("Terrains", posKey+"isVisible", obj_map.terrains[i,j].isVisible);
        if ( obj_map.terrains[i,j].isProperty = true )
            {
            //ownership
            ini_write_real("Terrains", posKey+"ownership", obj_map.terrains[i,j].ownership);
            //standing
            if (obj_map.terrains[i,j].isStanding) ini_write_real("Terrains", posKey+"isStanding" , 1 ); 
            else ini_write_real("Terrains", posKey+"isStanding" , 0 );  
            }
        //save units and stats
        if (obj_map.units[i,j] != 0)
            {
            with (obj_map.units[i,j]){
                //save all dynamic unit stat starting with object index
                ini_write_real("Units", other.posKey, object_index);
                //ownership
                ini_write_real("Units", other.posKey+"ownership" , ownership);
                //hp
                ini_write_real("Units", other.posKey+"hp" , hp);
                //fuel
                ini_write_real("Units", other.posKey+"fuel" , fuel);
                //ammo
                ini_write_real("Units", other.posKey+"ammo" , ammo);    
                //capturing
                ini_write_real("Units", other.posKey+"capturing" , capturing);
                //unit state (String)
                ini_write_string("Units", other.posKey+"state" , state);
                
                /// BOOLEANS
                
                //isCommander
                if (isCommander) ini_write_real("Units", other.posKey+"isCommander" , 1 ); 
                else ini_write_real("Units", other.posKey+"isCommander" , 0 );
                //isDisrupted
                if (isDisrupted) ini_write_real("Units", other.posKey+"isDisrupted" , 1 ); 
                else ini_write_real("Units", other.posKey+"isDisrupted" , 0 );
                //isVisible
                if (isVisible) ini_write_real("Units", other.posKey+"isVisible" , 1 ); 
                else ini_write_real("Units", other.posKey+"isVisible" , 0 );
                //isHidden
                if (isHidden) ini_write_real("Units", other.posKey+"isHidden" , 1 ); 
                else ini_write_real("Units", other.posKey+"isHidden" , 0 );
                //isStanding
                if (isStanding) ini_write_real("Units", other.posKey+"isStanding" , 1 ); 
                else ini_write_real("Units", other.posKey+"isStanding" , 0 );  
                
                }
            }
        }
    }
ini_close();
