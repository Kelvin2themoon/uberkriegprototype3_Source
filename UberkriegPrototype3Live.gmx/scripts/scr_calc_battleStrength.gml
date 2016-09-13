//input player

target_player = argument0;
//return variable
total = 0;

with (obj_unit) {
    if (ownership = other.target_player.number){
        other.total += (cost div 10)*hp;
        }
    }
    
return total;
