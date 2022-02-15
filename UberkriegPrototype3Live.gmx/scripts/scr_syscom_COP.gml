with (global.P_Turn.CO) {
    //turn COP or "KriegSkill on
    COP_on = true ;
    //reduce power bar
    charge -= COP_Bar*star_value;
    //set up for Radio HP drain
    if(COP_RadioDrainHP > 0 ) scr_globalRadioCheck();
    }
with (obj_unit){
    if ownership = global.P_Turn.number{ 
        COP = true;
        //HPgain
        if( global.P_Turn.CO.COP_GainHP > 0 ) 
        hp += global.P_Turn.CO.COP_GainHP ;
        if hp > 10 hp = 10;
        //replace act and move again with Act_Agn swith fire range to zero if not want attack, capture must be turned off manually
        if (global.P_Turn.CO.COP_ActAgn[unit_index] and capturing = 0 and !isDisrupted) state = "idle";
        //NEW!! (v3.12C - change movAgain to only affect exhausted units)
          if (global.P_Turn.CO.COP_MovAgn[unit_index] and capturing = 0 and !isDisrupted and state = "exhaust" ){
                state = "idle";
                isMovAgn = true;
                } 
        //drain HP
        if( global.P_Turn.CO.COP_RadioDrainHP > 0 ){
            if( team != global.P_Turn.team and global.rangeCheck[x div 24, y div 24].sprite_index = spr_rangecheck_gold){
                hp -= global.P_Turn.CO.COP_RadioDrainHP;
                if( hp < 1 ) hp = 1;
                }
            }
        }
    }
   
scr_updateStanding_global();
scr_updateGlobalVision();

if (global.net_mode = 0 or global.P_Turn.number = global.Local_Player){
    //check for dummyDeploy
    if( global.P_Turn.CO.COP_DeployDummy > 0){
        instance_create(global.posX,global.posY,obj_deployDummyCursor );
        global.P_Turn.CO.rounds = global.P_Turn.CO.COP_DeployDummy;
        }
    
    //check for disruptor
    else if( global.P_Turn.CO.COP_Disrupt > 0){
        instance_create(global.posX,global.posY,obj_disruptorCurosr);
        with(obj_disruptorCurosr) range = global.P_Turn.CO.COP_Disrupt
        }
    //check for smokeeScreen
    else if( global.P_Turn.CO.COP_SmokeScreen > 0){ 
        instance_create(global.posX,global.posY,obj_smokeScreenCurosr);
        global.P_Turn.CO.COFX_rounds = global.P_Turn.CO.COP_SmokeScreen;
        with( obj_smokeScreenCurosr ){ 
            smoke_rounds = global.P_Turn.CO.COP_SmokeScreen;
            range = 2; //smoke 
            }
        }
    //check for promotion
    else if( global.P_Turn.CO.COP_Promote ) instance_create(global.posX,global.posY,obj_promote_Cursor);
    else{ 
        //reactivate UI    
        instance_activate_object(obj_battleCursor);
        instance_activate_object(obj_miniwin);
        instance_destroy();
        }  
    }
    
//if acting client, send initiation code
if (global.net_mode = 2 and global.P_Turn.number = global.Local_Player) {
    ds_map_clear(global.map_out);
    ds_map_add(global.map_out,"scr","net_cop_on");
    scr_send(global.map_out,"host");
    global.last_network_event = "net_cop_on sent";
    } 
