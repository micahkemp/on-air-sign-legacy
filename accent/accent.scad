module left_side_accent(width, radius) {
    rotate(a=-90, v=[1, 0, 0]) {
        cylinder(r=radius, h=width);
    }
}

module right_side_accent(length, width, radius) {
    translate([length, 0, 0]) {
        left_side_accent(
            width=width,
            radius=radius
        );
    }
}

module front_accent(length, radius) {
    rotate(a=90, v=[0, 1, 0]) {
        cylinder(r=radius, h=length);
    }
}

module left_curved_accent(edge_radius, radius) {
    translate([edge_radius, edge_radius, 0]) {
        rotate_extrude(angle=90) {
            translate([-edge_radius, 0, 0]) {
                circle(r=radius);
            }
        }
    }
}

module right_curved_accent(length, edge_radius, radius) {
    translate([length, 0, 0]) {
        rotate(a=90, v=[0, 0, 1]) {
            left_curved_accent(
                edge_radius=edge_radius,
                radius=radius
            );
        }
    }
}

module accent(length, width, edge_radius, radius) {
    left_side_accent(
        width=width,
        radius=radius
    );

    right_side_accent(
        length=length,
        width=width,
        radius=radius
    );

    front_accent(
        length=length,
        radius=radius
    );

    left_curved_accent(
        edge_radius=edge_radius,
        radius=radius
    );

    right_curved_accent(
        length=length,
        edge_radius=edge_radius,
        radius=radius
    );
}
