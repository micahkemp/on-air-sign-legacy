module 3d_text(text, size, height, font) {
    linear_extrude(height=height) {
        text(text, size=size, font=font, halign="center", valign="center");
    }
}

module 3d_text_on_x(text, size, height, font) {
    translate([0, size/2, 0]) {
        3d_text(
            text=text,
            size=size,
            height=height,
            font=font
        );
    }
}

module 3d_text_under_x(text, size, height, font) {
    translate([0, -size/2, 0]) {
        3d_text(
            text=text,
            size=size,
            height=height,
            font=font
        );
    }
}

module text_area(line1, line2, size, height, font, text_area_height) {
    rotate(a=90, v=[1, 0, 0]) {
        translate([0, 0, -height]) {
            translate([0, text_area_height/2, 0]) {
                3d_text_under_x(
                    text=line1,
                    size=size,
                    height=height,
                    font=font
                );
            }

            translate([0, -text_area_height/2, 0]) {
                3d_text_on_x(
                    text=line2,
                    size=size,
                    height=height,
                    font=font
                );
            }
        }
    }
}
