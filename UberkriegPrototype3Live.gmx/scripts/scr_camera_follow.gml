var scr_x       = argument0; //x position, usually global.PosX
var scr_y       = argument1; //y position, ussually global.posY
var scr_border  = argument2; //barder buffer thickness
var scr_speed  = argument3; //move speed in pixels per frame
var stop        = true;


if ( view_xview[0] > scr_x*24 - scr_border and global.canScroll_x){
    view_xview[0] -= scr_speed;
    stop = false;
    }
if ( view_xview[0] + view_wport[0] < scr_x*24 + scr_border + 24 and global.canScroll_x){
    view_xview[0] += scr_speed;
    stop = false;
    }
if ( view_yview[0] > scr_y*24 - scr_border and global.canScroll_y){
    view_yview[0] -= scr_speed;
    stop = false;
    }
if ( view_yview[0] + view_hport[0] < scr_y*24 + scr_border+24 and global.canScroll_y){ 
    view_yview[0] += scr_speed;
    stop = false
    }
//can be used to trigger events after cammera finnished moving
return stop;
/*
if ( view_xview[0] > global.posX*24 - view_border and global.canScroll_x) view_xview[0] -= view_speed;
if ( view_xview[0] + view_wport[0] < global.posX*24 + view_border + 24 and global.canScroll_x) view_xview[0] += view_speed;
if ( view_yview[0] > global.posY*24 - view_border and global.canScroll_y) view_yview[0] -= view_speed;
if ( view_yview[0] + view_hport[0] < global.posY*24 + view_border+24 and global.canScroll_y) view_yview[0] += view_speed;
