levelname = get_save_filename('Map Files|*.ini','')
levelname = levelname+".ini";
if file_exists(levelname) file_delete(levelname)
rini_open(levelname);
h = 0; //will be the iniHandle
for (i=0;i<instance_number(all);i+=1)
{
    inst = instance_find(all,i)
    if 
    (
        inst.id != self.id 
        and inst.id != obj_me_gui.id
        and inst.id != obj_me_scroller.id
        and inst.id != CONSOLE.id
        and inst.id != ME_CONSOLE.id
        and inst.id.x < 1500 //Uh this just keeps is so GUI buttons arent saved
    )
    {
        rini_write_real(levelname,string(h),"object",inst.object_index);
        rini_write_real(levelname,string(h),"XX",inst.x);
        rini_write_real(levelname,string(h),"YY",inst.y);
        if inst.object_index = obj_m_floor
        {
            rini_write_real(levelname,string(h),"sprite",inst.sprite);
        }
        if inst.object_index = obj_m_wall
        {
            rini_write_real(levelname,string(h),"sprite",inst.sprite);
        }
        h+=1
    }
}

rini_close();
