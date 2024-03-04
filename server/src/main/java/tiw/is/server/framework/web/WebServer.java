package tiw.is.server.framework.web;

import jakarta.servlet.http.HttpServlet;
import org.apache.catalina.LifecycleException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tiw.is.server.Serveur;

import java.util.Set;

public class WebServer {
    private static final Logger logger = LoggerFactory.getLogger(WebServer.class);
    private final HttpEndpoint endpoint = HttpEndpoint.getInstance();
    private final Serveur serveur;

    public WebServer(Serveur serveur) {
        this.serveur = serveur;
        logger.info("WebServer initiated.");
    }

    public void start() throws LifecycleException {
        endpoint.startBatch();
    }

    public void stop() {
        endpoint.stopBatch();
    }

    public void addServlets(Set<Class<?>> servlets) {
        logger.info("AddServlets called with " + servlets.size() + " arguments.");
        for(Class<?> c: servlets) {
            logger.info("Adding servlet " + c);
            endpoint.addServlet((HttpServlet) serveur
                    .getContainer()
                    .getComponent(c), "/" + c.getAnnotation(annotations.Servlet.class).path());
        }
    }


}
