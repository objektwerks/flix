mod XyzRecord {
    pub type alias XyzRecord = {x = Int32, y = Int32, z = Int32}

    pub def eq(rx: XyzRecord, ry: XyzRecord): Bool = rx.x == ry.x and rx.y == ry.y and rx.z == ry.z

    pub def compare(rx: XyzRecord, ry: XyzRecord): Int32 =
        if (rx.x == ry.x and rx.y == ry.y and rx.z == ry.z) 0
        else if (rx.x < ry.x or rx.y < ry.y or rx.z < ry.z) -1
        else 1

    pub def toString(r: XyzRecord): String = "x: ${r.x} y: ${r.y} z: ${r.z}"

    pub def sum(xyz: XyzRecord ): Int32 = xyz.x + xyz.y + xyz.z
}