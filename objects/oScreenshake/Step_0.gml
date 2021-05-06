/// @description Insert description here
// You can write your code in this editor
if (shake) 
{ 
   shake_time -= 1; 
   var _xval = choose(-shake_magnitude, shake_magnitude); 
   var _yval = choose(-shake_magnitude, shake_magnitude); 
   camera_set_view_pos(view_camera[0], xcam+_xval, ycam+_yval); 

   if (shake_time <= 0) 
   { 
      shake_magnitude -= shake_fade; 

      if (shake_magnitude <= 0) 
      { 
         camera_set_view_pos(view_camera[0], xcam, ycam); 
         shake = false; 
      } 
   } 
}
else {
	xcam = camera_get_view_x(view_camera[0]);
	ycam = camera_get_view_y(view_camera[0]);
}