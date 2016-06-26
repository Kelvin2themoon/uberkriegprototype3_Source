//global radio check with off-line targets first

with (obj_unit) 
    if (!isStanding and ownership = global.P_Turn.number) 
        scr_updateLocalRadio(self);
        
with (obj_property) 
    if (!isStanding and ownership = global.P_Turn.number) 
        scr_updateLocalRadio(self);
        
with (obj_unit) 
    if (isStanding and ownership = global.P_Turn.number) 
        scr_updateLocalRadio(self);
        
with (obj_property) 
    if (isStanding and ownership = global.P_Turn.number) 
        scr_updateLocalRadio(self);
       
  
