use <rounded-shell.scad>

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

rounded_shell(
    length=length,
    width=width,
    height=height,
    edge_radius=edge_radius,
    accent_radius=accent_radius,
    accent_count=accent_count,
    accent_margin=accent_margin,
    wall_thickness=wall_thickness,
    floor_thickness=floor_thickness
);
