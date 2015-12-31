/*
rini_section_find_next(iniHandle, Section);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())
[1]Section:String = The section to search in
Return Value:
Returns the name of the next key in a section. returns "" if nothing was found, 
or there are no more keys to find (a.k.a. "End of file"/"End of List")

Description:
Finds the next Key in the specified section, this is good for iterating/searching through
all the keys in a specific section. rini_key_find_first() needs to be called BEFORE this function with the same Section name.
Notes:
-None-
*/



return external_call(global.INI_DLL_KeyNext,argument0,argument1);
