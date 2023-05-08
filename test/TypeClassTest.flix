use Assert.eq
use NonEmpty.isNonEmpty;


@Test
def testTypeClass(): Bool =
    let string = "123";
    let emptyString = "";

    let list = 1 :: 2 :: 3 :: Nil;
    let emptyList: List[Int32] = Nil;

    eq( true, isNonEmpty(string) ) and
    eq( false, isNonEmpty(emptyString) ) and
    eq( true, isNonEmpty(list) ) and
    eq( false, isNonEmpty(emptyList) )