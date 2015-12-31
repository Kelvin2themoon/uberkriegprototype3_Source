rini_init();
levelname = argument0; 
    if (file_exists(levelname))
    {
        rini_open(levelname);
        for(i=0;i<999;i+=1)
        {
            if  rini_section_exists(levelname,string(i)) = 1
            {
                obj = rini_read_real(levelname,string(i),"object",14);
                xx = rini_read_real(levelname,string(i),"XX",32);
                yy = rini_read_real(levelname,string(i),"YY",32);
                
                //I did this with the intention of adding different objects that
                //will take advantage of different types of variables
                //This looks pointless, but it's for something else I was going to do.
                switch(obj)
                {
                    case obj_m_floor:
                        sprite = rini_read_real(levelname,string(i),"sprite",11);
                        myFloor[i] = instance_create(xx,yy,obj);
                        myFloor[i].sprite = sprite;
                        break;
                        
                    case obj_m_wall:
                            sprite = rini_read_real(levelname,string(i),"sprite",11);
                            myFloor[i] = instance_create(xx,yy,obj);
                            myFloor[i].sprite = sprite;
                        break;
                }

            }
            else 
            {
                show_message("Map loaded!");
                instance_destroy();
                break;
            }
        }
        rini_close();
    }

