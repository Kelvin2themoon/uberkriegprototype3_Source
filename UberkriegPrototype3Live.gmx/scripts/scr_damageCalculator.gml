dmgCalc_atk    = argument0; //unit obj
dmgCalc_def    = argument1; //unit obj
dmgCalc_cov    = argument2; //int from terrain
dmgCalc_type   = argument3; // int : 1 or 2

// Damage % =  (atk_hp x dam_chart) / (def_hp x cover)

//initiate return variable
chart_val = 0;
damage = 0;

//cat as secondary if unit is covert op
if dmgCalc_atk.name = "Covert Op." dmgCalc_type = 2 ;


// primary weapon
if (dmgCalc_type = 1)
    { 
    chart_val = obj_MastertControls.DMG_P[dmgCalc_def.unit_index,dmgCalc_atk.unit_index];
    }
    
    
// secondary weapon    
else if (dmgCalc_type = 2 ){ 
    chart_val = obj_MastertControls.DMG_S[dmgCalc_def.unit_index,dmgCalc_atk.unit_index];
    }
    
atk_CO_mod = 100;
def_CO_mod = 100;
    
//retrieve CO modifyers
with( obj_CO_0)
    {
    //check attacker
    if( ownership = other.dmgCalc_atk.ownership )
        {
        other.atk_CO_mod = D2D_Atk[other.dmgCalc_atk.unit_index];
        if(  COP_on ) other.atk_CO_mod =  COP_Atk[other.dmgCalc_atk.unit_index];
        if( SCOP_on ) other.atk_CO_mod = SCOP_Atk[other.dmgCalc_atk.unit_index];
        }
    if( ownership = other.dmgCalc_def.ownership )
        {
        other.def_CO_mod = D2D_Def[other.dmgCalc_atk.unit_index];
        if(  COP_on ) other.def_CO_mod =  COP_Def[other.dmgCalc_def.unit_index];
        if( SCOP_on ) other.def_CO_mod = SCOP_Def[other.dmgCalc_def.unit_index];
        }
        
    }    

    
//damage Formula     
damage =    (
            chart_val               // Base damage
            *(atk_CO_mod/100)//atk_CO_mod   // CO modifyer
            *dmgCalc_atk.hp/10      // HP%
            )
            
            / // Divide by***********************************
            
            (
            100                     // Defence Base
            *(def_CO_mod/100)             // CO modifyer
            +  
            (dmgCalc_def.hp)*dmgCalc_cov //Cover modifyer
            ) 
            
            *100;    


return damage //cast to int
