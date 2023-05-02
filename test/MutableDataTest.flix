use Assert.eq

def sort(l: List[a]): List[a] with Order[a] =
    region rc {
        let array = List.toArray(rc, l);
        Array.sort!(array);
        Array.toList(array)
    }

@Test
def testRegion(): Bool =
    let list = List#{3, 2, 1};
    let sortedList = sort(list);
    eq( sortedList, List#{1, 2, 3} )

@Test
def testReference(): Bool =
    region rc {
        let counter = ref 0 @ rc;
        counter := (deref counter) + 1;
        counter := (deref counter) + 1;
        counter := (deref counter) + 1;
        eq( deref counter, 3 )
    }

@Test
def testArray(): Bool =
    use Array.sum;
    region rc {
        let array = Array.repeat(rc, 3, 1);
        eq( array |> sum, 3)
    }