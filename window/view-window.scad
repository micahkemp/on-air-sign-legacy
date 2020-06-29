use <window.scad>

$fa = 1;
$fs = 0.4;

length=70;
height=40;
thickness=3;
tongue_thickness=1;
tongue_tolerance=0.5;
line1="AG5SJ";
line2="ON AIR";
text_size=15;
text_height=1;
text_area_height=32;

difference() {
    window_with_text(
        length=length,
        height=height,
        thickness=thickness,
        tongue_thickness=tongue_thickness,
        line1=line1,
        line2=line2,
        text_size=text_size,
        text_height=text_height,
        text_area_height=text_area_height
    );
}
