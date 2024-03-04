package tiw.is.server.framework.web;

import jakarta.servlet.Servlet;
import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;


public class HttpEndpoint {

    private static final int DELAY = 30;
    private static final Logger log = LoggerFactory.getLogger(HttpEndpoint.class);
    private static HttpEndpoint instance;
    private final Tomcat tomcat;
    private int currentBatchId = 0;
    private boolean started = false;
    private final Context ctx;

    /**
     * Creates and configure a server containing a tomcat instance as well as
     * properly configured Servlets
     */
    private HttpEndpoint() {
        tomcat = new Tomcat();
        tomcat.setPort(8080);
        tomcat.getConnector();

        // on utilise le répertoire courant comme répertoire de travail
        ctx = tomcat.addContext("", new File(".").getAbsolutePath());
    }

    public static HttpEndpoint getInstance() {
        if (instance == null) {
            instance = new HttpEndpoint();
        }
        return instance;
    }

    /**
     * Starts the tomcat server
     *
     * @throws LifecycleException si un problème survient avec la gestion de Tomcat
     */
    public void start() throws LifecycleException {
        log.info("Starting tomcat...");
        tomcat.start();
        log.info("Tomcat started");
    }

    /**
     * Starts the server if it isn't already running and updates the
     * currentBatchId.
     *
     * @throws LifecycleException si un problème survient avec la gestion de Tomcat
     */
    public synchronized void startBatch() throws LifecycleException {
        currentBatchId++;
        if (!started) {
            log.info("Starting tomcat in batch mode...");
            tomcat.start();
            log.info("Tomcat started in batch mode");
            started=true;
        }
    }

    /**
     * Stops the tomcat server
     *
     * @throws LifecycleException si un problème survient avec la gestion de Tomcat
     */
    public void stop() throws LifecycleException {
        log.info("Stopping tomcat...");
        tomcat.stop();
        log.info("Tomcat stopped...");
    }

    /**
     * Stops the server after DELAY seconds unless another batch started in between.
     */
    public synchronized void stopBatch() {
        final int lastBatch = currentBatchId;
        new Thread(() -> {
            try {
                Thread.sleep(DELAY * 1000L);
                if (lastBatch == currentBatchId) {
                    log.info("Stopping tomcat in batch mode...");
                    tomcat.stop();
                    log.info("Tomcat stopped in batch mode");
                    started=false;
                }
            } catch (LifecycleException | InterruptedException e) {
                log.warn("Thread stoppant le serveur interrompu");
                Thread.currentThread().interrupt();
            }
        }).start();
    }

    /**
     * Awaits for the server to be stopped
     */
    public void await() {
        log.info("Awaiting Tomcat to stop ...");
        tomcat.getServer().await();
    }

    /**
     * Adds to Tomcat's context (aka deploys) a new servlet
     * @param servlet the servlet to be deployed
     * @param path the servlet's path after Tomcat's context base path
     */
    public void addServlet(Servlet servlet, String path) {
        //TODO test what happens if the servlet is already deployed, if Tomcat is already started, etc.
        Tomcat.addServlet(ctx, servlet.getClass().getSimpleName(), servlet);
        ctx.addServletMappingDecoded(path, servlet.getClass().getSimpleName());
    }
}
