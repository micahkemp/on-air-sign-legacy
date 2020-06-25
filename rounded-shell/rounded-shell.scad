use <rounded-cube-with-accents/rounded-cube-with-accents.scad>
use <rounded-cube-with-accents/rounded-cube/rounded-cube.scad>

module remove_rounded_cube(length, width, height, edge_radius, accent_radius, accent_count, accent_margin, wall_thickness, floor_thickness) {
    translate([wall_thickness, wall_thickness, 0]) {
        rounded_cube_with_accents(
            length=length-wall_thickness*2,
            width=width-wall_thickness*2,
            height=height,
            edge_radius=edge_radius-wall_thickness,
            accent_radius=accent_radius+wall_thickness,
            accent_count=accent_count,
            accent_margin=accent_margin
        );
    }
}

module rounded_shell(length, width, height, edge_radius, accent_radius, accent_count, accent_margin, wall_thickness, floor_thickness) {
    difference() {
        rounded_cube_with_accents(
            length=length,
            width=width,
            height=height,
            accent_radius=accent_radius,
            accent_count=accent_count,
            accent_margin=accent_margin,
            edge_radius=edge_radius
        );

        remove_rounded_cube(
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
    }

    // re-add the floor, since it was removed in remove_rounded_cube, in order to make the accents line up more easily
    rounded_cube(
        length=length,
        width=width,
        height=floor_thickness,
        edge_radius=edge_radius
    );
}
