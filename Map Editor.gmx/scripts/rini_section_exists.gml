/*
rini_section_exists(iniHandle, Section);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())
[1]Section:String = The name of the Section to check

Return Value:
returns true if it exists, false if it doesnt exist

Description:
Checks if a Section exists in the ini file
Notes:
-None-
*/

return external_call(global.INI_DLL_SectionExists,argument0,argument1);
