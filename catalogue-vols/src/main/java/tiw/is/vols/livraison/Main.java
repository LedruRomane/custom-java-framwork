package tiw.is.vols.livraison;

import tiw.is.server.ServeurImpl;
import tiw.is.server.framework.web.WebServer;

import java.net.URL;
import java.nio.file.Paths;

public class Main {
    public static void main(String[] args) throws Exception {
        URL url = Main.class.getResource("/appConfiguration.json");

        WebServer webServer = new WebServer(new ServeurImpl(Paths.get(url.getPath())));
        webServer.start();
    }
}
