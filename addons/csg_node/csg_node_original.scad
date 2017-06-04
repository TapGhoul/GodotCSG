thickness=4.5;
$fn=128;

difference() {
    sphere(8);
    union() {
        cylinder(16, thickness, thickness, true);
        rotate(90, [0, 1, 0])
            cylinder(16, thickness, thickness, true);
        rotate(90, [1, 0, 0])
            cylinder(16, thickness, thickness, true);
    }
}