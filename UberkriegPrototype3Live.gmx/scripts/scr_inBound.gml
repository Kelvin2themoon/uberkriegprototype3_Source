/*
this is a basic function used to check if the input co-ordinates exsist (is with-in 0 and the map size).
used mostly to avoid variable doesnt exsist or array musr be a positive number errors
*/


//xy values for local use
boundX = argument0;
boundY = argument1;


if (boundX < 0 || boundX >= global.mapW || boundY < 0 || boundY >= global.mapH) 
    {
    return false;
    }
    
else{
    return true;
    }
