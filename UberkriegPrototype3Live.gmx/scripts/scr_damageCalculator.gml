dmgCalc_atk    = argument0; //unit obj
dmgCalc_def    = argument1; //unit obj
dmgCalc_cov    = argument2; //int from terrain
dmgCalc_type   = argument3; // int : 1 or 2

// Damage % =  (atk_hp x dam_chart) / (def_hp x cover)

//initiate return variable
chart_val = 0;
damage = 0;

if (dmgCalc_type = 1){ // primary weapon
    chart_val = obj_battleController_basic.DMG_P[dmgCalc_def.unit_index,dmgCalc_atk.unit_index];
    }
else if (dmgCalc_type = 2 ){ // secondary weapon
    chart_val = obj_battleController_basic.DMG_S[dmgCalc_def.unit_index,dmgCalc_atk.unit_index];
    }  
    damage =  (chart_val*dmgCalc_atk.hp/10)/(100+(10-dmgCalc_def.hp)+(dmgCalc_cov*10)+((10-dmgCalc_def.hp)*dmgCalc_cov))*100;    
return damage
