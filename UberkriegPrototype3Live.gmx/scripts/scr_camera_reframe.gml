first_pos = argument0;  //any object with x/y co-ordiates
last_pos = argument1;  // can use checker tiles, terrain, or even units? 

//last position first in case overidden via
if (global.canScroll_x){
    if (last_pos.x + 24 >= view_xview[0] + 768 - 48)    view_xview[0] = last_pos.x - 768 + 48 + 24; //east
    if (last_pos.x <= view_xview[0] + 48)               view_xview[0] = last_pos.x -48;             //west
    }
if (global.canScroll_y){
    if (last_pos.y <= view_yview[0] + 48)               view_yview[0] = last_pos.y - 48;            //north 
    if (last_pos.y + 24 >= view_yview[0] + 432 - 48)    view_yview[0] = last_pos.y - 432 + 48 + 24; //south
    }
//starting position
if (global.canScroll_x){
    if (first_pos.x + 24 >= view_xview[0] + 768 - 48)    view_xview[0] = first_pos.x - 768 + 48 + 24; //east
    if (first_pos.x <= view_xview[0] + 48)               view_xview[0] = first_pos.x -48;             //west
    }
if (global.canScroll_y){
    if (first_pos.y <= view_yview[0] + 48)               view_yview[0] = first_pos.y - 48;            //north 
    if (first_pos.y + 24 >= view_yview[0] + 432 - 48)    view_yview[0] = first_pos.y - 432 + 48 + 24; //south
    }
/* 
if (last_pos.x <= view_xview[0]+48)             view_xview[0] = last_pos.x - 48;
if (last_pos.x +24 >= view_xview[0] + 768)   view_xview[0] = last_pos.x -768 +48 +24 ;
if (last_pos.y <= view_yview[0])             view_yview[0] = last_pos.y - 48 ;
if (last_pos.y +24 >= view_yview[0] + 768)   view_yview[0] = last_pos.y -768 +48 +24 ;

if (first_pos.x <= view_xview[0])            view_xview[0] = first_pos.x - 48 ;
if (first_pos.x +24 >= view_xview[0] + 432)  view_xview[0] = first_pos.x -432 +48 +24 ;
if (first_pos.y <= view_yview[0])            view_yview[0] = first_pos.y - 48 ;
if (first_pos.y +24 >= view_yview[0] + 432)  view_yview[0] = first_pos.y -438 +48 +24 ;
