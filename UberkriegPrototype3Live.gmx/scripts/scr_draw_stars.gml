// this script draws power stars

//get stargin positions
var posx = argument0 ;
var posy = argument1 ;
//nuber of stars;
var small_stars = argument2 ;
var large_stars = argument3;
var charge = argument4;

var cop_on  = argument5;
var scop_on = argument6;

//cop_on = true;
//scop_on = true;

var dance = true;
var offset = 6
//draw small stars
var i = 0;
var j =0 // for srtar drawing
for (i = 0 ; i <  small_stars; i++ ){
    offset = (12+global.star_dance-i) mod 6;
    j++;
    //if charge is over star draw a full star
    if (charge >= star_value){           
        if cop_on draw_sprite(spr_COPstar_flash,offset,posx+(i*8),posy+offset-6);
        else draw_sprite(spr_COPstar_charge,5,posx+(i*8),posy);
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
        if (charge >= star_value){
            offset = (12+(global.star_dance)-(small_stars+i)) mod 6;
            j++;
            if scop_on draw_sprite(spr_SCOPstar_flash,offset,posx+(small_stars*8)+(i*12),posy+offset-6);
            else  draw_sprite(spr_SCOPstar_charge,9,posx+(small_stars*8)+(i*12),posy);
            charge -= star_value;
            }
        // draw partial star
        else{
            draw_sprite(spr_SCOPstar_charge,(charge/star_value)*9,posx+(small_stars*8)+(i*12),posy);
            charge = 0 ;
            }
    }
