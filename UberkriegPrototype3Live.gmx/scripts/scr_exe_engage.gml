//damage to target unit

//set temp variable
var damage = 0 ;
var cleave_check = false;

var atk_luck_rng = 10;
var def_luck_rng = 10;

//co skill was ready sfx tracker
var cop_was_off  = false;
var scop_was_off = false;



// kriegskill ready SFX
if (global.P_Turn.CO.charge < global.P_Turn.CO.COP_Bar*star_value) 
cop_was_off  = true;
// Uberkrieg ready SFX
if (global.P_Turn.CO.charge < (global.P_Turn.CO.COP_Bar+global.P_Turn.CO.SCOP_Bar)*star_value) 
scop_was_off  = true;  



//reset captue
if (global.acting_unit_moved) global.acting_unit.capturing  = 0;
//engage type checng efor covert op
if (global.acting_unit.unit_index = 10) global.engage_type = 2;

//check for land cruiser exception
if (global.acting_unit.name = "Land Cruiser" and global.engage_type = 1 and abs( global.acting_unit.x - global.target_unit.x) +abs( global.acting_unit.y - global.target_unit.y) = 24 )
    {
    // damage using secondary weapon
    damage =
    (scr_damageCalculator(global.acting_unit, global.target_unit, obj_map.terrains[global.target_unit.x div 24, global.target_unit.y div 24].cover, 2)
    + irandom(atk_luck_rng))
    div 10
    //check if damage is over HP
    if ( damage > global.target_unit.hp ) damage = global.target_unit.hp;
   //subtract damage from target HP 
    global.target_unit.hp -= damage ;
    //charge Defender Metre
    with (obj_player)
        {
        //charge if ownership match
        if (number = global.target_unit.ownership)
            {
            CO.charge += global.target_unit.charge*damage;
            //if metre is full, flatten
            if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
            }
        }
        
    //charge 1/2 for attacker
    with(global.P_Turn)
        {    
        //charge
        CO.charge += (global.target_unit.charge*damage) div 2 ;
        // //if metre is full, flatten
        if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
        }  
    }

//regular damage    
else 
    {    
    damage = 
    (scr_damageCalculator(global.acting_unit, global.target_unit, obj_map.terrains[global.target_unit.x div 24, global.target_unit.y div 24].cover, global.engage_type)
    + irandom(atk_luck_rng))
    div 10 ;
    
    //check if damage is over HP
    if ( damage > global.target_unit.hp ) damage = global.target_unit.hp;
    //damage target unit
    global.target_unit.hp -= damage;
    //ammo consume
    if (global.engage_type = 1) global.acting_unit.ammo -=1;
    //charge Defender Metre
    with (obj_player)
        {  
        //charge if ownership match
        if (number = global.target_unit.ownership)
            {
            CO.charge += global.target_unit.charge*damage;
            //if metre is full, flatten
            if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
            }
        }
        
    //charge 1/2 for attacker
    with(global.P_Turn)
        {  
        //charge
        CO.charge += (global.target_unit.charge*damage) div 2 ;
        // //if metre is full, flatten
        if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
        }  
    }
    

//check if target unit survives
if (global.target_unit.hp <= 0)
    {
    //hp is less than zero, destroy and set map's unit array
    obj_map.units[global.target_unit.x div 24, global.target_unit.y div 24] = 0 ; 
    with global.target_unit instance_destroy();
    global.target_unit = 0;
    global.unit_check = 0;
    //set cleave check to true
    cleave_check = true;
    }
    
    
