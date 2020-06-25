use <rounded-shell.scad>

$fa = 1;
$fs = 0.4;

length=50;
width=20;
height=20;
edge_radius=5;
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
