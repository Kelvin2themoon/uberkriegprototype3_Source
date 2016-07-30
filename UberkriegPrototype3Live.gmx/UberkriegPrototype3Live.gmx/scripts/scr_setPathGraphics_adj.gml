
pathadjpic_x = argument0;
pathadjpic_y = argument1;

scr_setPathGraphics_local(pathadjpic_x,pathadjpic_y);


//check north
if scr_inBound(          pathadjpic_x+0,pathadjpic_y-1){
    if global.rangeCheck[pathadjpic_x+0,pathadjpic_y-1].pathority != -1 { 
        scr_setPathGraphics_local(pathadjpic_x+0,pathadjpic_y-1)
        }
    }
    
//check east
if scr_inBound(          pathadjpic_x+1,pathadjpic_y-0){
    if global.rangeCheck[pathadjpic_x+1,pathadjpic_y-0].pathority != -1 {
        scr_setPathGraphics_local(pathadjpic_x+1,pathadjpic_y-0)
        }
    }

//check south
if scr_inBound(          pathadjpic_x+0,pathadjpic_y+1){
    if global.rangeCheck[pathadjpic_x+0,pathadjpic_y+1].pathority != -1 {
        scr_setPathGraphics_local(pathadjpic_x+0,pathadjpic_y+1)
        }
    }

//check west
if scr_inBound(          pathpic_x-1,pathpic_y-0){
    if global.rangeCheck[pathpic_x-1,pathpic_y-0].pathority != -1 {
        scr_setPathGraphics_local(pathadjpic_x-1,pathadjpic_y+0)
        }
    }



