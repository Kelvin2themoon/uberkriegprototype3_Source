/*
QUICK SAVE
this script is calle dfrom the system menu and saves the entire state of the game
*/

//name and location of the save file (string i think)
var quick_save = argument0; 
 
//delete exsisting save
if (file_exists(quick_save)) file_delete(quick_save);
//create and open file
ini_open(quick_save);

//save global variables

//turning Variables

//save P_turn ( current player turn  via number variable)
ini_write_real("globals","P_turn", global.P_Turn.number);
//save current day
ini_write_real("globals","Day",global.Day);
//save cursor position
ini_write_real("globals","posX",global.posX);
ini_write_real("globals","posY",global.posY);

//players in play( 0 for false, 1 for true)

//PLAYER 1
if (global.P1_in_play)
    {  
    //in play
    ini_write_real("players","P1inPlay",1);
    //this player exsista, save all relative data
    ini_write_real("globals","P1CO",global.P1.CO.index);
    //save team affiliation
    ini_write_real("players","P1Team",global.P1.team);
    //save funds
    ini_write_real("players","P1Funds",global.P1.funds);
    //save player cursor position
    ini_write_real("players","P1CursorX",global.P1.save_cursor_pos_x);
    ini_write_real("players","P1CursorY",global.P1.save_cursor_pos_y);
    //save view position
    ini_write_real("players","P1ViewX",global.P1.save_view_pos_x);
    ini_write_real("players","P1ViewY",global.P1.save_view_pos_y);
    //CO stats
    ini_write_real("players","P1_charge",   global.P1.CO.charge);
    ini_write_real("players","P1_COP",      global.P1.CO.COP_on);
    ini_write_real("players","P1_SCOP_on",  global.P1.CO.SCOP_on);
    }
else 
    {
    ini_write_real("players","P1inPlay",0);
    }                   
    

//PLAYER 2
if (global.P2_in_play)
    {  
    ini_write_real("players","P2inPlay",1);
    //this player exsista, save all relative data
    ini_write_real("globals","P2CO",global.P2.CO.index);
    //save team affiliation
    ini_write_real("players","P2Team",global.P2.team);
    //save funds
    ini_write_real("players","P2Funds",global.P2.funds);
    //save player cursor position
    ini_write_real("players","P2CursorX",global.P2.save_cursor_pos_x);
    ini_write_real("players","P2CursorY",global.P2.save_cursor_pos_y);
    //save view position
    ini_write_real("players","P2ViewX",global.P2.save_view_pos_x);
    ini_write_real("players","P2ViewY",global.P2.save_view_pos_y);
    //CO stats
    ini_write_real("players","P2_charge",    global.P2.CO.charge);
    ini_write_real("players","P2_COP",       global.P2.CO.COP_on);
    ini_write_real("players","P2_SCOP_on",   global.P2.CO.SCOP_on);
    }
else 
    {
    ini_write_real("players","P2inPlay",0);
    }                   
    
//PLAYER 3
if (global.P3_in_play)
    {  
    ini_write_real("players","P3inPlay",1);
    //this player exsista, save all relative data
    ini_write_real("globals","P3CO",global.P3.CO.index);
    //save team affiliation
    ini_write_real("players","P3Team",global.P3.team);
    //save funds
    ini_write_real("players","P3Funds",global.P3.funds);
    //save player cursor position
    ini_write_real("players","P3CursorX",global.P3.save_cursor_pos_x);
    ini_write_real("players","P3CursorY",global.P3.save_cursor_pos_y);
    //save view position
    ini_write_real("players","P3ViewX",global.P3.save_view_pos_x);
    ini_write_real("players","P3ViewY",global.P3.save_view_pos_y);
    //CO stats
    ini_write_real("players","P3_charge",    global.P3.CO.charge);
    ini_write_real("players","P3_COP",       global.P3.CO.COP_on);
    ini_write_real("players","P3_SCOP_on",   global.P3.CO.SCOP_on);
    }
else 
    {
    ini_write_real("players","P3inPlay",0);
    }

//PLAYER 4
if (global.P4_in_play)
    {  
    ini_write_real("players","P4inPlay",1);
    //this player exsista, save all relative data
    ini_write_real("globals","P4CO",global.P4.CO.index);
    //save team affiliation
    ini_write_real("players","P4Team",global.P4.team);
    //save funds
    ini_write_real("players","P4Funds",global.P4.funds);
    //save player cursor position
    ini_write_real("players","P4CursorX",global.P4.save_cursor_pos_x);
    ini_write_real("players","P4CursorY",global.P4.save_cursor_pos_y);
    //save view position
    ini_write_real("players","P4ViewX",global.P4.save_view_pos_x);
    ini_write_real("players","P4ViewY",global.P4.save_view_pos_y);
    //CO stats
    ini_write_real("players","P4_charge",    global.P4.CO.charge);
    ini_write_real("players","P4_COP",       global.P4.CO.COP_on);
    ini_write_real("players","P4_SCOP_on",   global.P4.CO.SCOP_on);
}
else 
    {
    ini_write_real("players","P4inPlay",0);
    }
    
    
