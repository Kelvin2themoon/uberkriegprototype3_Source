/*
rini_section_find_next(iniHandle, Section);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())
[1]Section:String = The section to search in
Return Value:
Returns the name of the first key in a section. returns "" if nothing was found.

Description:
Finds the first Key in the specified section, this is good for iterating/searching through
all the keys in a specific section. This function needs to be called before rini_key_find_next()
Notes:
-None-
*/

return external_call(global.INI_DLL_KeyFirst,argument0,argument1);
