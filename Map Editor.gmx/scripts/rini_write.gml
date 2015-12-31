/*
rini_write(iniHandle);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())

Return Value:
-None-

Description:
Writes the ini file to the hard drive. rini_close() will automatically call this

Notes:
-None-
*/

return external_call(global.INI_DLL_Write,argument0);
