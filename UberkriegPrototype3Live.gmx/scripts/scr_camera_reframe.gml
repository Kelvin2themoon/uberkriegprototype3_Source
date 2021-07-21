first_pos = argument0;  //any object with x/y co-ordiates
 last_pos = argument1;  // can use checker tiles, terrain, or even units? 

if (last_pos.x < view_xview[0]) view_xview[0] = last_pos.x - 48 ;
if (last_pos.x +24 > view_xview[0] + 768) view_xview[0] =  last_pos.x -768 +48 +24 ;
if (last_pos.y < view_yview[0]) view_yview[0] = last_pos.y - 48 ;
if (last_pos.y +24 > view_yview[0] + 768) view_yview[0] =  last_pos.y -768 +48 +24 ;

if (first_pos.x < view_xview[0]) view_xview[0] = first_pos.x - 48 ;
if (first_pos.x +24 > view_xview[0] + 432) view_xview[0] =  first_pos.x -432 +48 +24 ;
if (first_pos.y < view_yview[0]) view_yview[0] = first_pos.y - 48 ;
if (first_pos.y +24 > view_yview[0] + 432) view_yview[0] =  first_pos.y -438 +48 +24 ;
