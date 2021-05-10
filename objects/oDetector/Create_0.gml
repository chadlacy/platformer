/// @description Initialize variables for detector object upon creation. The detector object is for more precise collision handling for wall crawling enemies

parent_worm = instance_place(x,y,oWorm); // The worm that the detector belongs to
depth = -10000; // This is just to ensure detector sprite is positioned in front of worm for testing/debuggin purposes
buffer = 0; // At the exact moment (1-2frames) of rounding a corner, the position of the detector technically satisfies multiple case conditions at once. A 2 frame buffer between every case switch prevents the worm from spinning around in place