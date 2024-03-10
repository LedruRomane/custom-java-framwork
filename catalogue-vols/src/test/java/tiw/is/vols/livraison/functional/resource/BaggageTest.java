package tiw.is.vols.livraison.functional.resource;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tiw.is.vols.livraison.functional.db.ServeurManager;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

class BaggageTest extends ServeurManager {
    private final static Logger LOG = LoggerFactory.getLogger(BaggageTest.class);
    private final String snapShotPath = "src/test/java/tiw/is/vols/livraison/functional/resource/snapshot/baggageTest/";
    private final Map<String, Object> voidParams = new HashMap<>();
    private final String resource = "baggage";
    private final ObjectMapper mapper = new ObjectMapper();


    @Test
    void createBaggage() throws IOException {
        String command = "create";

        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-createBaggage()-0-0");
        params.put("weight", "8");
        params.put("passenger", "Muse");

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "createBaggageTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));

        LOG.info(result.asText());

        assertEquals(snapshot, result);
    }

    @Test
    void getBaggages() throws IOException {
        String command = "getAll";

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "getBaggagesTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, voidParams));
        LOG.info(result.asText());

        assertEquals(snapshot, result);
    }

    @Test
    void getBaggage() throws IOException {
        String command = "get";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-getBaggage()-0-0");
        params.put("num", 1);

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "getBaggageTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));
        LOG.info(result.asText());

        assertEquals(snapshot, result);
    }

    @Test
    void deleteBaggage() {
        String command = "delete";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-deleteBaggage()-1-0");
        params.put("num", 2);

        String result = (String) serveur.processRequest(resource, command, params);

        LOG.info(result);
        assertEquals("true", result);
    }
}
