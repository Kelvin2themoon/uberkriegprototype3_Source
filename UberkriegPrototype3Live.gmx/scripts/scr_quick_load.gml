///Temp Load
loading_map = argument0;

if (file_exists(loading_map))
    {
    //open ini file
    ini_open("QUICK_SAVE.sav");
    
    //nuke
    with (obj_terrain){instance_destroy();}
    with (obj_unit){instance_destroy();}
    with (obj_player){instance_destroy();}
    show_debug_message("map loading");
    
    
    
    //LOAD PLAYER DATA
    
    
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
            player_set = ini_read_real("Terrains",posRead +"ownership",1);
            setting_terrain = ini_read_real("Terrains",posRead,0);
            scr_setTerrain(setting_terrain,i,j,player_set);
            //set visibility and standing

            //visibility
            if (ini_read_real("Terrains",posRead + "isVisible",0) = 1) obj_map.terrains[i,j].isVisible = true;
            else obj_map.terrains[i,j].isVisible = false;
                //standing
            if (obj_map.terrains[i,j].isProperty){ 
                if (ini_read_real("Terrains",posRead + "isStanding",0) = 1) obj_map.terrains[i,j].isStanding = true;
                else obj_map.terrains[i,j].isStanding = false;
                    }
                }
            
            //set unit
            if (ini_key_exists("Units",posRead+"P"))
                {
                player_set = ini_read_real("Units",posRead +"ownership",1);
                setting_unit = ini_read_real("Units",posRead,1);
                scr_setUnit(setting_unit,i,j,player_set);
                //check for command rank
                if (ini_read_real("Units",posRead +"isCommander",0) = 1)  obj_map.units[i,j].isCommander = true;
            //ADDITIONAL ATTRIBUTES
                with (obj_map.units[i,j]){
                    hp = ini_read_real("Units",other.posRead+"hp",10);
                    fuel = ini_read_real("Units",other.posRead+"fuel",max_fuel);
                    ammo = ini_read_real("Units",other.posRead+"ammo",max_ammo);
                    capturing =  ini_read_real("Units",other.posRead+"capturing",0);
                    state = ini_read_string("Units",other.posRead+"state","idle");
                //booleans
                    //command
                    if (ini_read_real("Units",other.posRead +"isCommander",0) = 1) is_commander = true;
                    else isCommander = false;
                    //Disrupted
                    if (ini_read_real("Units",other.posRead+"isDisrupted",0) = 1) isDisrupted = true;
                    else isDisrupted = false;
                    //Visible
                    if (ini_read_real("Units",other.posRead+"isVisible",0) = 1) isVisible = true;
                    else isVisible = false;
                    //hidden
                    if (ini_read_real("Units",other.posRead+"isHidden",0) = 1) isHidden = true;
                    else isHidden = false;
                    //standing
                    if (ini_read_real("Units",other.posRead+"isStanding",0) = 1) isStanding = true;
                    else isStanding = false;
                    }
                }

            }    
        
        
        // LOAD PLAYER DATA
        //P1
     if (ini_read_real("Game Data","P1 in play",0) =1){
        show_debug_message("P1 created");
        global.P1_in_play = true;
        global.P1 = instance_create(0,0,obj_player);
        global.P1.number = 1;
        //assign team
        global.P1.team = ini_read_real("Game Data","P1 Team", 1);
        //funds
        global.P1.funds =  ini_read_real("Game Data","P1 funds", 0);
        //view and cursor
        global.P1.save_cursor_pos_x = ini_read_real("Game Data", "P2 posX", 0);
        global.P1.save_cursor_pos_y = ini_read_real("Game Data", "P2 posY", 0);
        global.P1.save_view_pos_x   = ini_read_real("Game Data", "P2 viewX",0);
        global.P1.save_view_pos_y   = ini_read_real("Game Data", "P2 viewY",0);
        }
     //P2
     if (ini_read_real("Game Data","P2 in play",0) =1){
        show_debug_message("P2 created");
        global.P2_in_play = true;
        global.P2 = instance_create(0,0,obj_player);
        global.P2.number = 2;
        //assign team
        global.P2.team = ini_read_real("Game Data","P2 Team", 2);
        //funds
        global.P2.funds =  ini_read_real("Game Data","P2 funds", 0);
        //view and cursor
        global.P2.save_cursor_pos_x = ini_read_real("Game Data", "P2 posX", 0);
        global.P2.save_cursor_pos_y = ini_read_real("Game Data", "P2 posY", 0);
        global.P2.save_view_pos_x   = ini_read_real("Game Data", "P2 viewX",0);
        global.P2.save_view_pos_y   = ini_read_real("Game Data", "P2 viewY",0);
        }
       //P3
     if (ini_read_real("Game Data","P3 in play",0) =1){
        show_debug_message("P3 created");
        global.P3_in_play = true;
        global.P3 = instance_create(0,0,obj_player);
        global.P3.number = 3;
        //assign team
        global.P3.team = ini_read_real("Game Data","P3 Team", 3);
        //funds
        global.P3.funds =  ini_read_real("Game Data","P3 funds", 0);
        //view and cursor
        global.P3.save_cursor_pos_x = ini_read_real("Game Data", "P3 posX", 0);
        global.P3.save_cursor_pos_y = ini_read_real("Game Data", "P3 posY", 0);
        global.P3.save_view_pos_x   = ini_read_real("Game Data", "P3 viewX",0);
        global.P3.save_view_pos_y   = ini_read_real("Game Data", "P3 viewY",0);
        }
     //P4
     if (ini_read_real("Game Data","P4 in play",0) =1){
        show_debug_message("P4 created");
        global.P4_in_play = true;
        global.P4 = instance_create(0,0,obj_player);
        global.P4.number = 4;
        //assign team
        global.P4.team = ini_read_real("Game Data","P4 Team", 4);
        //funds
        global.P4.funds =  ini_read_real("Game Data","P4 funds", 0);
        //view and cursor
        global.P4.save_cursor_pos_x = ini_read_real("Game Data", "P4 posX", 0);
        global.P4.save_cursor_pos_y = ini_read_real("Game Data", "P4 posY", 0);
        global.P4.save_view_pos_x   = ini_read_real("Game Data", "P4 viewX",0);
        global.P4.save_view_pos_y   = ini_read_real("Game Data", "P4 viewY",0);
        }    
        ini_close();
    }
