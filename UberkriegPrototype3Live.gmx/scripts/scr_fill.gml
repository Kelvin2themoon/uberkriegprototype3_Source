//fill with terrain type
var filler  = argument0;//terrain object index
var p       = argument1; //player num
var posx    = argument2; //posx
var posy    = argument3; //posy

//temp loop
var i  = 0;
var c  = noone; //checking terrain object
var xx = 0;
var yy = 0;
 

//save terrian index at taret location
fill_target = obj_map.terrains[posx,posy].index;
//list of flooding
var flooding = ds_queue_create();
//add first item into list (as terrain object)
ds_queue_enqueue(flooding,obj_map.terrains[posx,posy]);


while (ds_queue_size(flooding) > 0){
    c = ds_queue_dequeue(flooding);
    c.q = false;
    cx = c.x div 24;
    cy = c.y div 24;
    scr_setTerrain(filler,cx,cy,p);
    //check new locations
    if (scr_inBound(cx+1,cy) and  obj_map.terrains[cx+1,cy].index = fill_target and obj_map.terrains[cx+1,cy].q){
        ds_queue_enqueue(flooding,obj_map.terrains[cx+1,cy]);
        obj_map.terrains[cx+1,cy].q = false;
        }
    if (scr_inBound(cx-1,cy) and  obj_map.terrains[cx-1,cy].index = fill_target and obj_map.terrains[cx-1,cy].q){ 
        ds_queue_enqueue(flooding,obj_map.terrains[cx-1,cy]);
        obj_map.terrains[cx-1,cy].q = false;
        }
    if (scr_inBound(cx,cy+1) and  obj_map.terrains[cx,cy+1].index = fill_target and obj_map.terrains[cx,cy+1].q){
        ds_queue_enqueue(flooding,obj_map.terrains[cx,cy+1]);
        obj_map.terrains[cx,cy+1].q = false;
        }
    if (scr_inBound(cx,cy-1) and  obj_map.terrains[cx,cy-1].index = fill_target and obj_map.terrains[cx,cy-1].q){ 
        ds_queue_enqueue(flooding,obj_map.terrains[cx,cy-1]);
        obj_map.terrains[cx,cy-1].q = false;
        }
    //show_debug_message("list size: "+string(ds_queue_size(flooding)));
    }
ds_queue_destroy(flooding);

with (obj_terrain) q = true;


/*
ds_list_delete(flooding,0);
scr_setTerrain(filler,posx,posy,0);
ds_list_destroy(flooding);


/* 
//make the lppo!!
 while( ds_list_size(flooding) > 0){
    //for each item in list, set to filler, check adjacent and add to list if index are same
    i  = 0;
    for(i=0;i<ds_list_size(flooding);i++){
        //retrieve relevent data
        c = ds_list_find_value(flooding,i);
        xx = c.x div 24;
        yy = c.y div 24;
        //remove from list, replace with new terrain
        ds_list_delete(flooding,i);
        scr_setTerrain(filler,xx,yy,0);
        //check adjacent
        if (obj_map.terrains[xx+1,yy].index = target) ds_list_add(flooding,obj_map.terrains[xx+1,yy]);
        if (obj_map.terrains[xx-1,yy].index = target) ds_list_add(flooding,obj_map.terrains[xx-1,yy]);
        if (obj_map.terrains[xx,yy+1].index = target) ds_list_add(flooding,obj_map.terrains[xx,yy+1]);
        if (obj_map.terrains[xx,yy-1].index = target) ds_list_add(flooding,obj_map.terrains[xx,yy-1]);
        }
    }

