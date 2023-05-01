use Assert.eq

@Test
def testAdd(): Bool = eq(1 + 1, 2)

@Test
def testSubstract(): Bool = eq(2 - 1, 1)

@Test
def testMultiply(): Bool = eq(2 * 2, 4)