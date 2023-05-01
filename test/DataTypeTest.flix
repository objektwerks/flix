use Assert.eq

@Test
def testTuple(): Bool =
    let tuple = (1, 2, 3);
    let (one, two, three) = tuple;
    eq( one + two + three, 6 )