with global.P_Turn.CO 
    {
    //turn COP or "KriegSkill on
    COP_on = true ;
    //reduce power bar
    charge -= COP_Bar*1000
    //set up for Radio HP drain
    if(COP_RadioDrainHP > 0 ) scr_globalRadioCheck();
    }
    
    
with (obj_unit)
    {
    if ownership = global.P_Turn.number
        { 
        COP = true;
        //HP+2
        if( global.P_Turn.CO.COP_GainHP > 0 ) hp += global.P_Turn.CO.COP_GainHP ;
        if hp > 10 hp = 10;
        //move again
        if (global.P_Turn.CO.COP_ActAgain and isStanding and unit_index > 4) state = "idle";
        }
    else if( global.P_Turn.CO.COP_RadioDrainHP > 0 )
        {
            if( team != global.P_Turn.team and global.rangeCheck[x div 24, y div 24].sprite_index = spr_rangecheck_gold)
                {
                hp -= global.P_Turn.CO.COP_RadioDrainHP;
                if( hp < 1 ) hp = 1;
                }
            }
    }
scr_updateStanding_global();
scr_updateGlobalVision();
    
    
//reactivate UI    
instance_activate_object(obj_battleCursor);
instance_activate_object(obj_miniwin);
instance_destroy();

