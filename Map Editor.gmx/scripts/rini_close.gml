/*
rini_close(iniHandle);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())

Return Value:
-None-

Description:
Writes the ini file back on the hard drive (essentially "saves the changes")
and frees file from memory. Obviously you cannot continue operations on this ini file
after it's closed

Notes:
-None-
*/

return external_call(global.INI_DLL_Close,argument0);
