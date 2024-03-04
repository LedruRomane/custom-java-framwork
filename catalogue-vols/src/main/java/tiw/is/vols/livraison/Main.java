package tiw.is.vols.livraison;

import tiw.is.server.ServeurImpl;
import tiw.is.server.framework.web.WebServer;
import tiw.is.vols.livraison.servlet.CreateBaggageCommandHandlerServlet_Component;
import tiw.is.vols.livraison.servlet.GetBaggageCommandHandlerServlet_Component;
import tiw.is.vols.livraison.servlet.GetBaggagesCommandHandlerServlet_Component;

import java.net.URL;
import java.nio.file.Paths;
import java.util.Set;

public class Main {
    public static void main(String[] args) throws Exception {
        URL url = Main.class.getResource("/appConfiguration.json");


        WebServer webServer = new WebServer(
                new ServeurImpl(Paths.get(url.getPath())));
        webServer.addServlets(Set.of(
                GetBaggagesCommandHandlerServlet_Component.class,
                GetBaggageCommandHandlerServlet_Component.class,
                CreateBaggageCommandHandlerServlet_Component.class
        ));
        webServer.start();
    }
}
