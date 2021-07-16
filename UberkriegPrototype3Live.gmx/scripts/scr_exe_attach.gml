

// do these things
global.target_unit.isCommander = true ;
global.target_unit.isDisrupted = false;
global.target_unit.state = "exhaust" ;
with global.acting_unit instance_destroy();
// reactivate main phaze UI
scr_exe_control_restart();

//nuke syscom
with par_syscom_menu instance_destroy();

//clear active unit
global.acting_unit = 0;
