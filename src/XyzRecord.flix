mod XyzRecord {
    pub type alias XyzRecord = {x = Int32, y = Int32, z = Int32}

    pub def sum(xyz: XyzRecord ): Int32 = xyz.x + xyz.y + xyz.z
}