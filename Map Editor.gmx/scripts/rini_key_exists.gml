/*
rini_key_exists(iniHandle, Section, Key);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())
[1]Section:String = The name of the Section to check
[2]Key:String = The name of the Key

Return Value:
returns true if it exists, false if it doesnt exist

Description:
Checks if a Key exists in the ini file
Notes:
-None-
*/

return external_call(global.INI_DLL_KeyExists,argument0,argument1,argument2);
