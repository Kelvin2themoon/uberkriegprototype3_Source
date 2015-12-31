/*
rini_init(filename);

Arguments:
[0]filename:String = The name of the file to open (eg. config.ini)

Return Value:
returns a HANDLE which needs to be used on all other functions to
operate on the ini file that was opened

Description:
Opens an ini file for operating on. The ini file is loaded into
the memory for fast operations. The data isn't written to the hard drive (file)
again until it is CLOSED with rini_close() or rini_write();

Notes:
-None-
*/

return external_call(global.INI_DLL_Open,argument0,argument1);
