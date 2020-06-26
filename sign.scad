use <rounded-shell/rounded-shell.scad>
use <window/window.scad>

module sign(length, width, height, edge_radius, accent_radius, accent_count, accent_margin, wall_thickness, floor_thickness, window_length, window_height, window_tongue_thickness, window_tongue_tolerance) {
    difference() {
        rounded_shell(
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

        translate([length/2, 0, height]) {
            window_opening(
                length=window_length,
                height=window_height,
                thickness=wall_thickness,
                tongue_thickness=window_tongue_thickness,
                tongue_tolerance=window_tongue_tolerance
            );
        }
    }
}
