with global.P_Turn.CO {
    //turn COP or "KriegSkill on
    SCOP_on = true ;
    //reduce power bar
    charge = 0;
    //set up for Radio HP drain
    if(SCOP_RadioDrainHP > 0 ) scr_globalRadioCheck();
    }
    
    

        
with (obj_unit){
    if ownership = global.P_Turn.number{ 
        SCOP = true;
        if( global.P_Turn.CO.SCOP_GainHP > 0 ) hp += global.P_Turn.CO.SCOP_GainHP ;
        if hp > 10 hp = 10;
        //act again
        if (global.P_Turn.CO.SCOP_ActAgn[unit_index] and (capturing = 0 or global.P_Turn.CO.SCOP_CapAgain) and !isDisrupted) state = "idle";
        }
//radio hp drain
if( global.P_Turn.CO.SCOP_RadioDrainHP > 0 ){
        if( team != global.P_Turn.team and global.rangeCheck[x div 24, y div 24].sprite_index = spr_rangecheck_gold){
            hp -= global.P_Turn.CO.SCOP_RadioDrainHP;
            if( hp < 1 ) hp = 1;
            }
        }
    }

scr_updateStanding_global();

//check for absolute vision
if global.P_Turn.CO.SCOP_AbsoluteVision = true {
    if (global.net_mode = 2 ){
        if (global.P_Turn.team = global.P[global.Local_Player].team){
            with obj_terrain isObservable = true;
            with obj_unit    isObservable = true;
            }
        }
    else{
        with obj_terrain isObservable   = true;
        with obj_unit isObservable      = true;
        }
    }

scr_updateGlobalVision();
if (global.net_mode = 0 or global.P_Turn.number = global.Local_Player){
    //check for smoke screen
    if( global.P_Turn.CO.SCOP_SmokeScreen > 0){
        instance_create(global.posX,global.posY,obj_smokeScreenCurosr);
        with( obj_smokeScreenCurosr ) smoke_rounds = global.P_Turn.CO.SCOP_SmokeScreen;
        }
    //check for promotion
    else if( global.P_Turn.CO.SCOP_Promote ) instance_create(global.posX,global.posY,obj_promote_Cursor);
     //check for disruptor
    else if( global.P_Turn.CO.SCOP_Disrupt > 0){
        instance_create(global.posX,global.posY,obj_disruptorCurosr);
        with(obj_disruptorCurosr) range = global.P_Turn.CO.SCOP_Disrupt
        }
    //check for deploy covert op
    else if (global.P_Turn.CO.SCOP_DeployCovertOp){
        instance_create(global.posX,global.posY,obj_deployCovertOp );
        }
    //check for dummyDeploy
    else if( global.P_Turn.CO.SCOP_DeployDummy > 0){
        instance_create(global.posX,global.posY,obj_deployDummyCursor );
        global.P_Turn.CO.rounds = global.P_Turn.CO.SCOP_DeployDummy;
        }
        
    //check for Deploy Land Cruiser
    else if (global.P_Turn.CO.SCOP_landCruiser){
        instance_create(global.posX,global.posY,obj_deployLandCruiserCursor);
        }
    
    //reactivate UI    
    else{
        instance_activate_object(obj_battleCursor);
        instance_activate_object(obj_miniwin);
        instance_destroy();
        }
    }
    
//if acting client, send initiation code
if (global.net_mode = 2 and global.P_Turn.number = global.Local_Player) {
    ds_map_clear(global.map_out);
    ds_map_add(global.map_out,"scr","net_scop_on");
    scr_send(global.map_out,"host");
    global.last_network_event = "net_scop_on sent";
    } 
