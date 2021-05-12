/// @description Logic for detector object determining how to move/rotate worm based on walls/corners
// The detector object is a 2x2 pixel object created at the origin of each worm instance
// When the detector senses an edge/corner, the detector appropriately adjusts worm sprite/motion to continue crawling along wall
// Detector object was used because of the nature of GMS2 collision checking/sprite rotation, the worm sprite being rectangular makes collision detecion wonky when rotating

x = parent_worm.x;
y = parent_worm.y+1;

if (buffer > 0) { // For a couple frames, the worm is perfectly on the corner and freaks out. This buffer prevents erroneous case switching
	buffer -= 1;
}
else if (parent_worm.worm_direction == 0) { // Clockwise
	switch (parent_worm.image_angle) {
		case 0: // Moving right, right side up
			if (!place_meeting(x,y+1,oWall)) { // Outer corner
				parent_worm.image_angle = 270;
				current_wall = instance_place(x-1,y+1,oWall); // Get id of wall that worm is now attached to
				parent_worm.x = current_wall.bbox_right+2; // Snap to edge of said wall
			}
			if (place_meeting(x+8,y-4,oWall)) { // Inner corner
				parent_worm.image_angle = 90;
				current_wall = instance_place(x+8,y-4,oWall);
				parent_worm.x = current_wall.bbox_left-1;
			}
		break;
		case 90: // Moving up, left side of wall
			if (!place_meeting(x+1,y-1,oWall)) { // Outer corner
				parent_worm.image_angle = 0;
				current_wall = instance_place(x+1,y+1,oWall);
				parent_worm.y = current_wall.bbox_top-1;
			}
			if (place_meeting(x-4,y-8,oWall)) { // Inner corner
				parent_worm.image_angle = 180;
				current_wall = instance_place(x-4,y-8,oWall);
				parent_worm.y = current_wall.bbox_bottom+2;
			}
		break;
		case 180: // Moving left, upside down
			if (!place_meeting(x,y-2,oWall)) { // Outer corner
				parent_worm.image_angle = 90;
				current_wall = instance_place(x+1,y-2,oWall);
				parent_worm.x = current_wall.bbox_left-1;
			}
			if (place_meeting(x-8,y+4,oWall)) { // Inner corner
				parent_worm.image_angle = 270;
				current_wall = instance_place(x-8,y+4,oWall);
				parent_worm.x = current_wall.bbox_right+2;
			}
		break;
		case 270: // Moving down, right side of wall
			if (!place_meeting(x-1,y,oWall)) { // Outer corner
				parent_worm.image_angle = 180;
				current_wall = instance_place(x-1,y-1,oWall);
				parent_worm.y = current_wall.bbox_bottom+2;
			}
			if (place_meeting(x+4,y+8,oWall)) { // Inner corner
				parent_worm.image_angle = 0;
				current_wall = instance_place(x+4,y+8,oWall);
				parent_worm.y = current_wall.bbox_top-1;
			}
		break;
	}
	buffer = 2; // Set a two frame buffer to safely navigate corners
}
else { // Counter clockwise
	switch (parent_worm.image_angle) {
		case 0: // Moving left, right side up
			if (!place_meeting(x,y+1,oWall)) { // Outer corner
				parent_worm.image_angle = 90;
				current_wall = instance_place(x+1,y+1,oWall); // Get id of wall that worm is now attached to
				parent_worm.x = current_wall.bbox_left-1; // Snap to edge of said wall
			}
			if (place_meeting(x-8,y-4,oWall)) { // Inner corner
				parent_worm.image_angle = 270;
				current_wall = instance_place(x-8,y-4,oWall);
				parent_worm.x = current_wall.bbox_right+2;
			}
		break;
		case 90: // Moving down, left side of wall
			if (!place_meeting(x+1,y,oWall)) { // Outer corner
				parent_worm.image_angle = 180;
				current_wall = instance_place(x+1,y-1,oWall);
				parent_worm.y = current_wall.bbox_bottom+2;
			}
			if (place_meeting(x-4,y+8,oWall)) { // Inner corner
				parent_worm.image_angle = 0;
				current_wall = instance_place(x-4,y+8,oWall);
				parent_worm.y = current_wall.bbox_top-1;
			}
		break;
		case 180: // Moving right, upside down
			if (!place_meeting(x,y-2,oWall)) { // Outer corner
				parent_worm.image_angle = 270;
				current_wall = instance_place(x-1,y-2,oWall);
				parent_worm.x = current_wall.bbox_right+2;
			}
			if (place_meeting(x+8,y+4,oWall)) { // Inner corner
				parent_worm.image_angle = 90;
				current_wall = instance_place(x+8,y+4,oWall);
				parent_worm.x = current_wall.bbox_left-1;
			}
		break;
		case 270: // Moving up, right side of wall
			if (!place_meeting(x-1,y-1,oWall)) { // Outer corner
				parent_worm.image_angle = 0;
				current_wall = instance_place(x-1,y+1,oWall);
				parent_worm.y = current_wall.bbox_top-1;
			}
			if (place_meeting(x+4,y-8,oWall)) { // Inner corner
				parent_worm.image_angle = 180;
				current_wall = instance_place(x+4,y-8,oWall);
				parent_worm.y = current_wall.bbox_bottom+2;
			}
		break;
	}
	buffer = 2; // Set a two frame buffer to safely navigate corners
}