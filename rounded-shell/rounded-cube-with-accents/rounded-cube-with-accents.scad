use <rounded-cube/rounded-cube.scad>
use <accents/accents.scad>

module rounded_cube_with_accents(length, width, height, edge_radius, accent_radius, accent_count, accent_margin, accent_offset=0) {
    difference() {
        rounded_cube(
            length=length,
            width=width,
            height=height,
            edge_radius=edge_radius
        );

        accents(
            length=length,
            width=width,
            height=height,
            edge_radius=edge_radius,
            radius=accent_radius,
            count=accent_count,
            margin=accent_margin,
            offset=accent_offset
        );
    }
}
