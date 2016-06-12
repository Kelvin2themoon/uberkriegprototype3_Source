command = argument0; //string


switch (command){
    case "wait":
        global.action_order = "wait";
        instance_create(0,0,obj_execute_unit_orders);
        break;

    case "endturn" : //end turn
        scr_syscom_endturn();
        break;
    }
