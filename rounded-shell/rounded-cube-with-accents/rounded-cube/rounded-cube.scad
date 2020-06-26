use <remove-edges/remove-edges.scad>

module rounded_cube(length, width, height, edge_radius) {
    difference() {
        cube([length, width, height]);
        remove_edges(length=length, height=height, radius=edge_radius);
    }
}
