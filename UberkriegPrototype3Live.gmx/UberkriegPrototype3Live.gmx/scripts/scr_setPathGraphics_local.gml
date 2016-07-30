
pathpic_x = argument0;
pathpic_y = argument1;
pathpic_index = 0;

//check north
if scr_inBound(          pathpic_x+0,pathpic_y-1){
    if global.rangeCheck[pathpic_x+0,pathpic_y-1].pathority != -1 {
        pathpic_index +=1;
        }
    }
    
//check east
if scr_inBound(          pathpic_x+1,pathpic_y-0){
    if global.rangeCheck[pathpic_x+1,pathpic_y-0].pathority != -1 {
        pathpic_index +=2;
        }
    }

//check south
if scr_inBound(          pathpic_x+0,pathpic_y+1){
    if global.rangeCheck[pathpic_x+0,pathpic_y+1].pathority != -1 {
        pathpic_index +=4;
        }
    }

//check west
if scr_inBound(          pathpic_x-1,pathpic_y-0){
    if global.rangeCheck[pathpic_x-1,pathpic_y-0].pathority != -1 {
        pathpic_index +=8;
        }
    }

global.rangeCheck[pathpic_x,pathpic_y].arrow_index = pathpic_index;


