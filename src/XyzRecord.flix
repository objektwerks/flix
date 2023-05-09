mod XyzRecord {
    pub type alias XyzRecord = {x = Int32, y = Int32, z = Int32}

    pub def eq(rx: XyzRecord, ry: XyzRecord): Bool =
        rx.x == ry.x and rx.y == ry.y and rx.z == ry.z

    pub def sum(xyz: XyzRecord ): Int32 = xyz.x + xyz.y + xyz.z
}