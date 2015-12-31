/*
rini_section_delete(iniHandle, Section);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())
[1]Section:String = The name of the Section to Delete



Return Value:
returns 0 on failure, 1 on sucess

Description:
Deletes an entire section, along with all of the keys inside of it.
Notes:
-None-
*/

return external_call(global.INI_DLL_SectionDelete,argument0,argument1);
