/*
rini_section_find_next(iniHandle);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())

Return Value:
returns the name of the next section in the ini file, or "" if nothing was found
(a.k.a "End of File")

Description:
Finds the next section in an ini file. Good for iterating/searching through
all of the sections in a file. rini_section_find_next() needs to be called before this.
Notes:
-None-
*/

return external_call(global.INI_DLL_SectionNext,argument0);
