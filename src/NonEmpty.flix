mod NonEmpty {
    pub class NonEmpty[a] {
        pub def nonEmpty(x: a): Bool
    }

    instance NonEmpty[String] {
        pub def nonEmpty(string: String): Bool = not String.isEmpty(string)
    }

    instance NonEmpty[List[a]] {
        pub def nonEmpty(list: List[a]): Bool = not List.isEmpty(list)
    }

    // It's critical this method name is different from the type class method
    // name. Otherwise Flix will enter into an infinite loop during execution.
    pub def isNonEmpty(x: a): Bool with NonEmpty[a] = NonEmpty.nonEmpty(x)
}