/*
rini_key_delete(iniHandle, Section, Key);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())
[1]Section:String = The name of the Section
[2]Key:String= The Key to delete


Return Value:
returns 0 on failure, 1 on sucess

Description:
Deletes a key
Notes:
-None-
*/

return external_call(global.INI_DLL_KeyDelete,argument0,argument1,argument2);
