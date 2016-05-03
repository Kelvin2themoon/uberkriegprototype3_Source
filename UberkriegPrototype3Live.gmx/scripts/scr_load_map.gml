/*


loading = argument0;//load file from map



if (file_exists(loading))
    {
    //NUKE
    with (obj_terrain and obj_unit){instance_destroy();} 

    //load file
    ini_open(loading);
     
    //set new map size
    global.mapW = ini_read_real("Meta", "Width", 5);
    global.mapH = ini_read_real("Meta", "Height",5);
 
            
        
    // Re-adjust the boarder to center map if too small

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
    
    
    //fill map with plains & empty unit slots for setter detection conflicts
    for( i = 0 ; i < global.mapW ; i += 1 )         // i is to X
        {
        for( j = 0 ; j < global.mapH; j += 1 )      // j is to Y
            {        
            obj_map.terrains[i,j] = instance_create( i*24 , j*24 , obj_terrain_Plains ) ;
            obj_map.units[i,j] = 0; //fill unit array with 0s
            }
        }

    
    //Build New Map
    //start loop to all positions in map
    for( i = 0 ; i < global.mapW ; i += 1 )         // i is to X
        {
        for( j = 0 ; j < global.mapH; j += 1 )      // j is to Y
            {
            
            //Replace Terrain
            posRead = string(i)+ "X" + string(j) + "Y"; //Key read variable
            setting_owner = ini_read_real("Terrains",posRead +"P",1);
            setting_terrain = ini_read_real("Terrains",posRead,0);
            scr_setTerrain(setting_terrain,i,j);
            
            //set unit
            if (ini_key_exists("Units",posRead+"P"))
                {
                setting_owner = ini_read_real("Units",posRead +"P",1);
                setting_unit = ini_read_real("Units",posRead,1);
                scr_setUnit(setting_unit,i,j,player_set);
                }

            }    
        }
        
    //close file
    ini_close();
        
    }
    
    */
