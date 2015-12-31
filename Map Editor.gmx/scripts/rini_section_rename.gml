/*
rini_section_rename(iniHandle, Section, newName);

Arguments:
[0]iniHandle:Real = The handle to the ini file (from rini_open())
[1]Section:String = The name of the Section 
[2]newName:String = The new name to change the section name to


Return Value:
returns 0 on failure, 1 on sucess

Description:
Renames a section in the ini file
Notes:
-None-
*/

return external_call(global.INI_DLL_SectionRename,argument0,argument1,argument2);
