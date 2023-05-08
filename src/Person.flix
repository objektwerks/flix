mod Person {
    pub type alias First = String
    pub type alias Last = String
    pub type alias Age = Int32

    pub enum Person {
        case Person({first = First, last = Last, age = Age})
    }

    instance Eq[Person] {
        pub def eq(px: Person, py: Person): Bool =
            let Person.Person(pa) = px;
            let Person.Person(pb) = py;
            pa.first == pb.first and pa.last == pb.last and pa.age == pb.age
    }

    instance ToString[Person] {
        pub def toString(p: Person): String =
            let Person.Person(pa) = p;
            "first: ${pa.first} last: ${pa.last} age: ${pa.age}"
    }

    pub def toString(person: { first = First, last = Last, age = Age } ): String =
        "first: ${person.first}, last: ${person.last}, age: ${person.age}"
}