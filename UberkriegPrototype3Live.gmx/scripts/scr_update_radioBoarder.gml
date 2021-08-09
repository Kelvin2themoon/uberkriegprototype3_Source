/*
to draw the radio boarder, call update radio script to switch on gold times
call this script to use gold tiles to detect sprites needed
then clear tiles in the same step 
*/

// for all clear tiles (-1) check for adjacent gold tiles and assign index

with (obj_checker_tile){
    //reset boarder index
    rb_edge     = 0;
    rb_corner   = 0;
    rb_fill_v   = 0;
    rb_fill_h   = 0;
    //check all clear tiles
    if (sprite_index = -1 or sprite_index = spr_rangecheck_bluedk ){
        //edges
        if( scr_inBound(posx +0 ,posy -1)) if ( global.rangeCheck[posx +0 ,posy -1].sprite_index = spr_rangecheck_gold ) rb_edge +=1;  //noth
        if( scr_inBound(posx +1 ,posy +0)) if ( global.rangeCheck[posx +1 ,posy +0].sprite_index = spr_rangecheck_gold ) rb_edge +=2;  //east
        if( scr_inBound(posx +0 ,posy +1)) if ( global.rangeCheck[posx +0 ,posy +1].sprite_index = spr_rangecheck_gold ) rb_edge +=4;  //south
        if( scr_inBound(posx -1 ,posy +0)) if ( global.rangeCheck[posx -1 ,posy +0].sprite_index = spr_rangecheck_gold ) rb_edge +=8;  //west
        //corners account for conflict and exceptions
        //North-West
        if( scr_inBound(posx -1 ,posy -1)) 
            if ( global.rangeCheck[posx -1 ,posy -1].sprite_index = spr_rangecheck_gold 
                and (rb_edge = 0 or rb_edge = 2 or rb_edge = 4 or rb_edge = 6 )) 
                rb_corner +=1;  
                
        //North-ease    
        if( scr_inBound(posx +1 ,posy -1)) 
            if ( global.rangeCheck[posx +1 ,posy -1].sprite_index = spr_rangecheck_gold 
                and (rb_edge = 0 or rb_edge = 4 or rb_edge = 8 or rb_edge = 12 )) 
                rb_corner +=2;  
                
        //South-East        
        if( scr_inBound(posx +1 ,posy +1)) if ( global.rangeCheck[posx +1 ,posy +1].sprite_index = spr_rangecheck_gold 
            and (rb_edge = 0 or rb_edge = 1 or rb_edge = 8 or rb_edge = 9 )) 
            rb_corner +=4;  
        
        
        //south-West
        if( scr_inBound(posx -1 ,posy +1)) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index = spr_rangecheck_gold 
            and (rb_edge = 0 or rb_edge = 1 or rb_edge = 2 or rb_edge = 3 )) 
            rb_corner +=8;
            
        //to do, add filler v and h  
        
        switch (rb_edge)
            {
            
            case 0:
                rb_fill_v = 0;
                rb_fill_h = 0;
                break;
            
            case 1:
                rb_fill_h = 3;
                if scr_inBound(posx -1, posy -1) if ( global.rangeCheck[posx -1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_h -=1;
                if scr_inBound(posx +1, posy -1) if ( global.rangeCheck[posx +1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_h -=2;
                break;
                
            case 2:
                rb_fill_v = 6;
                if scr_inBound(posx +1, posy -1) if (global.rangeCheck[posx +1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 2;
                if scr_inBound(posx +1, posy +1) if (global.rangeCheck[posx +1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 4;
                break;
                
            case 3:
                rb_fill_h = 1;
                rb_fill_v = 4; 
                if scr_inBound(posx -1, posy -1) if ( global.rangeCheck[posx -1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 1;
                if scr_inBound(posx +1, posy +1) if ( global.rangeCheck[posx +1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 4;
                break;
            
            case 4:
                rb_fill_h = 12;
                if scr_inBound(posx +1, posy +1) if ( global.rangeCheck[posx +1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 4;
                if scr_inBound(posx -1, posy +1) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 8;
                break;
                    
            case 5:
                rb_fill_h = 0;
                if scr_inBound(posx -1, posy -1) if ( global.rangeCheck[posx -1 ,posy -1].sprite_index = spr_rangecheck_gold ) rb_fill_h += 1;
                if scr_inBound(posx +1, posy -1) if ( global.rangeCheck[posx +1 ,posy -1].sprite_index = spr_rangecheck_gold ) rb_fill_h += 2;
                if scr_inBound(posx +1, posy +1) if ( global.rangeCheck[posx +1 ,posy +1].sprite_index = spr_rangecheck_gold ) rb_fill_h += 4;
                if scr_inBound(posx -1, posy +1) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index = spr_rangecheck_gold ) rb_fill_h += 8;
                break;
                
            case 6:
                rb_fill_v = 2;
                rb_fill_h = 8;
                if scr_inBound(posx +1, posy -1) if ( global.rangeCheck[posx +1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 2;
                if scr_inBound(posx -1, posy +1) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 8;
                break;
            
            case 7:
                rb_fill_h = 9;
                if scr_inBound(posx -1, posy -1) if ( global.rangeCheck[posx -1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 1;
                if scr_inBound(posx -1, posy +1) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 8;
                break;
                
            case 8:
                rb_fill_v = 9;
                if scr_inBound(posx -1, posy -1) if ( global.rangeCheck[posx -1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 1;
                if scr_inBound(posx -1, posy +1) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 8;
                break;
                
            case 9:
                rb_fill_v = 8;
                rb_fill_h = 2;
                if scr_inBound(posx -1, posy +1) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 8;
                if scr_inBound(posx +1, posy -1) if ( global.rangeCheck[posx +1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 2;
                break;
                
            case 10:
                rb_fill_v = 0;
                if scr_inBound(posx -1, posy -1) if ( global.rangeCheck[posx -1 ,posy -1].sprite_index = spr_rangecheck_gold ) rb_fill_v += 1;
                if scr_inBound(posx +1, posy -1) if ( global.rangeCheck[posx +1 ,posy -1].sprite_index = spr_rangecheck_gold ) rb_fill_v += 2;
                if scr_inBound(posx +1, posy +1) if ( global.rangeCheck[posx +1 ,posy +1].sprite_index = spr_rangecheck_gold ) rb_fill_v += 4;
                if scr_inBound(posx -1, posy +1) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index = spr_rangecheck_gold ) rb_fill_v += 8;
                break;
                
            case 11:
                rb_fill_v = 12;
                if scr_inBound(posx +1, posy +1) if ( global.rangeCheck[posx +1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 4;
                if scr_inBound(posx -1, posy +1) if ( global.rangeCheck[posx -1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 8;
                break;
                
            case 12:
                rb_fill_h = 4;
                rb_fill_v = 1;
                if scr_inBound(posx +1, posy +1) if ( global.rangeCheck[posx +1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 4;
                if scr_inBound(posx -1, posy -1) if ( global.rangeCheck[posx -1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 1;
                break;
                
            case 13:
                rb_fill_h = 6;
                if scr_inBound(posx +1, posy -1) if ( global.rangeCheck[posx +1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 2;
                if scr_inBound(posx +1, posy +1) if ( global.rangeCheck[posx +1 ,posy +1].sprite_index != spr_rangecheck_gold ) rb_fill_h -= 4;
                break;
                
            case 14:
                rb_fill_v = 3;
                if scr_inBound(posx -1, posy -1) if ( global.rangeCheck[posx -1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 1;
                if scr_inBound(posx +1, posy -1) if ( global.rangeCheck[posx +1 ,posy -1].sprite_index != spr_rangecheck_gold ) rb_fill_v -= 2;
                break;
                
            case 15:
                break;
                    
            }
        }
    }

