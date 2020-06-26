use <power-socket.scad>

// measured outside the threads
socket_diameter=7.8;
// wall thickness
thickness = 2;

// add tolerance
diameter=socket_diameter+0.5;

power_socket_hole(
    diameter=diameter,
    thickness=thickness
);
