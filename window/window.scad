module left_tongue(height, thickness, tongue_thickness) {
    translate([-tongue_thickness, (thickness-tongue_thickness)/2, 0]) {
        cube([tongue_thickness, tongue_thickness, height]);
    }
}

module right_tongue(height, length, thickness, tongue_thickness) {
    translate([length+tongue_thickness, 0, 0]) {
        left_tongue(
            height=height,
            thickness=thickness,
            tongue_thickness=tongue_thickness
        );
    }
}

module bottom_tongue(height, length, thickness, tongue_thickness) {
    translate([-tongue_thickness, (thickness-tongue_thickness)/2, -tongue_thickness]) {
        cube([length+tongue_thickness*2, tongue_thickness, tongue_thickness]);
    }
}

module window(length, height, thickness, tongue_thickness) {
    translate([-length/2, 0, -height]) {
        cube([length, thickness, height]);

        left_tongue(
            height=height,
            thickness=thickness,
            tongue_thickness=tongue_thickness
        );

        right_tongue(
            height=height,
            length=length,
            thickness=thickness,
            tongue_thickness=tongue_thickness
        );

        bottom_tongue(
            height=height,
            length=length,
            thickness=thickness,
            tongue_thickness=tongue_thickness
        );
    }
}

// call window() adjusted for tolerance
module window_opening(length, height, thickness, tongue_thickness, tongue_tolerance) {
    window(
        length=length,
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness+tongue_tolerance
    );
}
