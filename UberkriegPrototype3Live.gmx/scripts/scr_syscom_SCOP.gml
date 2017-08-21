with global.P_Turn.CO 
    {
    //turn COP or "KriegSkill on
    SCOP_on = true ;
    //reduce power bar
    charge = 0;
    //set up for Radio HP drain
    if(SCOP_RadioDrainHP > 0 ) scr_globalRadioCheck();
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
    if( global.P_Turn.CO.SCOP_RadioDrainHP > 0 )
            {
            if( team != global.P_Turn.team and global.rangeCheck[x div 24, y div 24].sprite_index = spr_rangecheck_gold)
                {
                hp -= global.P_Turn.CO.SCOP_RadioDrainHP;
                if( hp < 1 ) hp = 1;
                }
            }
    }

scr_updateStanding_global();
scr_updateGlobalVision();

//check for smoke screen
if( global.P_Turn.CO.SCOP_SmokeScreen > 0)
    {
    instance_create(global.posX,global.posY,obj_smokeScreenCurosr);
    with( obj_smokeScreenCurosr ) smoke_rounds = global.P_Turn.CO.SCOP_SmokeScreen;
    }
//check for promotion
else if( global.P_Turn.CO.SCOP_Promote ) instance_create(global.posX,global.posY,obj_promote_Cursor);
 //check for disruptor
else if( global.P_Turn.CO.SCOP_Disrupt > 0)
    {
    instance_create(global.posX,global.posY,obj_disruptorCurosr);
    with(obj_disruptorCurosr) range = global.P_Turn.CO.SCOP_Disrupt
    }
//check for dummyDeploy
else if( global.P_Turn.CO.SCOP_DeployDummy > 0)
    {
    instance_create(global.posX,global.posY,obj_deployDummyCursor );
    global.P_Turn.CO.rounds = global.P_Turn.CO.SCOP_DeployDummy;
    }
//reactivate UI    
else{
    instance_activate_object(obj_battleCursor);
    instance_activate_object(obj_miniwin);
    instance_destroy();
    }
