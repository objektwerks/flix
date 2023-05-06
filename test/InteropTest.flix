use Assert.eq

@Test
def testInterop(): Bool \ IO =
    import java.nio.file.Path;
    import static java.nio.file.Path.of(String): Path \ IO;
    import static java.nio.file.Files.writeString(Path, String): Path \ IO;
    import static java.nio.file.Files.exists(Path): Path \ IO;

    let path = Path.of("interop.txt");
    let content  = "Hello, Flix! This is Java!";
    Files.writeString(path, content);

    eq( true, Files.exists(path) )