//if unit survives, check for counter attack (dummy units canno counter attack)
else if (global.target_unit.dummy = false )    
    {
    //of unit is land cruiser
    if ((global.target_unit.name = "Land Cruiser" or global.target_unit.name = "Covert Op.")  and abs(global.acting_unit.x - global.target_unit.x) + abs(global.acting_unit.y - global.target_unit.y) = 24)
        {
        //damage using secondary weapon counter attack
        damage =
        (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 2)
        + irandom(def_luck_rng)) div 10;
        //check if damage > hp
        if (damage > global.acting_unit.hp) damage = global.acting_unit.hp ;
        //inflict damage
        global.acting_unit.hp -= damage ;
        //charge Defender Metre
        with (obj_player)
            {
            //charge if ownership match 1/2 counter attacker
            if (number = global.target_unit.ownership)
                {
                 CO.charge += (global.target_unit.charge*damage) div 2;
                //if metre is full, flatten
                if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
                }
            }
            
        //charge defender
        with(global.P_Turn)
            {
            //charge
            CO.charge += (global.target_unit.charge*damage);
            // //if metre is full, flatten
            if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
            }  
        }
    
    // unit is adjacent   (check for regular counter attack
    else if (  abs(global.acting_unit.x - global.target_unit.x) + abs(global.acting_unit.y - global.target_unit.y) = 24)
        {
        show_debug_message("adj check passed");
       //check for Push
        if( (global.P_Turn.CO.COP_Push and global.P_Turn.CO.COP_on) or (global.P_Turn.CO.SCOP_Push and global.P_Turn.CO.SCOP_on))
            {
            show_debug_message("push check passed");
            //move target unit away from acting unit
            push_x = global.target_unit.x - global.acting_unit.x;
            push_y = global.target_unit.y - global.acting_unit.y;
            //check inbound
            if( scr_inBound( (global.target_unit.x + push_x) div 24, (global.target_unit.y + push_y) div 24))
                {
                show_debug_message("boundery check passed");
                //check if new space is clear and terrain is valis
                if( obj_map.units[ (global.target_unit.x + push_x) div 24 , (global.target_unit.y + push_y) div 24] = 0
                //and scr_check_move_cost(global.target_unit, obj_map.terrains[ (global.target_unit.x + push_x) div 24 , (global.target_unit.y + push_y) div 24]) > 99
                )
                    {
                    show_debug_message("new position is clear, push action completed");
                    //clear current position
                    obj_map.units[ global.target_unit.x div 24 , global.target_unit.y div 24 ] = 0 ;
                    //move target unit to new space
                    global.target_unit.x = global.target_unit.x + push_x;
                    global.target_unit.y = global.target_unit.y + push_y;
                    //enter into new position
                    obj_map.units[global.target_unit.x div 24,global.target_unit.y div 24] = global.target_unit; 
                    ///set depth
                    scr_setUnitDepth(global.target_unit);    
                    }
                }
            }
            
        //check if target unit can counter attack
        if ( global.target_unit.max_range = 1)
            {
            //if primary weapon is avaliable
            if(global.target_unit.havePrimaryWeapon and global.target_unit.ammo > 0 and obj_MastertControls.DMG_P[global.acting_unit.unit_index,global.target_unit.unit_index] and global.acting_unit.name != "Covert Op." )
                {
            // damage by primary weapon
            if(global.acting_unit.name = "Land Cruiser")
                {
                // if target unit is adjacent
                if (abs(global.target_unit.x - global.acting_unit.x) +  abs(global.target_unit.y - global.acting_unit.y) = 1)
                    {
                    //damage using secondary weapon (counter attack)
                    damage =
                    (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 2)
                    + irandom(def_luck_rng)) div 10;
                                                
                                                
                    //check if damage > hp
                    if (damage > global.acting_unit.hp) damage = global.acting_unit.hp ;
                                                
                    //inflict damage
                    global.acting_unit.hp -= damage ;
                                                
                    //charge Defender Metre
                    with (obj_player)
                        {
                        //charge if ownership match 1/2 counter attacker
                        if (number = global.target_unit.ownership)
                            {
                            CO.charge += (global.target_unit.charge*damage) div 2;
                            //if metre is full, flatten
                            if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
                            }
                                                        
                        }
                    //charge defender
                    with(global.P_Turn)
                        {
                        //charge
                        CO.charge += (global.target_unit.charge*damage);
                        // //if metre is full, flatten
                        if ( CO.charge > (CO.COP_Bar+CO.COP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
                        }  
                    }
                else
                    {
                    //damage unsing primary weapon (counter attack)
                    damage = 
                    (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 1)
                    + irandom(def_luck_rng)) div 10;
                    
                    //ammo consume
                    global.target_unit.ammo -=1;                
                    //check if damage > hp
                    if (damage > global.acting_unit.hp) damage = global.acting_unit.hp ;        
                    //inflict damage
                    global.acting_unit.hp -= damage ;
                    //charge Defender Metre
                    with (obj_player)
                        {
                        //charge if ownership match 1/2 counter attacker
                            if (number = global.target_unit.ownership)
                                {
                                CO.charge += (global.target_unit.charge*damage) div 2;
                                //if metre is full, flatten
                                if ( CO.charge > (CO.COP_Bar+CO.COP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
                                }
                            }
                        //charge defender
                        with(global.P_Turn)
                            {
                            //charge
                            CO.charge += (global.target_unit.charge*damage);
                            // //if metre is full, flatten
                            if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
                            }  
                        }
                    }
                //regular unit
                else
                    {
                    //damage unitg primary weapon
                     damage = 
                     (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 1)
                     + irandom(def_luck_rng)) div 10;
                      global.target_unit.ammo -=1;
                      
                      //check if damage > hp
                     if (damage > global.acting_unit.hp) damage = global.acting_unit.hp ;       
                     //inflict damage
                     global.acting_unit.hp -= damage ;      
                     //charge Defender Metre
                     with (obj_player)
                         {           
                         //charge if ownership match 1/2 counter attacker
                         if (number = global.target_unit.ownership)                
                            {
                            CO.charge += (global.target_unit.charge*damage) div 2;
                            //if metre is full, flatten
                            if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
                            }               
                         }
                     //charge defender
                     with(global.P_Turn)      
                        {
                        //charge
                        CO.charge += (global.target_unit.charge*damage);
                        // //if metre is full, flatten
                        if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
                        }                 
                     }
                } 
            // secondary weapon is avaliable
            else if (global.target_unit.haveSecondaryWeapon)
                {     
                // damage by secondary weapon
                damage = 
                (scr_damageCalculator(global.target_unit, global.acting_unit,obj_map.terrains[global.acting_unit.x div 24, global.acting_unit.y div 24].cover, 2)
                + irandom(def_luck_rng)) div 10;
                
                //check if damage > hp
                if (damage > global.acting_unit.hp) damage = global.acting_unit.hp ;              
                //inflict damage
                global.acting_unit.hp -= damage ;               
                //charge Defender Metre
                with (obj_player)
                    {
                    //charge if ownership match 1/2 counter attacker
                    if (number = global.target_unit.ownership)
                        {
                        CO.charge += (global.target_unit.charge*damage) div 2;
                        //if metre is full, flatten
                        if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;            
                        }               
                    }
                //charge defender
                with(global.P_Turn)      
                    {
                    //charge
                    CO.charge += (global.target_unit.charge*damage);
                    // //if metre is full, flatten
                    if ( CO.charge > (CO.COP_Bar+CO.SCOP_Bar)*star_value ) CO.charge =  (CO.COP_Bar+CO.SCOP_Bar)*star_value ;
                    } 
                }
            }
        }
    
    }
            
        
