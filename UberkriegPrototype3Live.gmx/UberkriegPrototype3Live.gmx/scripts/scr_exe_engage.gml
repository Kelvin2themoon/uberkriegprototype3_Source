//damage to target unit


//check for land cruiser exception
if (global.acting_unit.name = "Land Cruiser" and global.engage_type = 1 and abs( global.acting_unit.x - global.target_unit.x) +abs( global.acting_unit.y - global.target_unit.y) = 24 ){
    // damage using secondary weapon
    global.target_unit.hp -=
    (scr_damageCalculator(global.acting_unit, global.target_unit, obj_map.terrains[global.target_unit.x div 24, global.target_unit.y div 24].cover, 2)
    + random(global.acting_unit.hp))
    div 10
    }
    
else{    

    global.target_unit.hp -=
        (scr_damageCalculator(global.acting_unit, global.target_unit, obj_map.terrains[global.target_unit.x div 24, global.target_unit.y div 24].cover, global.engage_type)
        + random(global.acting_unit.hp))
        div 10 ;
        //ammo consume
        if (global.engage_type = 1) global.acting_unit.ammo -=1;
    }

//check if target unit survives
if (global.target_unit.hp <= 0){
    //hp is less than zero, destroy and set map's unit array
    obj_map.units[global.target_unit.x div 24, global.target_unit.y div 24] = 0 ; 
    with global.target_unit instance_destroy();
    global.target_unit = 0;
    }
//if unit survives, check for counter attack
else{ 
    if (  abs(global.acting_unit.x - global.target_unit.x) + abs(global.acting_unit.y - global.target_unit.y) = 24){ // unit is adjacent
        //check if target unit can counter attack
        if ( global.target_unit.max_range = 1){
            //if primary weapon is avaliable
            if(global.target_unit.havePrimaryWeapon and global.target_unit.ammo > 0){
                // damage by primary weapon
                if(global.acting_unit.name = "Land Cruiser"){
                    // if target unit is adjacent
                    if (abs(global.target_unit.x - global.acting_unit.x) +  abs(global.target_unit.y - global.acting_unit.y) = 1){
                        //damage using secondary weapon
                        global.acting_unit.hp -= 
                        (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 2)
                        + random(global.acting_unit.hp)) div 10;
                        }
                    else{
                    //damage unsing primary weapon
                        global.acting_unit.hp -= 
                        (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 1)
                        + random(global.target_unit.hp)) div 10;
                        //ammo consume
                        global.target_unit.ammo -=1;
                        }
                    }  
                //regular unit
                else{
                //damage unitg primary weapon
                global.acting_unit.hp -= 
                (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 1)
                + random(global.target_unit.hp)) div 10;
                //ammo consume
                global.target_unit.ammo -=1;
                    }
                }
            // secondary weapon is avaliable
            else if (global.target_unit.haveSecondaryWeapon){
                // damage by secondary weapon
                global.acting_unit.hp -= 
                (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 2)
                + random(global.acting_unit.hp)) div 10;
                }
            
            }
            //if  target unit is land cruiser, counter attack with 
            if (global.target_unit.name = "Land Cruiser"){
                //damage using secondary weapon
                global.acting_unit.hp -= 
                (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 2)
                + random(global.acting_unit.hp)) div 10;
                }
        }
    }

//check if acting unit survivesdestroy and set map's unit array
if (global.acting_unit.hp <= 0){
    //if hp less than 0, 
    obj_map.units[global.acting_unit.x div 24, global.acting_unit.y div 24] = 0 ; 
    with global.acting_unit instance_destroy();
    }
else{
    //adjust acting unit and place back into map's units array
    //obj_map.units[destination.x div 24,destination.y div 24] = global.acting_unit;
    obj_map.units[global.acting_unit.x div 24,global.acting_unit.y div 24] = global.acting_unit;
    global.acting_unit.state =  "exhaust";
    global.acting_unit.alarm[0] =  1;
    //reset depth
    scr_setUnitDepth(global.acting_unit); 
    }
    
    instance_activate_object(obj_miniwin);
    instance_activate_object(obj_battleCursor);
    with obj_battleCursor{
        x = global.posX*24;
        y = global.posY*24;
        }
        
//nuke syscom
with par_syscom_menu instance_destroy();
    





