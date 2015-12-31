/*
rini_section_find_first(iniHandle);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())

Return Value:
returns the name of the first section in the ini file, or "" if nothing was found

Description:
Finds the first section in an ini file. Good for iterating/searching through
all of the sections in a file. This needs to be called before rini_section_find_next();
Notes:
-None-
*/

return external_call(global.INI_DLL_SectionFirst,argument0);
