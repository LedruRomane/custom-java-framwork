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

public class BaggageBusinessTest extends ServeurManager {

    private final static Logger LOG = LoggerFactory.getLogger(BaggageBusinessTest.class);
    private final String resource = "baggagesBusiness";
    private final String snapShotPath = "src/test/java/tiw/is/vols/livraison/functional/service/snapshot/baggageBusinessTest/";
    private final ObjectMapper mapper = new ObjectMapper();


    @Test
    void deliver() throws IOException {
        String command = "deliver";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-deliver()-5-5");
        params.put("num", 1);

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "deliverTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));
        LOG.info(result.asText());

        assertEquals(snapshot, result);
    }

    @Test
    void retrieval() throws IOException {
        String command = "retrieval";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "v-retrieval()-0-0");
        params.put("num", 1);

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "retrievalTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));
        LOG.info(result.asText());

        assertEquals(snapshot, result);
    }
}
