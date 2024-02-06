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

public class FlightTest extends ServeurManager {
    private final static Logger LOG = LoggerFactory.getLogger(FlightTest.class);
    private final Map<String, Object> voidParams = new HashMap<>();
    private final String snapShotPath = "src/test/java/tiw/is/vols/livraison/functional/resource/snapshot/flightTest/";

    private final String resource = "flight";
    private final ObjectMapper mapper = new ObjectMapper();

    @Test
    void createFlight() throws IOException {
        String command = "create";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-new");
        params.put("companyId", "c-createFlight()-0");
        params.put("pointLivraisonBagages", "Guéret");

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "createFlightTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));
        LOG.info(result.asText());

        assertEquals(snapshot, result);
    }

    @Test
    void updateFlight() throws IOException {
        String command = "update";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-updateFlight()-0-0");
        params.put("companyId", "c-updateFlight()-0");
        params.put("pointLivraisonBagages", "Pétaouchnok");

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "updateFlightTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));
        LOG.info(result.asText());
        assertEquals(snapshot, result);
    }

    @Test
    void getFlights() throws IOException {
        String command = "getAll";

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "getFlightsTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, voidParams));
        LOG.info(result.asText());
        assertEquals(snapshot, result);
    }

    @Test
    void getFlight() throws IOException {
        String command = "get";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-getFlight()-0-0");

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "getFlightTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));
        LOG.info(result.asText());

        assertEquals(snapshot, result);
    }

    @Test
    void deleteFlight() throws IOException {
        String command = "delete";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-deleteFlight()-0-0");

        String result =(String) serveur.processRequest(resource, command, params);
        LOG.info(result);
        assertEquals("true", result);
    }
}
