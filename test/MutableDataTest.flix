use Assert.eq

def sort(l: List[a]): List[a] with Order[a] =
    region rc {
        let arr = List.toArray(rc, l);
        Array.sort!(arr);
        Array.toList(arr)
    }

@Test
def testRegion(): Bool =
    let list = List#{3, 2, 1};
    let sortedList = sort(list);
    eq( sortedList, List#{1, 2, 3} )