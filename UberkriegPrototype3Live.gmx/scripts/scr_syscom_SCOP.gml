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
        //if (global.P_Turn.CO.SCOP_ActAgain and isStanding and unit_index > 4) state = "idle";
         //indirect fire act again
        //if (global.P_Turn.CO.SCOP_RangeMoveAgain and (unit_index = 3 or unit_index = 8 or unit_index = 12 ) and capturing = 0) state = "idle";
        //NEW!! replace act and move again with Act_Agn swith fire range to zero if not want attack, capture must be turned off manually
        if (global.P_Turn.CO.SCOP_ActAgn[unit_index] and (capturing = 0 or global.P_Turn.CO.SCOP_CapAgain) and !isDisrupted) state = "idle";
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

//check for absolute vision
if global.P_Turn.CO.SCOP_AbsoluteVision = true {
    with obj_terrain isVisible = true;
    with obj_unit isVisible   = true;
    }
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
//check for deploy covert op
else if (global.P_Turn.CO.SCOP_DeployCovertOp)
    {
    instance_create(global.posX,global.posY,obj_deployCovertOp );
    }
    
//check for dummyDeploy
else if( global.P_Turn.CO.SCOP_DeployDummy > 0)
    {
    instance_create(global.posX,global.posY,obj_deployDummyCursor );
    global.P_Turn.CO.rounds = global.P_Turn.CO.SCOP_DeployDummy;
    }
    
//check for Deploy Land Cruiser
else if (global.P_Turn.CO.SCOP_landCruiser)
    {
    instance_create(global.posX,global.posY,obj_deployLandCruiserCursor);
    }

//reactivate UI    
else{
    instance_activate_object(obj_battleCursor);
    instance_activate_object(obj_miniwin);
    instance_destroy();
    }
