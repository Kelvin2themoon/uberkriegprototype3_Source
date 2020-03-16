///Temp Load
loading_map = argument0;

if (file_exists(loading_map))
    {
    //nuke
    with (obj_terrain){instance_destroy();}
    with (obj_unit){instance_destroy();}
    
    //rebuild
    ini_open(loading_map); //load protoland
    
    global.mapW = ini_read_real("Meta", "Width", 5);
    global.mapH = ini_read_real("Meta", "Height",5);
    
    //global variables for allowing scrolling for both map editor and in-game, false if the map is too small
    global.canScroll_x = true;
    global.canScroll_y = true;
    
    //adjust the boarder to center map if too small
    
     if (global.mapH <18 )
        {
        view_yview[0] = (-1)*12*(18-global.mapH);
        global.canScroll_y = false;
        
        }
        
     if (global.mapW < 32)
        {
        view_xview[0] = (-1)*12*(32-global.mapW);
        global.canScroll_x = false;
        }
    
    //fill map with plains for setter detection conflicts
    for( i = 0 ; i < global.mapW ; i += 1 )         // i is to X
        {
        for( j = 0 ; j < global.mapH; j += 1 )      // j is to Y
            {        
            obj_map.terrains[i,j] = instance_create( i*24 , j*24 , obj_terrain_Plains ) ;
            obj_map.units[i,j] = 0; //fill unit array with 0s
            }
        }
    
    //start loop
    //start loop to all positions in map
    for( i = 0 ; i < global.mapW ; i += 1 )         // i is to X
        {
        for( j = 0 ; j < global.mapH; j += 1 )      // j is to Y
            {
            
            //Read and adjust at each position
            posRead = string(i)+ "X" + string(j) + "Y"; //Key read variable
            player_set = ini_read_real("Terrains",posRead +"P",1);
            setting_terrain = global.terrain_type[ini_read_real("Terrains",posRead,0)];
            scr_setTerrain(setting_terrain,i,j,player_set);
            //set terrain attributes
            if (ini_read_real("Terrains",posRead+"isSmoke",0)=1) 
                {
                obj_map.terrains[i,j].isSmoke = true;
                obj_map.terrains[i,j].canHide = true;
                obj_map.terrains[i,j].smoker = ini_read_real("Terrains",posRead+"smoker",0);
                }
            

            //set unit
            if (ini_key_exists("Units",posRead+"P"))
                {
                player_set = ini_read_real("Units",posRead +"P",1);
                setting_unit = global.unit_type[ini_read_real("Units",posRead,1)];
                scr_setUnit(setting_unit,i,j,player_set);
                
                //specia case, isCommander
                if (ini_read_real("Units",posRead+"C",0)=1) obj_map.units[i,j].isCommander = true;
                
                //specia case, isDisrupted
                 if (ini_read_real("Units",posRead+"isDisrupted",0)=1) obj_map.units[i,j].isDisrupted = true;
                 
                //specia case, isHidden
                 if (ini_read_real("Units",posRead+"isHidden",0)=1) obj_map.units[i,j].isHidden = true;
                 
                 //specia case, dummy
                 if (ini_read_real("Units",posRead+"dummy",0)=1) obj_map.units[i,j].dummy = true;
                    
                    //read variables from ini_file and prep "new" variables
                    new_hp = ini_read_real("Units",posRead+"hp",10);
                    new_fuel = ini_read_real("Units",posRead+"fuel",0);
                    new_ammo = ini_read_real("Units",posRead+"ammo",-1);
                    new_capturing = ini_read_real("Units",posRead+"capturing",0);
                    new_team = ini_read_real("Units",posRead+"team",1);
                    new_cost = ini_read_real("Units",posRead+"cost",1000);
                    
                with(obj_map.units[i,j])
                    {
                    //apply "new" variables
                    hp = other.new_hp;
                    fuel = other.new_fuel;
                    ammo = other.new_ammo;
                    capturing = other.new_capturing;
                    team = other.new_team;
                    cost = other.new_cost;
                    
                    //special case: loaded APC
                    
                    if (name = "A.P.C.")
                        {
                        
                            if (ini_read_real("Units",other.posRead+"loadA",0) !=0)
                                { 
                            
                                    load_A = instance_create(15,15,global.unit_type[ini_read_real("Units",other.posRead+"loadA",0)]);
                                    load_A.depth = 0;
                                    load_A.ownership = ownership;
                                    load_A.team = team;
                                    
                                    load_A.hp = ini_read_real("Units",other.posRead+"loadAhp",10);
                                    load_A.fuel = ini_read_real("Units",other.posRead+"loadAfuel",0);
                                    load_A.ammo = ini_read_real("Units",other.posRead+"loadAammo",0);
                                    
                                    if(ini_read_real("Units",other.posRead+"loadAisCommander",0) = 1) load_A.isCommander = true;
                                    
                                    scr_unit_change_sprite(load_A,ownership);
                                    instance_deactivate_object(load_A);
                                }

                        
                    
                        
                            if (ini_read_real("Units",other.posRead+"loadB",0) !=0)
                                { 
                            
                                    load_B = instance_create(15,15,global.unit_type[ini_read_real("Units",other.posRead+"loadB",0)]);
                                    load_B.depth = 0;
                                    load_B.ownership = ownership;
                                    load_B.team = team;
                                    
                                    load_B.hp = ini_read_real("Units",other.posRead+"loadBhp",10);
                                    load_B.fuel = ini_read_real("Units",other.posRead+"loadBfuel",0);
                                    load_B.ammo = ini_read_real("Units",other.posRead+"loadBammo",0);
                                    
                                    if(ini_read_real("Units",other.posRead+"loadBisCommander",0) = 1) load_B.isCommander = true;
                                    
                                    scr_unit_change_sprite(load_B,ownership);
                                    instance_deactivate_object(load_B);
                                }
                        }

                    } 
 
                }

            }    
        }
    }
