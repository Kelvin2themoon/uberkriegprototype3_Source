with global.P_Turn.CO 
    
    {
        //turn COP or "KriegSkill on
        SCOP_on = true ;
        //reduce power bar
        charge -= (SCOP_Bar+COP_Bar)*1000 ;
    
    }
    
with (obj_unit) if ownership = global.P_Turn.number SCOP = true;

scr_updateStanding_global();
scr_updateGlobalVision();
    
    
//reactivate UI    
instance_activate_object(obj_battleCursor);
instance_activate_object(obj_miniwin);
instance_destroy();
