module left_cylinder(height, radius) {
    translate([radius, radius, 0])
        cylinder(r=radius, h=height);
}

module left_remove_edge(height, radius) {
    difference() {
        cube([radius, radius, height]);
        left_cylinder(height=height, radius=radius);
    }
}

module right_remove_edge(length, height, radius) {
    translate([length, 0, 0]) {
        rotate(a=90, v=[0, 0, 1]) {
            left_remove_edge(height=height, radius=radius);
        }
    }
}

// origin is front left bottom of cube being altered
module remove_edges(length, height, radius) {
    left_remove_edge(height=height, radius=radius);
    right_remove_edge(length=length, height=height, radius=radius);
}
