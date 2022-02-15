//exe_engage v.2
//this is aa replacement for scr_exe_engage that will accomodate network mode.

//snap camera if out of frame
if (global.target_unit.isObservable) cam_bring_into_frame(global.target_unit,48);

// atttacker cop fx
var can_cleave = false;
var can_push = false;

var def_destroyed = false;
var atk_destroyed = false;


//CO skill was ready sfx tracker
var  cop_was_off = false;
var scop_was_off = false;
// kriegskill ready SFX
if (global.P_Turn.CO.charge < global.P_Turn.CO.COP_Bar*star_value) cop_was_off  = true;
// Uberkrieg ready SFX
if (global.P_Turn.CO.charge < (global.P_Turn.CO.COP_Bar+global.P_Turn.CO.SCOP_Bar)*star_value) scop_was_off  = true;

//reset captue if moved 
if (global.acting_unit_moved) global.acting_unit.capturing  = 0;

//co skill was ready sfx tracker
var cop_was_off  = false;
var scop_was_off = false;
// kriegskill ready SFX
if (global.P_Turn.CO.charge < global.P_Turn.CO.COP_Bar*star_value) 
cop_was_off  = true;
// Uberkrieg ready SFX
if (global.P_Turn.CO.charge < (global.P_Turn.CO.COP_Bar+global.P_Turn.CO.SCOP_Bar)*star_value) 
scop_was_off  = true;  




//CALCULATE DAMAGES ************************************************************************************************ 



//damage inflicted by attacker/defender
var atk_damage      = 0;        // from attacker, applied to defender
var def_damage      = 0;        // from defencer, applied to attacker (counter attack)
var can_counter     = false;    // if defending unit can counter attack
var counter_type    = 1;        // counter attack primary or secondary
var are_adj         = false;    // if unit are adj
//luck/rng range
var atk_luck        = 10;
var def_luck        = 10;



//local damage calulation

//check for fire type excetions and special adj-conditions

//engage type chang for covert op, primary reserved for that disable ability
if (global.acting_unit.name = "Covert Op.") global.engage_type = 2;


    
    //check if units are adjacent
    if (abs( global.acting_unit.x - global.target_unit.x) +abs( global.acting_unit.y - global.target_unit.y) = 24 ) { 
        are_adj = true;
        //land cruiser secondary fire exception
        if (global.acting_unit.name = "Land Cruiser")  global.engage_type = 2;
        //check for push
        if((global.P_Turn.CO.COP_Push and global.P_Turn.CO.COP_on) or (global.P_Turn.CO.SCOP_Push and global.P_Turn.CO.SCOP_on)) push_check = true;
        }
// locla calulation - hot seat or acting client
if ( global.net_mode = 0 or (global.net_mode = 2 and global.P_Turn.number = global.Local_Player)) {
     
    //calulate attacker damage
    atk_damage = (scr_damageCalculator(global.acting_unit, global.target_unit, obj_map.terrains[global.target_unit.x div 24, global.target_unit.y div 24].cover, global.engage_type)+ irandom(atk_luck)) div 10 ;
    
    // apply damage to defending unit
    //attacking unit damage applied to defending unit / check for cofx cleave and push
    if (global.target_unit.hp <= atk_damage) {
        atk_damage = global.target_unit.hp;
        def_destroyed = true;
        }
    //apply damage
    else global.target_unit.hp -= atk_damage;
    //consume ammo
    if (global.engage_type = 1) global.acting_unit.ammo -=1;

        
    //check if defending unit survives
    if (!def_destroyed){
        //check for counter attack
        if (are_adj and (global.target_unit.max_range = 1 or global.target_unit.name = "Land Cruiser")){
            //check if primary weapon is avaliable
            if ( global.target_unit.havePrimaryWeapon and global.target_unit.ammo > 0 and obj_MastertControls.DMG_P[global.acting_unit.unit_index,global.target_unit.unit_index]){
                counter_type = 1;
                can_counter = true;
                }
            //check for secondary weapom
            else if (global.target_unit.haveSecondaryWeapon and obj_MastertControls.DMG_S[global.acting_unit.unit_index,global.target_unit.unit_index] ){
                can_counter = true;
                counter_type = 2;
                 can_counter = true;
                }
            //land cruiser counter attack
            if (global.target_unit.name = "Land Cruiser" or "Covert Op.") {
                counter_type = 2;
                can_counter = true;
                }
            //counter attack damage calc
            if can_counter { 
                def_damage = (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, counter_type) + irandom(def_luck)) div 10;
                //no damage from dummy units
                if global.target_unit.dummy def_damage = 0; 
                // defending unit counter attack damage appied to attaker
                if (global.acting_unit.hp <= def_damage) {
                    def_damage = global.acting_unit.hp;
                    atk_destroyed = true;
                    }
                else global.acting_unit.hp -= def_damage;
                //consume ammo
                if (can_counter and counter_type = 1) global.target_unit.ammo -=1;
                }
            }
        }
    //add relevent data to data map out
    if (global.net_mode = 2 and global.P_Turn.number = global.Local_Player) {
        ds_map_replace(global.net_unit_orders,"atk_dmg",atk_damage);
        ds_map_replace(global.net_unit_orders,"def_dmg",def_damage);
        }    
    }
