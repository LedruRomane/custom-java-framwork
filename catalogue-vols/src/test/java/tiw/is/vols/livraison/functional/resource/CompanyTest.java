package tiw.is.vols.livraison.functional.resource;

import com.fasterxml.jackson.core.JsonProcessingException;
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


public class CompanyTest extends ServeurManager {
    private final static Logger LOG = LoggerFactory.getLogger(CompanyTest.class);
    private final Map<String, Object> voidParams = new HashMap<>();
    private final String resource = "company";
    private final String snapShotPath = "src/test/java/tiw/is/vols/livraison/functional/resource/snapshot/companyTest/";
    private final ObjectMapper mapper = new ObjectMapper();


    @Test
    void createCompany() throws IOException {
        String command = "create";
        Map<String, Object> params = new HashMap<>();
        String newID = "c-new";
        params.put("id", newID);

        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "createCompanyTestSnapshot.json"))));
        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));
        LOG.info(result.asText());

        assertEquals(snapshot, result);
    }

    @Test
    void getCompany() throws IOException {
        String command = "get";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "c-getCompany()-0");

        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, params));
        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "getCompanyTestSnapshot.json"))));

        LOG.info(result.asText());
        assertEquals(snapshot, result);
    }

    @Test
    void getCompanies() throws IOException {
        String command = "getAll";

        JsonNode result = mapper.readTree((String) serveur.processRequest(resource, command, voidParams));
        JsonNode snapshot = mapper.readTree(new String(Files.readAllBytes(Paths.get(snapShotPath + "getCompaniesTestSnapshot.json"))));

        LOG.info(result.asText());
        assertEquals(snapshot, result);
    }

    @Test
    void deleteCompany() throws JsonProcessingException {
        String command = "delete";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "c-deleteCompany()-0");

        String result = (String) serveur.processRequest(resource, command, params);
        LOG.info(result);

        assertEquals("true", result);
    }
}