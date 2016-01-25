//returns trufals for (x,y) co-ordinates


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
