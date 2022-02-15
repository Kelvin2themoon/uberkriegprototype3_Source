//get stargin positions
var posx = argument0 ;
var posy = argument1 ;
//nuber of stars;
var small_stars = argument2 ;
var large_stars = argument3;
var charge = argument4;
//draw small stars
var i = 0;
for (i = 0 ; i <  small_stars; i++ ){
    //if charge is over 1000 draw a full star
    if (charge >= star_value){           
        draw_sprite(spr_COPstar_charge,5,posx+(i*8),posy);
        charge -= star_value;  
        }
    // draw partial star
    else{            
        draw_sprite(spr_COPstar_charge,(charge/star_value)*5,posx+(i*8),posy);
        charge = 0 ;        
        }    
    }
    
i=0;
for (i = 0 ; i <  large_stars; i++ ){
        //draw full star
        if (charge > star_value){
             draw_sprite(spr_SCOPstar_charge,9,posx+(small_stars*8)+(i*12),posy);
             charge -= star_value;
             }
        // draw partial star
        else{
            draw_sprite(spr_SCOPstar_charge,(charge/star_value)*9,posx+(small_stars*8)+(i*12),posy);
            charge = 0 ;
            }
    }