/// MAP DATA
    
//write to meta section [ map name and size ]
ini_write_string("Meta","name",obj_map.name); //save name as protoland
ini_write_real( "Meta", "Width", global.mapW);
ini_write_real( "Meta", "Height", global.mapH);


//start loop to all positions in map
for( i = 0 ; i < global.mapW ; i += 1 )         // i is to X
    {
    for( j = 0 ; j < global.mapH; j += 1 )      // j is to Y
        {
        //save terrain   
        posKey = string(i)+ "X" + string(j) + "Y";       
        ini_write_real("Terrains", posKey, obj_map.terrains[i,j].index);
        //save terrain visibility
        if (obj_map.terrains[i,j].isVisible) ini_write_real("Terrains",posKey+"isVisible",1);
        else ini_write_real("Terrains",posKey+"isVisible",0);
        //save terrain smoke
        if (obj_map.terrains[i,j].isSmoke) ini_write_real("Terrains",posKey+"isSmoke",1);
        else ini_write_real("Terrains",posKey+"isSmoke",0);
        //save smoker
        ini_write_real("Terrains", posKey+"smoker", obj_map.terrains[i,j].smoker);
        
        
        //save property ownership
        if ( obj_map.terrains[i,j].isProperty )
            {
            
            ini_write_real("Terrains", posKey+"P", obj_map.terrains[i,j].ownership);
            
            }
        //save units
        if (obj_map.units[i,j] != 0)
            {
            with obj_map.units[i,j]
                {
                ini_write_real("Units", other.posKey , unit_index);
                //save unit ownership
                ini_write_real("Units", other.posKey+"P" , ownership);
                //save commander status (1 = True, 0 = False)
                if (isCommander) ini_write_real("Units", other.posKey+"C" ,1);
                else ini_write_real("Units", other.posKey+"C" ,0);
                
                //Save all other dynamic unit values
                
                //state ( idle or exhause )
                ini_write_string("Units",other.posKey+"state",state);
                //HP
                ini_write_real("Units",other.posKey+"hp",hp);
                //fuel
                ini_write_real("Units",other.posKey+"fuel",fuel);
                //ammo
                ini_write_real("Units",other.posKey+"ammo",ammo);
                //cost
                ini_write_real("Units",other.posKey+"cost",cost);
                //team
                ini_write_real("Units",other.posKey+"team",team);
                //isDisrupted (boolean)
                if (isDisrupted) ini_write_real("Units",other.posKey+"isDisrupted",1);
                else ini_write_real("Units",other.posKey+"isDisrupted",0);
                //isHidden (Boolean)
                if (isHidden) ini_write_real("Units",other.posKey+"isHidden",1);
                else ini_write_real("Units",other.posKey+"isHidden",0);
                //Capturing
                ini_write_real("Units",other.posKey+"capturing",capturing);
                //dummy
                if (dummy) ini_write_real("Units",other.posKey+"dummy",1);
                else ini_write_real("Units",other.posKey+"dummy",0);
                
                
                //Special case: Loaded APC
                
                if name = "A.P.C." 
                    {
                    
                    if (load_A = 0) ini_write_real("Units",other.posKey+"loadA",0)
                    else
                        {
                            instance_activate_object(load_A);
                        
                            ini_write_real("Units",other.posKey+"loadA",load_A.unit_index);
                            
                            loadA_posKey = other.posKey;
                        
                            with (load_A)
                                {
                                
                                ini_write_real("Units",other.loadA_posKey+"loadAownership",ownership);
                                ini_write_real("Units",other.loadA_posKey+"loadAhp",hp);
                                ini_write_real("Units",other.loadA_posKey+"loadAfuel",fuel);
                                ini_write_real("Units",other.loadA_posKey+"loadAammo",ammo);
                          
                                
                                
                                if (isCommander) ini_write_real("Units",other.loadA_posKey+"loadAisCommander",1);
                                else ini_write_real("Units",other.loadA_posKey+"loadAisCommander",0);
                                
                                //no need for disrupted, hiddem, or capturing
                                
                                }
                        }
                    if (load_B = 0) ini_write_real("Units",other.posKey+"loadB",0)
                    else
                        {
                            instance_activate_object(load_B);
                        
                            ini_write_real("Units",other.posKey+"loadB",load_B.unit_index);
                            
                            loadB_posKey = other.posKey;
                        
                            with (load_B)
                                {
                                
                                ini_write_real("Units",other.loadB_posKey+"loadBownership",ownership);
                                ini_write_real("Units",other.loadB_posKey+"loadBhp",hp);
                                ini_write_real("Units",other.loadB_posKey+"loadBfuel",fuel);
                                ini_write_real("Units",other.loadB_posKey+"loadBammo",ammo);
                         
                                
                                
                                if (isCommander) ini_write_real("Units",other.loadB_posKey+"loadBisCommander",1);
                                else ini_write_real("Units",other.loadB_posKey+"loadBisCommander",0);
                                
                                //no need for disrupted, hiddem, or capturing
                                
                                }
                        }  
                    
                    }

                }

            }
        }
    }
ini_close();
                      






