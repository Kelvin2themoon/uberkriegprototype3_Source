var is_reciever = false;
if (global.net_mode != 0 and global.Local_Player != global.P_Turn.number)is_reciever = true;
return is_reciever;
