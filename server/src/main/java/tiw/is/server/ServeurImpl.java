package tiw.is.server;

import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import org.picocontainer.MutablePicoContainer;
import org.picocontainer.PicoBuilder;
import org.picocontainer.injectors.ConstructorInjection;
import org.picocontainer.lifecycle.StartableLifecycleStrategy;
import org.picocontainer.monitors.NullComponentMonitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tiw.is.server.service.ComponentLoader;
import tiw.is.server.service.IDispatcher;
import tiw.is.server.utils.FixturesManager;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

public class ServeurImpl implements Serveur {

    private final MutablePicoContainer picoContainer;
    private final Logger log = LoggerFactory.getLogger(ServeurImpl.class);


    /**
     * Constructor Server, implement container and provide services & components.
     */
    public ServeurImpl(Path pathConfigurationFile) throws IOException {

        this.picoContainer = new PicoBuilder(new ConstructorInjection())
                .withCaching()
                .withLifecycle(new StartableLifecycleStrategy(new NullComponentMonitor()))
                .build();

        InputStream serverStream = ServeurImpl.class.getResourceAsStream("/serverRootConfiguration.json");
        String serverContent = new String(serverStream.readAllBytes(), StandardCharsets.UTF_8);
        String configContent = new String(Files.readAllBytes(pathConfigurationFile));

        loadFromFile(configContent);
        loadFromFile(serverContent);


        // Functional tests database's fixture manager.
        picoContainer.addComponent(FixturesManager.class);

        log.info("---------------------------  [SERVER INFO: START]  ---------------------------");
        picoContainer.start();
    }

    private void loadFromFile(String path) {
        String app = "application-config";

        try (JsonReader reader = Json.createReader(new StringReader(path))) {
            JsonObject jsonContent = reader.readObject();
            JsonObject appConfig = jsonContent.getJsonObject(app);

            for (String key : appConfig.keySet()) {
                loadComponents(appConfig.getJsonArray(key));
            }
        }
    }

    /**
     * For all components, add Components to picoContainer.
     *
     * @param array JsonArray from configuration file.
     */
    private void loadComponents(JsonArray array) {
        array.forEach(component -> ComponentLoader.load((JsonObject) component, this.picoContainer));
    }

    /**
     * Unique endpoint simulate API queries or mutations, just like GraphQL.
     *
     * @param resource String simulate a path like '/companie'.
     * @param command  String simulate a method get, create, delete, update like a graphQL keyword.
     * @param params   Object (json) simulate the body sent
     * @return serialized Object
     */
    public Object processRequest(String resource, String command, Map<String, Object> params) {
        try {
            IDispatcher dispatcher = picoContainer.getComponent(IDispatcher.class);
            return dispatcher.dispatch(resource, command, params);

        } catch (Exception e) {
            log.error(e.getMessage(), e);
            return "KO"; // Simulate an http error return.
        }
    }
    public MutablePicoContainer getContainer() {
        return picoContainer;
    }
}
