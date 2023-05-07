use Assert.eq

@Test
def testInterop(): Bool = // Revisit this test with newer versions of Flix.
/*
    import java.nio.file.Path; // The is not possible in Flix at this time.
    import static java.nio.file.Path.of(String): Path \ IO;
    import static java.nio.file.Files.writeString(Path, String): Path \ IO;
    import static java.nio.file.Files.exists(Path): Path \ IO;

    let path = Path.of("interop.txt");
    let content  = "Hello, Flix! This is Java!";
    Files.writeString(path, content);

    eq( true, Files.exists(path) )
*/
    true