package tiw.is.vols.livraison.functional.service;

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

public class FlightBusinessTest extends ServeurManager {
    private final static Logger LOG = LoggerFactory.getLogger(FlightBusinessTest.class);
    private final String resource = "flightBusiness";
    private final String snapShotPath = "src/test/java/tiw/is/vols/livraison/functional/service/snapshot/flightBusinessTest/";
    private final ObjectMapper mapper = new ObjectMapper();

    @Test
    void closeShipment() {
        String command = "closeShipment";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-closeShipment()-1-0");

        String result = (String) serveur.processRequest(resource, command, params);
        LOG.info(result);
        assertEquals("true", result);
    }

    @Test
    void getLostBaggages() throws IOException {
        String command = "getLostBaggages";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-getLostBaggages()-2-0");

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "getLostBaggagesTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));

        LOG.info(result.asText());
        assertEquals(snapshot, result);
    }

    @Test
    void getUnclaimedBaggages() throws IOException {
        String command = "getUnclaimedBaggages";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-getUnclaimedBaggages()-2-0");

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "getUnclaimedBaggagesTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));
        LOG.info(result.asText());

        assertEquals(snapshot, result);
    }
}
