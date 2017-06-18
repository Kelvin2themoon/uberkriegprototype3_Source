with global.P_Turn.CO 
    
    {
        //turn COP or "KriegSkill on
        COP_on = true ;
        //reduce power bar
        charge -= COP_Bar*1000
    
    }
    
with (obj_unit) if ownership = global.P_Turn.number COP = true;
    
    
//reactivate UI    
instance_activate_object(obj_battleCursor);
instance_activate_object(obj_miniwin);
instance_destroy();

