//Draw Prepared number sprites

var drawNum_colour      = argument0 //sprite Index
var drawNum_isFlushLeft = argument1 //boolean
var drawNum_number      = argument2 //the number to be drawn
var drawNum_x   = argument3 //real
var drawNum_y  = argument4 //real
var drawNum_limit = argument5 // limit of how many numbers can be drawn (real)

//adjust for first position "1"
if ( drawNum_isFlushLeft and string_char_at(string(drawNum_number), 1) = "1" ) drawNum_x -= 5;

// shorten if negative
if drawNum_number < 0 drawNum_limit -= 1; 


//get legnth
var drawNum_length = string_length(string(drawNum_number));
//if flushed left


if ( drawNum_length > drawNum_limit )
{
    
  if (drawNum_isFlushLeft) {
    //start at 0 and work to max
    i=1
    for ( i=1 ; i<= drawNum_limit ; i+=1){
        //check for negative
        if string_char_at(string(drawNum_number),i) = "-"  draw_sprite(drawNum_colour, 10, drawNum_x+(11*i-11),drawNum_y);
        //elsew draw a number
        else draw_sprite(drawNum_colour, 11, drawNum_x+(11*i-11),drawNum_y);
        }
    }
    else{
        i=1
        //drawNum_length = string_length(string(abs(drawNum_number)));
        for ( i=1 ; i<=drawNum_limit ; i+=1){
        
        draw_sprite(drawNum_colour, 11, drawNum_x-(11*(i)),drawNum_y);
        
        //draw "minus" sign
        if drawNum_number < 0
        draw_sprite(drawNum_colour, 10, drawNum_x - drawNum_limit*11-11 ,drawNum_y);
        
        }
    }  


}




else
{

if (drawNum_isFlushLeft) {
    //start at 0 and work to max
    i=1
    for ( i=1 ; i<=drawNum_length ; i+=1){
        //check for negative
        if string_char_at(string(drawNum_number),i) = "-"  draw_sprite(drawNum_colour, 10, drawNum_x+(11*i-11),drawNum_y);
        //elsew draw a number
        else draw_sprite(drawNum_colour, real(string_char_at(string(drawNum_number),i)), drawNum_x+(11*i-11),drawNum_y);
        }
    }
    else{
        i=1
        drawNum_length = string_length(string(abs(drawNum_number)));
        for ( i=1 ; i<=drawNum_length ; i+=1){
        
        draw_sprite(drawNum_colour, real(string_char_at(string(abs(drawNum_number)),drawNum_length-i+1)), drawNum_x-(11*(i)),drawNum_y);
        
        //draw "minus" sign
        if drawNum_number < 0
        draw_sprite(drawNum_colour, 10, drawNum_x - string_length(string(abs(drawNum_number)))*11-11 ,drawNum_y);
        
        }
    }

}
 

