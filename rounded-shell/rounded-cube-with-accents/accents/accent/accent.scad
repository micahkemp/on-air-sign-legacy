module left_side_accent(width, radius, offset=0) {
    translate([-offset, 0, 0]) {
        rotate(a=-90, v=[1, 0, 0]) {
            cylinder(r=radius, h=width);
        }
    }
}

module right_side_accent(length, width, radius, offset=0) {
    translate([offset, 0, 0]) {
        translate([length, 0, 0]) {
            left_side_accent(
                width=width,
                radius=radius
            );
        }
    }
}

module front_accent(length, radius, offset=0) {
    translate([0, -offset, 0]) {
        rotate(a=90, v=[0, 1, 0]) {
            cylinder(r=radius, h=length);
        }
    }
}

module left_curved_accent(edge_radius, radius, offset=0) {
    translate([-offset, -offset, 0]) {
        translate([edge_radius, edge_radius, 0]) {
            rotate_extrude(angle=90) {
                translate([-edge_radius, 0, 0]) {
                    circle(r=radius);
                }
            }
        }
    }
}

module right_curved_accent(length, edge_radius, radius, offset=0) {
    translate([offset, -offset, 0]) {
        translate([length, 0, 0]) {
            rotate(a=90, v=[0, 0, 1]) {
                left_curved_accent(
                    edge_radius=edge_radius,
                    radius=radius
                );
            }
        }
    }
}

module accent(length, width, edge_radius, radius, offset=0) {
    left_side_accent(
        width=width,
        radius=radius,
        offset=offset
    );

    right_side_accent(
        length=length,
        width=width,
        radius=radius,
        offset=offset
    );

    front_accent(
        length=length,
        radius=radius,
        offset=offset
    );

    left_curved_accent(
        edge_radius=edge_radius,
        radius=radius,
        offset=offset
    );

    right_curved_accent(
        length=length,
        edge_radius=edge_radius,
        radius=radius,
        offset=offset
    );
}
