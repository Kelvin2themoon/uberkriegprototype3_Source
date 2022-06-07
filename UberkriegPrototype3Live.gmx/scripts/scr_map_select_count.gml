//used to count properties and units
// to be used in map select and derivitive objects only

//initiate map data
cout_HQs    = 0; // index = 11
count_com   = 0; //15
count_base  = 0; //12
count_city  = 0; //13
count_tower = 0; //14
count_unit  = 0;

with(obj_unit){ 
        isObservable = true;
        other.count_unit +=1;
        }
    with obj_property {
        switch index {
            case 11 :
                other.cout_HQs +=1;
                break;
            case 15 :
                other.count_com +=1;
                break;
            case 12 :
                other.count_base +=1;
                break;
            case 13 :
                other.count_city +=1;
                break;
            case 14 :
                other.count_tower +=1;
                break;
            }
        }