//check if acting unit survivesdestroy and set map's unit array
if (global.acting_unit.hp <= 0) 
    {
    //if hp less than 0, 
    obj_map.units[global.acting_unit.x div 24, global.acting_unit.y div 24] = 0 ; 
    with global.acting_unit instance_destroy();
    }
else
    {
    obj_map.units[global.acting_unit.x div 24,global.acting_unit.y div 24] = global.acting_unit;
    //check for cleave
    if( global.P_Turn.CO.SCOP_on and global.P_Turn.CO.SCOP_Cleave and cleave_check) global.acting_unit.state =  "idle";
    else global.acting_unit.state =  "exhaust";
    //set alarm for animation
    global.acting_unit.alarm[0] =  1;
    //reset depth
    scr_setUnitDepth(global.acting_unit); 
    }
    
instance_activate_object(obj_miniwin);
instance_activate_object(obj_battleCursor);

with obj_battleCursor
    {
    x = global.posX*24;
    y = global.posY*24;
    }
    
// Uberkrieg ready SFX
if (global.P_Turn.CO.charge >= (global.P_Turn.CO.COP_Bar*star_value + global.P_Turn.CO.SCOP_Bar*star_value )and global.P_Turn.CO.SCOP_Bar !=0 and scop_was_off) 
audio_play_sound(sfx_UberkriegCharged,1,0);
//kriegskill ready sfx
else if (global.P_Turn.CO.charge >= global.P_Turn.CO.SCOP_Bar*star_value and global.P_Turn.CO.COP_Bar !=0 and cop_was_off) 
audio_play_sound(sfx_KriegSkillCharged,1,0);
    
        
//nuke syscom
with par_syscom_menu instance_destroy();

//clear active unit
global.acting_unit = 0;
    
        
        
        
        
        
