//global radio check with off-line targets first
with (obj_unit) 
if (!isStanding and global.P_View[global.P_Turn.number,ownership]) 
    scr_updateLocalRadio(self);
with (obj_property) 
    if (!isStanding and global.P_View[global.P_Turn.number,ownership]) 
        scr_updateLocalRadio(self);        
with (obj_unit) 
    if (isStanding and global.P_View[global.P_Turn.number,ownership])  
        scr_updateLocalRadio(self);
with (obj_property) 
    if (isStanding and global.P_View[global.P_Turn.number,ownership]) 
        scr_updateLocalRadio(self);
/*

if (global.net_mode = 2) {
    with (obj_unit) 
    if (!isStanding and global.P_View[global.P_Turn.number,ownership]) 
        scr_updateLocalRadio(self);
    with (obj_property) 
        if (!isStanding and global.P_View[global.P_Turn.number,ownership]) 
            scr_updateLocalRadio(self);        
    with (obj_unit) 
        if (!isStanding and global.P_View[global.P_Turn.number,ownership])  
            scr_updateLocalRadio(self);
    with (obj_property) 
        if (!isStanding and global.P_View[global.P_Turn.number,ownership]) 
            scr_updateLocalRadio(self);
}

else{
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
    }     
  
