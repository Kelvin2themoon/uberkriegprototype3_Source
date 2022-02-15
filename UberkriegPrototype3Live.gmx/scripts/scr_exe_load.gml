//snap camera if out of frame
if (global.target_unit.isObservable) cam_bring_into_frame(global.target_unit,48);

//reset Capturing
global.acting_unit.capturing  = 0;

//assumes load action is posible
if (global.target_unit.load_A = 0){
//load slot A
    global.acting_unit.depth = 0;//hide unit behind terrain
    //global.acting_unit.state = "exhaust";
    global.target_unit.load_A = global.acting_unit.id
    //fuel and ammo
    global.target_unit.load_A.ammo = global.target_unit.load_A.max_ammo;
    global.target_unit.load_A.fuel = global.target_unit.load_A.max_fuel;;
    instance_destroy();
    }
else {
    //load slot B
    global.acting_unit.depth = 0;//hide unit behind terrain
    //global.acting_unit.state = "exhaust";
    global.target_unit.load_B = global.acting_unit.id;
    //fuel and ammo
    global.target_unit.load_B.ammo = global.target_unit.load_B.max_ammo;
    global.target_unit.load_B.fuel = global.target_unit.load_B.max_fuel;
    instance_destroy();
    }

//deactivate acting unit
instance_deactivate_object(global.acting_unit);

// reactivate main phaze UI
 // reactivate main phaze UI
scr_exe_control_restart();
instance_destroy();
//nuke syscom
with obj_syscom_command instance_destroy();
//clear active unit
global.acting_unit = 0;
