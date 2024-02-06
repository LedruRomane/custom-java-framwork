package tiw.is.vols.livraison.functional.db;

import org.junit.jupiter.api.BeforeAll;
import tiw.is.server.Serveur;
import tiw.is.server.ServeurImpl;
import tiw.is.vols.livraison.DataAccessObjectTest;

import java.io.IOException;
import java.nio.file.Paths;

public class ServeurManager extends DataAccessObjectTest {

    public static Serveur serveur;

    @BeforeAll
    public static void setupServer() throws IOException {
        serveur = new ServeurImpl(Paths.get("src/main/resources/appConfiguration.json"));
    }
}
