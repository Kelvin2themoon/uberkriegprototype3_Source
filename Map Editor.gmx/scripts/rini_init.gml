/*
rini_init();

Arguments:
-None-

Return Value:
-None-

Description:
Must be called somewhere BEFORE any other RINI related function is called.

Notes:
-None-
*/


dllname = "IniLibGMDLL.dll";

global.INI_DLL_Open=external_define(dllname,"rini_open",dll_cdecl,ty_real,2,ty_string,ty_string);
global.INI_DLL_Close=external_define(dllname,"rini_close",dll_cdecl,ty_real,1,ty_real);
global.INI_DLL_Write=external_define(dllname,"rini_write",dll_cdecl,ty_real,1,ty_real);
global.INI_DLL_GetKeyVal=external_define(dllname,"rini_read_real",dll_cdecl,ty_real,4,ty_real,ty_string,ty_string,ty_string);
global.INI_DLL_GetKeyString=external_define(dllname,"rini_read_string",dll_cdecl,ty_string,4,ty_real,ty_string,ty_string,ty_string);
global.INI_DLL_SetKeyVal=external_define(dllname,"rini_write_real",dll_cdecl,ty_real,4,ty_real,ty_string,ty_string,ty_string);
global.INI_DLL_SetKeyString=external_define(dllname,"rini_write_string",dll_cdecl,ty_real,4,ty_real,ty_string,ty_string,ty_string);
global.INI_DLL_SectionExists=external_define(dllname,"rini_section_exists",dll_cdecl,ty_real,2,ty_real,ty_string);
global.INI_DLL_KeyExists=external_define(dllname,"rini_key_exists",dll_cdecl,ty_real,3,ty_real,ty_string,ty_string);
global.INI_DLL_KeyRename=external_define(dllname,"rini_key_rename",dll_cdecl,ty_real,4,ty_real,ty_string,ty_string,ty_string);
global.INI_DLL_SectionRename=external_define(dllname,"rini_section_rename",dll_cdecl,ty_real,3,ty_real,ty_string,ty_string);
global.INI_DLL_SectionDelete=external_define(dllname,"rini_section_delete",dll_cdecl,ty_real,2,ty_real,ty_string);
global.INI_DLL_KeyDelete=external_define(dllname,"rini_key_delete",dll_cdecl,ty_real,3,ty_real,ty_string,ty_string);
global.INI_DLL_SectionFirst=external_define(dllname,"rini_section_find_first",dll_cdecl,ty_string,1,ty_real);
global.INI_DLL_SectionNext=external_define(dllname,"rini_section_find_next",dll_cdecl,ty_string,1,ty_real);


global.INI_DLL_KeyFirst=external_define(dllname,"rini_key_find_first",dll_cdecl,ty_string,2,ty_real,ty_string);
global.INI_DLL_KeyNext=external_define(dllname,"rini_key_find_next",dll_cdecl,ty_string,2,ty_real,ty_string);

