use Assert.eq

@Test
def testInterop(): Bool \ IO =
    import new java.io.File(String): ##java.io.File \ IO as newFile;
    import java.io.File.exists(): Bool \ IO as fileExists;

    let file = newFile("interop.txt");
    let result = fileExists(file);

    eq( true, result)