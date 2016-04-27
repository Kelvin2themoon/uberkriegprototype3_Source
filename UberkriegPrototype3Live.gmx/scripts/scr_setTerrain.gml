/*
this codes destroys & sets a new terrain object in the input co-ordinates\
then adjusts andy graphics relevent to the action

*/

set_terrain_type    =  argument0; // new terrain type, no id required


set_terrain_x       =  argument1;
set_terrain_y       =  argument2;

//Highlander code for HQs

if ( set_terrain_type == obj_terrain_HQ   && object_exists(obj_terrain_HQ))
    {
    with (obj_terrain_HQ) 
        {
        if (ownership == obj_mapEditCursor_mouse.player_set) 
            {
            //replace with plains
             obj_map.terrains[x div 24,y div 24] = instance_create(x ,y ,obj_terrain_Plains);
            //destroy HQ
            instance_destroy();
            } 
        }
    }       
else{}
//Set Terrain
if scr_inBound(set_terrain_x,set_terrain_y) 
        {
        // destroy exsisting terrain
        with(obj_map.terrains[set_terrain_x,set_terrain_y])instance_destroy();
       
         //place new terrain
        obj_map.terrains[set_terrain_x,set_terrain_y] = instance_create(set_terrain_x*24 ,set_terrain_y*24 ,set_terrain_type);
     
        //set Depth so graphics cascade ledt to right, top to bottom
        var deepness = ((set_terrain_y*1000) + (set_terrain_x*10))*(-1)
        obj_map.terrains[set_terrain_x,set_terrain_y].depth = deepness;
        
        
        //adjust graphic according to terrain
        scr_switchTerrainGraphics(set_terrain_x,set_terrain_y);
        
        //check adjacent terrain and adjuste their sprites appropriately
        scr_switchTerrainGraphics(set_terrain_x   , set_terrain_y-1 ); //north
        scr_switchTerrainGraphics(set_terrain_x+1 , set_terrain_y   ); //east
        scr_switchTerrainGraphics(set_terrain_x   , set_terrain_y+1 ); //south
        scr_switchTerrainGraphics(set_terrain_x-1 , set_terrain_y   ); //west
        
        scr_switchTerrainGraphics(set_terrain_x-1 , set_terrain_y-1 ); //north-west
        scr_switchTerrainGraphics(set_terrain_x+1 , set_terrain_y-1 ); //north-east
        scr_switchTerrainGraphics(set_terrain_x+1  , set_terrain_y+1 ); //south-east
        scr_switchTerrainGraphics(set_terrain_x-1 , set_terrain_y +1); //south-west
        
        //adjust graphic according to terrain
        scr_switchTerrainGraphics(set_terrain_x,set_terrain_y);
        
        }
        
//set property operations
if object_is_ancestor(obj_map.terrains[set_terrain_x,set_terrain_y].object_index, obj_property)
   {
   obj_map.terrains[set_terrain_x,set_terrain_y].ownership = obj_mapEditCursor_mouse.player_set;
   obj_map.terrains[set_terrain_x,set_terrain_y].image_index = obj_mapEditCursor_mouse.player_set;
   }
   

