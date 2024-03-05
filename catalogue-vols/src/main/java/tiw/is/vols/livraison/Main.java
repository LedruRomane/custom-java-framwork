package tiw.is.vols.livraison;

import tiw.is.server.ServeurImpl;
import tiw.is.server.framework.web.WebServer;
import tiw.is.vols.livraison.handler.resource.baggage.CreateBaggageCommandHandler_Servlet;
import tiw.is.vols.livraison.handler.resource.baggage.DeleteBaggageCommandHandler_Servlet;
import tiw.is.vols.livraison.handler.resource.baggage.GetBaggageCommandHandler_Servlet;
import tiw.is.vols.livraison.handler.resource.baggage.GetBaggagesCommandHandler_Servlet;

import java.net.URL;
import java.nio.file.Paths;
import java.util.Set;

public class Main {
    public static void main(String[] args) throws Exception {
        URL url = Main.class.getResource("/appConfiguration.json");

        WebServer webServer = new WebServer(new ServeurImpl(Paths.get(url.getPath())));
        webServer.start();
    }
}
