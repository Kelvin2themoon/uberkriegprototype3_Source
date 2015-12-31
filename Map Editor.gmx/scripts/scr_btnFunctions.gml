switch(btnFunction)
{
    case 0: // GOTO NEXT ROOM (FADE IN/OUT);
        room_goto_next();
        transition_kind = 21;
        break;
        
    case 1: // LOAD GAME
        //load game
        break;
        
    case 2: // EXIT GAME
        game_end();
        break;
        
    case 3: // GO BACK ONE ROOM
        room_goto_previous();
        transition_kind = 21;
        break;
        
    case 4: //START GAME
        a = instance_create(x,y,obj_player);
        a.x = 50;
        a.y = 50;
        a.playerOutfit = spr_playerSpr1
        room_goto_next();
        transition_kind = 21;
        break;
        
    case 5: // GO BACK TO MAIN MENU
        room_goto(rm_menu_main);
        transition_kind = 21;
        break;
        
    case 6: // GO TO MAP EDITOR
        room_goto(rm_mapEditor);
        transition_kind = 21;
        break;
        
    case 7: // RESTART GAME
        game_restart();
        break;
    
    //--MAP EDITOR BUTTON FUNCTIONS--\\
    
    case 90: //NEW MAP
        room_goto(rm_pmRoom);
        break;
        
    case 91: //LOAD MAP
        a = get_open_filename('Map Files|*.ini','')
        if a != "" //if a is not empty
        {
            b = instance_create(x,y,obj_me_levelLoader);
            b.levelname = a;
            room_goto(rm_pmRoom);
            //room_goto(rm_pmRoomLoad);
        }
        break;
        
    case 92: //IN MAP EDITOR SAVE MAP
        scr_me_saveMap();
        break;
}
