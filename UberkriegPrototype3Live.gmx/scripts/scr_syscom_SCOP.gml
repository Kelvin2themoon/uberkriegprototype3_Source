with global.P_Turn.CO 
    {
    //turn COP or "KriegSkill on
    SCOP_on = true ;
    //reduce power bar
    charge -= (SCOP_Bar+COP_Bar)*1000 ;
    }

        
with (obj_unit)
    {
    if ownership = global.P_Turn.number
        { 
        SCOP = true;
        if( global.P_Turn.CO.SCOP_GainHP > 0 ) hp += global.P_Turn.CO.SCOP_GainHP ;
        if hp > 10 hp = 10;
        //act again
        if (global.P_Turn.CO.SCOP_ActAgain and isStanding and unit_index > 4) state = "idle";
        }
    }

scr_updateStanding_global();
scr_updateGlobalVision();

//check for smoke screen
if( global.P_Turn.CO.COFX_SmokeScreen > 0) instance_create(global.posX,global.posY,obj_smokeScreenCurosr);
//check for promotion
else if( global.P_Turn.CO.SCOP_Promote ) instance_create(global.posX,global.posY,obj_promote_Cursor);
 //check for disruptor
if( global.P_Turn.CO.SCOP_Disrupt > 0)
    {
    instance_create(global.posX,global.posY,obj_disruptorCurosr);
    with(obj_disruptorCurosr) range = global.P_Turn.CO.SCOP_Disrupt
    }
//reactivate UI    
else{
    instance_activate_object(obj_battleCursor);
    instance_activate_object(obj_miniwin);
    instance_destroy();
    }
