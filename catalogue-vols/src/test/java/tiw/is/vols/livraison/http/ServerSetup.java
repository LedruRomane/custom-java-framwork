package tiw.is.vols.livraison.http;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import tiw.is.server.ServeurImpl;
import tiw.is.server.framework.web.WebServer;

import java.nio.file.Paths;

public class ServerSetup {

    private static WebServer webServer;

    @BeforeAll
    public static void setupServer() {
        try {
            webServer = new WebServer(new ServeurImpl(Paths.get("src/test/java/resources/appConfiguration.json")));
            webServer.start();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @AfterAll
    public static void tearDownServer() {
        webServer.stop();
    }

    public static WebServer getWebServer() {
        return webServer;
    }
}