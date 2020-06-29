use <text-area/text-area.scad>

module front_left_tongue_cube(height, thickness, tongue_thickness) {
    translate([-tongue_thickness, 0, -tongue_thickness]) {
        cube([tongue_thickness, thickness/2, height+tongue_thickness]);
    }
}

module front_right_tongue_cube(length, height, thickness, tongue_thickness) {
    translate([length+tongue_thickness, 0, 0]) {
        front_left_tongue_cube(
            height=height,
            thickness=thickness,
            tongue_thickness=tongue_thickness
        );
    }
}

module front_bottom_tongue_cube(length, thickness, tongue_thickness) {
    translate([-tongue_thickness, 0, -tongue_thickness]) {
        cube([length+tongue_thickness*2, thickness/2, tongue_thickness]);
    }
}

module front_tongue_cubes(length, height, thickness, tongue_thickness) {
    front_left_tongue_cube(
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness
    );

    front_right_tongue_cube(
        length=length,
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness
    );

    front_bottom_tongue_cube(
        length=length,
        thickness=thickness,
        tongue_thickness=tongue_thickness
    );
}

function cutout_angle(thickness, tongue_thickness)
    = atan2(thickness/2, -tongue_thickness) - 90;

module front_left_tongue_cutout(height, thickness, tongue_thickness) {
    angle = cutout_angle(thickness, tongue_thickness);

    rotate(a=angle, v=[0, 0, 1]) {
        front_left_tongue_cube(
            height=height,
            // double thickness of window to avoid missing part of the cube being cut out
            thickness=thickness*2,
            tongue_thickness=tongue_thickness
        );
    }
}

module front_right_tongue_cutout(length, height, thickness, tongue_thickness) {
    translate([length, 0, 0]) {
        mirror([1, 0, 0]) {
            front_left_tongue_cutout(
                height=height,
                thickness=thickness,
                tongue_thickness=tongue_thickness
            );
        }
    }
}

module front_bottom_tongue_cutout(length, height, thickness, tongue_thickness) {
    angle = cutout_angle(thickness, tongue_thickness);

    rotate(a=-angle, v=[1, 0, 0]) {
        translate([-tongue_thickness, 0, -tongue_thickness]) {
            cube([length+tongue_thickness*2, thickness, tongue_thickness]);
        }
    }
}

module front_tongue_cutouts(length, height, thickness, tongue_thickness) {
    front_left_tongue_cutout(
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness
    );

    front_right_tongue_cutout(
        length=length,
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness
    );

    front_bottom_tongue_cutout(
        length=length,
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness
    );
}

module front_tongue(length, height, thickness, tongue_thickness) {
    difference() {
        front_tongue_cubes(
            length=length,
            height=height,
            thickness=thickness,
            tongue_thickness=tongue_thickness
        );

        front_tongue_cutouts(
            length=length,
            height=height,
            thickness=thickness,
            tongue_thickness=tongue_thickness
        );
    }
}

module back_tongue(length, height, thickness, tongue_thickness) {
    translate([0, thickness, 0]) {
        mirror([0, 1, 0]) {
            front_tongue(
                length=length,
                height=height,
                thickness=thickness,
                tongue_thickness=tongue_thickness
            );
        }
    }
}

module tongue(length, height, thickness, tongue_thickness) {
    front_tongue(
        length=length,
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness

    );
    back_tongue(
        length=length,
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness
    );
}

module window(length, height, thickness, tongue_thickness) {
    translate([-length/2, 0, -height]) {
        cube([length, thickness, height]);

        tongue(
            height=height,
            length=length,
            thickness=thickness,
            tongue_thickness=tongue_thickness
        );
    }
}

module window_with_text(length, height, thickness, tongue_thickness, line1, line2, text_size, text_height, text_area_height) {
    difference() {
        window(
            length=length,
            height=height,
            thickness=thickness,
            tongue_thickness=tongue_thickness
        );

        translate([0, 0, -height/2]) {
            text_area(
                line1=line1,
                line2=line2,
                size=text_size,
                height=text_height,
                text_area_height=text_area_height
            );
        }
    }
}

// call window() adjusted for tolerance
module window_opening(length, height, thickness, tongue_thickness, tongue_tolerance) {
    window(
        length=length+tongue_tolerance,
        height=height+tongue_tolerance,
        thickness=thickness,
        tongue_thickness=tongue_thickness
    );
}

// this is before window_opening is removed, so no tolerance
module window_frame(length, height, thickness) {
    translate([-length/2-thickness, 0, -height-thickness]) {
        cube([length+thickness*2, thickness, height+thickness]);
    }
}
