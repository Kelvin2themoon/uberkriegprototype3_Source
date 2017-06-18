// this script draws power stars

//get stargin positions
var posx = argument0 ;
var posy = argument1 ;

//nuber of stars;
var small_stars = argument2 ;
var large_stars = argument3;

//draw small stars

var i = 0;

for (i = 0 ; i <  small_stars; i++ )
    
    {
    
        draw_sprite(spr_COPstar_charge,5,posx+(i*8),posy);
    
    }
    
    i=0;
for (i = 0 ; i <  large_stars; i++ )
    
    {
    
        draw_sprite(spr_SCOPstar_charge,9,posx+(small_stars*8)+(i*12),posy);
    
    }