//recieve damage values from network - server or waiting client
else {
    atk_damage = ds_map_find_value(global.net_data_map,"atk_dmg");
    def_damage = ds_map_find_value(global.net_data_map,"def_dmg");
    
    //adjust unit HPs
    global.target_unit.hp -= atk_damage;
    global.acting_unit.hp -= def_damage;
    
    //check if unit destroyed
    if (global.target_unit.hp <= 0) def_destroyed = true;
    if (global.acting_unit.hp <= 0) atk_destroyed = true;
    //check if units are adjacent
    if (abs( global.acting_unit.x - global.target_unit.x) +abs( global.acting_unit.y - global.target_unit.y) = 24 ) { 
        are_adj = true;
        //land cruiser secondary fire exception
        if (global.acting_unit.name = "Land Cruiser")  global.engage_type = 2;
        //check for push
        if((global.P_Turn.CO.COP_Push and global.P_Turn.CO.COP_on) or (global.P_Turn.CO.SCOP_Push and global.P_Turn.CO.SCOP_on)) push_check = true;
        }
    
    
    }

    
//Charge Co metres
//also check for COFX- push and cleave


//half charge for damage delt 
global.P_Turn.CO.charge += (global.target_unit.charge*atk_damage) div 2 ;
//full charge for damage recieved 
global.P_Turn.CO.charge += global.acting_unit.charge*def_damage;



with(global.P_Turn) {
    //check for Uberkrieg ready
    if ( CO.charge >= (CO.COP_Bar+CO.SCOP_Bar)*star_value ) { 
        //remove escess
        CO.charge = (CO.COP_Bar+CO.SCOP_Bar)*star_value ;

        //Unerkrieg ready!!! 
        if (CO.SCOP_Bar !=0 and scop_was_off and CO.Uberkriegcheck ){
            CO.Uberkriegcheck = false;
            audio_play_sound(sfx_UberkriegCharged,1,0);
            }
        }
    //kriegskill ready!
    else if (CO.charge >= CO.COP_Bar*star_value and CO.COP_Bar !=0 and cop_was_off and CO.Kriegcheck) {
        global.P_Turn.CO.Kriegcheck = false;
        audio_play_sound(sfx_KriegSkillCharged,1,0);
            
        }
    }
    


//defending player   
//half charge for damage delt 
global.P[global.target_unit.ownership].CO.charge += (global.acting_unit.charge*atk_damage) div 2 ;
//full charge for damage recieved 
global.P[global.target_unit.ownership].CO.charge += global.target_unit.charge*def_damage;
with(global.P[global.target_unit.ownership]) {
    //check for overcharge and remove excess
    if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
    }




//COFX - push and cleave
//push
if (are_adj and ((global.P_Turn.CO.COP_Push and global.P_Turn.CO.COP_on)or(global.P_Turn.CO.SCOP_Push and global.P_Turn.CO.SCOP_on))) {
    //check push displacement
    var push_x = global.target_unit.x - global.acting_unit.x;
    var push_y = global.target_unit.y - global.acting_unit.y;
    //check if space is inbound
    if( scr_inBound( (global.target_unit.x + push_x) div 24, (global.target_unit.y + push_y) div 24)) {
        //check push destinatio is clear and occupiable terrain
        if( obj_map.units[ (global.target_unit.x + push_x) div 24 , (global.target_unit.y + push_y) div 24] = 0 and 
        scr_check_move_cost(global.target_unit, obj_map.terrains[ (global.target_unit.x + push_x) div 24 , (global.target_unit.y + push_y) div 24]) !=99) {
            //clear current position
            obj_map.units[ global.target_unit.x div 24 , global.target_unit.y div 24 ] = 0 ;
            //move target unit to new space
            global.target_unit.x = global.target_unit.x + push_x;
            global.target_unit.y = global.target_unit.y + push_y;
            //enter into new position
            obj_map.units[global.target_unit.x div 24,global.target_unit.y div 24] = global.target_unit; 
            //set depth
            scr_setUnitDepth(global.target_unit);
            //camera check
            cam_bring_into_frame(global.target_unit,48);
            }
        }
    }



    

//place ating unit back in grid
if ( !atk_destroyed ) {
    //place back in grid
    obj_map.units[global.acting_unit.x div 24,global.acting_unit.y div 24] = global.acting_unit;
    //graphics depth reset
    scr_setUnitDepth(global.acting_unit);
    //restart idle animation
    global.acting_unit.alarm[0] =  1;
    //set state to exhaust
    global.acting_unit.state = "exhaust";
   
   //cleave
    if ( global.P_Turn.CO.SCOP_on and global.P_Turn.CO.SCOP_Cleave and def_destroyed) { 
        global.acting_unit.state =  "idle";
        global.acting_unit.alarm[0] =  1;
         //reset depth
        scr_setUnitDepth(global.acting_unit); 
        }
    }

//remove destroyed units from play
if atk_destroyed {
    obj_map.units[global.acting_unit.x div 24, global.acting_unit.y div 24] = 0 ; 
    instance_destroy(global.acting_unit);
    }
if def_destroyed {
    obj_map.units[global.target_unit.x div 24, global.target_unit.y div 24] = 0 ; 
    instance_destroy(global.target_unit);
    global.unit_check = 0;
    }
//clear active unit
global.acting_unit = 0;
global.target_unit = 0;
    

//restart controls    
scr_exe_control_restart();
//nuke syscom
with par_syscom_menu instance_destroy();



  



 
