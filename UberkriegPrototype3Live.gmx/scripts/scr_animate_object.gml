/*
this script is used to animate images assigned to objects
manipulating Image Index, does not Draw new images
place in alarm[0] events!
*/

animate_object_firstframe   = argument0;
animate_object_lastframe    = argument1;
animate_object_framerate    = argument2; //delay out of 60 fps

//check if image index is between first and last frames, if not change to first frame
if (image_index < animate_object_firstframe or image_index >= animate_object_lastframe)
    {
    image_index = animate_object_firstframe-1;
    }

//set alarm to framerate
alarm[0] = animate_object_framerate;
image_index = image_index+1;
