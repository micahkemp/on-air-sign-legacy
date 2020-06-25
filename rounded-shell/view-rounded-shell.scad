use <rounded-shell.scad>

$fa = 1;
$fs = 0.4;

length=30;
width=20;
height=10;
edge_radius=10;
wall_thickness=3;
floor_thickness=2;

rounded_shell(
    length=length,
    width=width,
    height=height,
    edge_radius=edge_radius,
    wall_thickness=wall_thickness,
    floor_thickness=floor_thickness
);
