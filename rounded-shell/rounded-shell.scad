use <rounded-cube/rounded-cube.scad>

module remove_rounded_cube(length, width, height, edge_radius, wall_thickness, floor_thickness) {
    translate([wall_thickness, wall_thickness, floor_thickness]) {
        rounded_cube(
            length=length-wall_thickness*2,
            width=width-wall_thickness*2,
            height=height-floor_thickness,
            edge_radius=edge_radius-wall_thickness
        );
    }
}

module rounded_shell(length, width, height, edge_radius, wall_thickness, floor_thickness) {
    difference() {
        rounded_cube(
            length=length,
            width=width,
            height=height,
            edge_radius=edge_radius
        );

        remove_rounded_cube(
            length=length,
            width=width,
            height=height,
            edge_radius=edge_radius,
            wall_thickness=wall_thickness,
            floor_thickness=floor_thickness
        );
    }
}
