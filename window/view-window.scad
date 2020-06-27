use <window.scad>

length=10;
height=10;
thickness=3;
tongue_thickness=1;
tongue_tolerance=0.5;

difference() {
    window_frame(
        length=length,
        height=height,
        thickness=thickness
    );

    window(
        length=length,
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness
    );
}
