if global.FoW_on 
    {

        with    obj_property    scr_updateLocalVision(self);
        with    obj_unit        scr_updateLocalVision(self);
        
    }
else
    {
        with obj_terrain    isVisible = true ;
        with obj_unit       isVisible = true ;
        with obj_unit_CovertOp if (isHidden and ownership !=global.P_Turn.number) isVisible = false ;
    
    }
 

