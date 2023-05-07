use Assert.eq

@Test
def testAdd(): Bool = eq( 2, 1 + 1 )

@Test
def testSubstract(): Bool = eq( 1, 2 - 1 )

@Test
def testMultiply(): Bool = eq( 4, 2 * 2 )

@Test
def testDivide(): Bool = eq( 2, 4 / 2 )