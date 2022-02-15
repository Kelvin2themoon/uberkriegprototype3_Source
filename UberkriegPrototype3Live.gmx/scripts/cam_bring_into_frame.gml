target  = argument0;  // can use checker tiles, terrain, or even units? any object with native xy co-ordinates
boarder = argument1; // ho far from the ends of the screen target should be, defualts to 48

//last position first in case overidden via
if (global.canScroll_x){
    if (target.x + 24 >= view_xview[0] + 768 - boarder)    view_xview[0] = target.x - 768 + boarder + 24; //east
    if (target.x <= view_xview[0] + boarder)               view_xview[0] = target.x -boarder;             //west
    }
if (global.canScroll_y){
    if (target.y <= view_yview[0] + boarder)               view_yview[0] = target.y - boarder;            //north 
    if (target.y + 24 >= view_yview[0] + 432 - boarder)    view_yview[0] = target.y - 432 + boarder + 24; //south
    }

