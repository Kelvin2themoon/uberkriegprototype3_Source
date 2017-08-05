//origin location
var ox = argument0;
var oy = argument1;
//range
var range = argument2;
//type(boolean)
var sprite = argument3; //gold or darkBlue;
 
//loop variables
var ix = -range;
var iy = -range;
if(range != 0 )
    {
    //check all possibe x & y
    for( ix = -range ; ix <= range ; ix += 1 )
        {
        for ( iy = -range ; iy <= range ; iy += 1 )
            {
            // check on edge 
            if( abs(ix) + abs(iy) = range )
                {
                //check in bound
                if(scr_inBound(ox+ix,oy+iy))
                    {
                    //draw corners, comansate for rotate
                    if      ( ix =  range) draw_sprite_ext(sprite,0,24*(ox+ix+1),24*(oy+iy+0),1,1,270,c_white,1);
                    else if ( ix = -range) draw_sprite_ext(sprite,0,24*(ox+ix+0),24*(oy+iy+1),1,1, 90,c_white,1);
                    else if ( iy =  range) draw_sprite_ext(sprite,0,24*(ox+ix+1),24*(oy+iy+1),1,1,180,c_white,1);
                    else if ( iy = -range) draw_sprite_ext(sprite,0,24*(ox+ix+0),24*(oy+iy+0),1,1,  0,c_white,1);
                    //draw edges
                    else if ( ix > 0 )
                        {
                        if      (iy > 0 ) draw_sprite_ext(sprite,1,24*(ox+ix+1),24*(oy+iy+0),1,1,270,c_white,1);
                        else if (iy < 0 ) draw_sprite_ext(sprite,1,24*(ox+ix+0),24*(oy+iy+0),1,1,  0,c_white,1);
                        }
                       else if ( ix < 0 )
                        {
                        if      (iy > 0 ) draw_sprite_ext(sprite,1,24*(ox+ix+1),24*(oy+iy+1),1,1,180,c_white,1);
                        else if (iy < 0 ) draw_sprite_ext(sprite,1,24*(ox+ix+0),24*(oy+iy+1),1,1, 90,c_white,1);
                        }  
                    
                    }
                }
            }
        }
    }
