argument0 = unit_destroy_x ;
argument1 = unit_destroy_y ;

if  (   scr_inBound(unit_destroy_x,unit_destroy_y)
    &&  obj_map.units != -1
    )
    {
    with(obj_map.units[unit_destroy_x,unit_destroy_y]) instance_destroy();
    obj_map.units[unit_destroy_x,unit_destroy_y] = -1 ; 
    }
    
else{}//do nothing

