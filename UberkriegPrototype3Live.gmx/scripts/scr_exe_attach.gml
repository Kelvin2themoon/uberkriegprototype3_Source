

// do these things
global.target_unit.isCommander = true ;
global.target_unit.state = "exhaust" ;
with global.acting_unit instance_destroy();
// reactivate main phaze UI
instance_activate_object(obj_miniwin);
instance_activate_object(obj_battleCursor);

with obj_battleCursor{
    x = global.posX*24;
    y = global.posY*24;
    }

//nuke syscom
with par_syscom_menu instance_destroy();
