mod Color {
    pub enum Color {
        case Red(Int32)
        case White(Int32)
        case Blue(Int32)
    }

    pub def valueOf(color: Color): Int32 = match color {
        case Color.Red(i) => i * 2
        case Color.White(i) => i * 2
        case Color.Blue(i) => i * 2
    }
}