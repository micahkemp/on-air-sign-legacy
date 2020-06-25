use <accent/accent.scad>

module accents(length, width, height, edge_radius, radius, count, margin) {
    // 2 accents are required so that margin makes sense from top and bottom
    assert(count>=2, "Must have at least two accents!");

    top_accent_height = height-margin;
    // how much height the accents cover
    accent_height = height-margin*2;
    accent_spacing = accent_height/(count-1);

    for (i = [0 : count-1]) {
        this_accent_height = margin + i*accent_spacing;

        translate([0, 0, this_accent_height]) {
            accent(
                length=length,
                width=width,
                edge_radius=edge_radius,
                radius=radius
            );
        }
    }

}
