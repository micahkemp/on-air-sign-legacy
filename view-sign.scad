use <sign.scad>
use <window/window.scad>

$fa = 1;
$fs = 0.4;

length=80;
width=20;
height=40;
edge_radius=10;
wall_thickness=2;
floor_thickness=2;
accent_radius=2;
accent_count=2;
accent_margin=13;
// window frame length
//   20 window length
// +  8 window frame thickness * 2
// = 28
accent_center_length=28;
window_length=40;
// window height = height - window_thickness - floor_thickness
window_height=34;
window_thickness=6;
window_tongue_thickness=2;
window_tongue_tolerance=0.4;
power_socket_hole_diameter=8.3;

sign(
    length=length,
    width=width,
    height=height,
    edge_radius=edge_radius,
    accent_radius=accent_radius,
    accent_count=accent_count,
    accent_margin=accent_margin,
    accent_center_length=accent_center_length,
    wall_thickness=wall_thickness,
    floor_thickness=floor_thickness,
    window_length=window_length,
    window_height=window_height,
    window_thickness=window_thickness,
    window_tongue_thickness=window_tongue_thickness,
    window_tongue_tolerance=window_tongue_tolerance,
    power_socket_hole_diameter=power_socket_hole_diameter
);

rotate(a=90, v=[1, 0, 0]) {
    translate([length/2, 0, height]) {
        window(
            length=window_length,
            height=window_height,
            thickness=window_thickness,
            tongue_thickness=window_tongue_thickness
        );
    }
}
