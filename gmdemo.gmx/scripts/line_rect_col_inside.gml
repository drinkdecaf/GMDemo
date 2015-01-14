// this function was written by torigara
//
// line_rect_col_inside(x1, y1, x2, y2, bleft, btop, bright, bbottom):
// arguments:
//  (x1, y1) the starting point of the line (must be inside the rectangle)
//  (x2, y2) the end point of the line
//  (bleft, btop)-(bright, bbottom) the coodinates of the rectangle
// output:
//  When there is intersection, its coordinates is set to the instance's variable _x and _y.
//  The return value indicates the following:
//  0 = no intersection (x1 and y1 is outside the rectangle)
//  1 = the intersection point is between (x1, y1) and (x2, y2)
//  2 = the intersection point is beyond (x2, y2)
var x1, y1, dx, dy, t, tx, ty, edge;
x1 = argument[0];
y1 = argument[1];
dx = argument[2] - x1;
dy = argument[3] - y1;
if (dx == 0 && dy == 0) return 0; // There is no intersection when the length is 0.

// Let x = x1 + dx * t  and calculate t at the intersection point with a vertical border.
if (dx != 0) {
    edge = argument[4 + (dx > 0) * 2]; // bleft or bright
    tx = (edge - x1) / dx;
}
// Let y = y1 + dy * t and calculate t for the vertical border.
if (dy != 0) {
    edge = argument[5 + (dy > 0) * 2]; // btop or bbottom
    ty = (edge - y1) / dy;
}
// Then take the shorter one.
if (dx == 0) t = ty;
else if (dy == 0) t = tx;
else t = min(tx, ty);
if (t < 0) return 0; // (x1, y1) is outside the rectangle

// Calculate the coordinates of the intersection point.
_x = x1 + dx * t;
_y = y1 + dy * t;
// When t > 1, the intersection point is beyond (x2, y2).
return 1 + (t > 1);
