var observer = 0;

if (global.net_mode = 0 or global.net_mode = 1) observer = global.P_Turn.number;
else if global.net_mode = 2 observer = global.Local_Player;

if global.fow[observer] = "Disabled" {

    with (obj_terrain){
        isVisible = true;
        isObservable = true;
            }
    with (obj_unit){
        isVisible = true;
        isObservable = true;
         if (isHidden and global.P_Turn.team != ownership){
            isObservable = false ;
            isObservable = false;
            }
        }
    }
else{
    with obj_property scr_updateLocalVision(self);
    with obj_unit scr_updateLocalVision(self);
    }


/*
if ((global.net_mode = 0 and (global.fow[observer] = "Standard" or global.fow[observer] = "Limited"))
    ) {
    
    
    with obj_property scr_updateLocalVision(self);
    with obj_unit scr_updateLocalVision(self);
    }

else{
    with (obj_terrain){
        isVisible = true;
        isObservable = true;
            }
    with (obj_unit){
        isVisible = true;
        isObservable = true;
         if (isHidden and global.P_Turn.team != ownership){
            isObservable = false ;
            isObservable = false;
            }
        }   
    }
    
    
           
 

