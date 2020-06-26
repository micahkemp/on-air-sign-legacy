// origin is center of outward-facing hole face
module power_socket_hole(diameter, thickness) {
    rotate(a=90, v=[1, 0, 0]) {
        cylinder(d=diameter, h=thickness);
    }
}
