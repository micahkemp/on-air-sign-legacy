use <sign.scad>

$fa = 1;
$fs = 0.4;

length=50;
width=25;
height=40;
edge_radius=10;
wall_thickness=2;
floor_thickness=2;
accent_radius=2;
accent_count=2;
accent_margin=13;
window_length=30;
window_height=30;
window_tongue_thickness=1;
window_tongue_tolerance=0.1;

sign(
    length=length,
    width=width,
    height=height,
    edge_radius=edge_radius,
    accent_radius=accent_radius,
    accent_count=accent_count,
    accent_margin=accent_margin,
    wall_thickness=wall_thickness,
    floor_thickness=floor_thickness,
    window_length=window_length,
    window_height=window_height,
    window_tongue_thickness=window_tongue_thickness,
    window_tongue_tolerance=window_tongue_tolerance
);
