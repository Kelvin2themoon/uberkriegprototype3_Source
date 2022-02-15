//global radio check with off-line targets first
var view_id = 0;

if (global.net_mode = 2 and global.fow[global.Local_Player] = "Standard") view_id = global.Local_Player;
else view_id = global.P_Turn.number;  

if (view_id != 0 ){
    //first pass to turn on blue/inactive tiles
    with (obj_unit) if (!isStanding and team = global.P[view_id].team){
        scr_updateLocalRadio(self);
        }
    with (obj_property) if (team = global.P[view_id].team){
        scr_updateLocalRadio(self);
        }
    //second pass to turn on gold/active tiles and overide blue tiles
    with (obj_unit) if (isStanding and team = global.P[view_id].team){
        scr_updateLocalRadio(self);
        }
    with (obj_property) if (team = global.P[view_id].team){
        scr_updateLocalRadio(self);
        }
    }

/*
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
  
