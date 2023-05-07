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
    eq( List#{1, 2, 3}, sortedList )

@Test
def testReference(): Bool =
    region rc {
        let counter = ref 0 @ rc;
        counter := (deref counter) + 1;
        counter := (deref counter) + 1;
        counter := (deref counter) + 1;
        eq( 3, deref counter )
    }

@Test
def testArray(): Bool =
    use Array.sum;
    region rc {
        let array = Array.repeat(rc, 3, 1);
        eq( 3, array |> sum )
    }

@Test
def testMutList(): Bool =
    use MutList.sum;
    region rc {
        let numbers = 
            MutList.new(rc) !> 
            MutList.push!(1) !> 
            MutList.push!(2) !>
            MutList.push!(3);
        eq( numbers |> sum, 6 )
    }

@Test
def testMutSet(): Bool =
    use MutSet.sum;
    region rc {
        let numbers = 
            MutSet.new(rc) !> 
            MutSet.add!(1) !> 
            MutSet.add!(2) !>
            MutSet.add!(3);
        eq( numbers |> sum, 6 )
    }