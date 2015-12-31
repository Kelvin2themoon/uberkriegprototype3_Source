/*
rini_write_string(iniHandle, Section, Key, Val);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())
[1]Section:String = The name of the Section
[2]Key:String = The name of the Key
[3]Val:String = String to write
Return Value:
returns 0 if there was a problem.. 1 on success

Description:
Writes a string to the ini file, replacing anything that already exists
or creating a new entry otherwise

Notes:
-None-
*/

return external_call(global.INI_DLL_SetKeyString,argument0,argument1,argument2,argument3);
