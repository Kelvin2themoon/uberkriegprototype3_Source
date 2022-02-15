
    with (obj_unit) 
        if (!isStanding and team = global.P_Turn.team) 
            scr_updateLocalRadio(self);
    with (obj_property) 
        if (!isStanding and team = global.P_Turn.team) 
            scr_updateLocalRadio(self);        
    with (obj_unit) 
        if (isStanding and team = global.P_Turn.team) 
            scr_updateLocalRadio(self);
    with (obj_property) 
        if (isStanding and team = global.P_Turn.team) 
            scr_updateLocalRadio(self);

  
