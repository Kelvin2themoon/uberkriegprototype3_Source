//reset Capturing
global.acting_unit.capturing  = 0;

//assumes load action is posible
if (global.target_unit.load_A = 0){
//load slot A
    global.acting_unit.depth = 0;//hide unit behind terrain
    //global.acting_unit.state = "exhaust";
    global.target_unit.load_A = global.acting_unit.id;
    instance_destroy();
    }
else {
    //load slot B
    global.acting_unit.depth = 0;//hide unit behind terrain
    //global.acting_unit.state = "exhaust";
    global.target_unit.load_B = global.acting_unit.id;
    instance_destroy();
    }

//deactivate acting unit
instance_deactivate_object(global.acting_unit);

// reactivate main phaze UI
instance_activate_object(obj_miniwin);
instance_activate_object(obj_battleCursor);
with obj_battleCursor{
    x = global.posX*24;
    y = global.posY*24;
    }
instance_destroy();
//nuke syscom
with obj_syscom_command instance_destroy();
//clear active unit
global.acting_unit = 0;
