calc_rev_P = argument0// this argument should be int
total_rev = 0;

with(obj_property){
    if (ownership == other.calc_rev_P ){
        other.total_rev += global.income*(income/1000);
        }
    } 
    
return total_rev;
