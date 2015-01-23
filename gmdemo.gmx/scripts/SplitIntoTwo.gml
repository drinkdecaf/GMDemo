//Create New Enemy
MyChild = instance_create(x, y, oEnemy);
MyChild.MyColor = MyColor
MyChild.image_blend = MyColor

image_xscale -= 2;
image_yscale = image_xscale;  

audio_play_sound(aSpawn, 1, false)
