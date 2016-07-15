

// do these things
global.target_unit.isCommander = true ;
global.target_unit.state = "exhaust" ;
with global.acting_unit instance_destroy();
// reactivate main phaze UI
instance_activate_object(obj_miniwin);
instance_activate_object(obj_battleCursor);

//nuke syscom
with par_syscom_menu instance_destroy();
