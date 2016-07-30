// this code changes a unit colour Via sprite change

unit_change_sprite_object =     argument0; // the target object (must already exsist)
unit_change_sprite_ownership =  argument1; //the sprite number



unit_change_sprite_object.sprite_index = asset_get_index(string_replace(sprite_get_name(unit_change_sprite_object.sprite_index), string_digits(sprite_get_name(unit_change_sprite_object.sprite_index)),string(unit_change_sprite_ownership)));
            




