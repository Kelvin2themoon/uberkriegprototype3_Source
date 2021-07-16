//basic control restart switch that takes into account network modes from unit command exe scritps
if((global.net_mode != 1 and global.P_Turn.number = global.Local_Player) or global.net_mode = 0){
    instance_activate_object(obj_battleCursor);
    with obj_battleCursor{
        x = global.posX*24;
        y = global.posY*24;
        instance_activate_object(obj_miniwin);
        }
    }
    
//ready for nexzt ation in recieved network queue
global.ready_next = true;
