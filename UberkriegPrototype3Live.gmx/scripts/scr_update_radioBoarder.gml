/*
to draw the radio boarder, call update radio script to switch on gold times
call this script to use gold tiles to detect sprites needed
then clear tiles in the same step 
*/

// for all clear tiles (-1) check for adjacent gold tiles and assign index

with (obj_checker_tile)
    {
    
    //reset boarder index
    rb_edge     = 0;
    rb_corner   = 0;
    rb_fill_v   = 0;
    rb_fill_h   = 0;
    
    //check all clear tiles
    if (sprite_index = -1 or sprite_index = spr_rangecheck_bluedk )
        {
        
        //edges
        if( scr_inBound(posx +0 ,posy -1)) if ( global.rangeCheck[posx +0 ,posy -1].sprite_index = spr_rangecheck_gold ) rb_edge +=1;  //noth
        if( scr_inBound(posx +1 ,posy +0)) if ( global.rangeCheck[posx +1 ,posy +0].sprite_index = spr_rangecheck_gold ) rb_edge +=2;  //east
        if( scr_inBound(posx +0 ,posy +1)) if ( global.rangeCheck[posx +0 ,posy +1].sprite_index = spr_rangecheck_gold ) rb_edge +=4;  //south
        if( scr_inBound(posx -1 ,posy +0)) if ( global.rangeCheck[posx -1 ,posy +0].sprite_index = spr_rangecheck_gold ) rb_edge +=8;  //west
        
        //corners account for conflict and exceptions
        
        //North-West
        if( scr_inBound(posx -1 ,posy -1)) 
            if ( global.rangeCheck[posx -1 ,posy -1].sprite_index = spr_rangecheck_gold 
                and (rb_edge = 2 or rb_edge = 4 or rb_edge = 6 )) 
                rb_corner +=1;  
                
        //North-ease    
        if( scr_inBound(posx +1 ,posy -1)) 
            if ( global.rangeCheck[posx +1 ,posy -1].sprite_index = spr_rangecheck_gold 
                and (rb_edge = 4 or rb_edge = 8 or rb_edge = 12 )) 
                rb_corner +=2;  
                
        //South-East        
        if( scr_inBound(posx +1 ,posy +1)) if ( global.rangeCheck[posx +1 ,posy +1].sprite_index = spr_rangecheck_gold 
            and (rb_edge = 1 or rb_edge = 8 or rb_edge = 9 )) 
            rb_corner +=4;  
        
        
        //south-West
        if( scr_inBound(posx -1 ,posy +1)) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index = spr_rangecheck_gold 
            and (rb_edge = 1 or rb_edge = 2 or rb_edge = 3 )) 
            rb_corner +=8;
            
        //to do, add filler v and h  
        
        }
    
    }

