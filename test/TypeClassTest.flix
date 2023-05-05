use Assert.eq

pub class NonEmpty[a] {
    pub def nonEmpty(x: a): Bool
}

instance NonEmpty[String] {
    pub def nonEmpty(string: String): Bool = not String.isEmpty(string)
}

instance NonEmpty[List[a]] {
    pub def nonEmpty(list: List[a]): Bool = not List.isEmpty(list)
}

mod NonEmpty {
    // It's critical this method name is different from the type class method name.
    // Otherwise Flix will enter into an infinite loop during test execution.
    pub def isNonEmpty(x: a): Bool with NonEmpty[a] = NonEmpty.nonEmpty(x)
}

@Test
def testTypeClass(): Bool =
    use NonEmpty.isNonEmpty;

    let string = "123";
    let emptyString = "";

    let list = 1 :: 2 :: 3 :: Nil;
    let emptyList: List[Int32] = Nil;

    eq( true, isNonEmpty(string) ) and
    eq( false, isNonEmpty(emptyString) ) and
    eq( true, isNonEmpty(list) ) and
    eq( false, isNonEmpty(emptyList) )