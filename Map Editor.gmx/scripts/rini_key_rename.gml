/*
rini_key_rename(iniHandle, Section, Key, newName);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())
[1]Section:String = The name of the Section
[2]Key:String = The name of the Key
[3]newName:String = The new name to change the key to


Return Value:
returns 0 on failure, 1 on sucess

Description:
Renames a key in the ini file.
Notes:
-None-
*/

return external_call(global.INI_DLL_KeyRename,argument0,argument1,argument2,argument3);
