package tiw.is.vols.livraison.http;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tiw.is.server.ServeurImpl;
import tiw.is.server.framework.web.WebServer;
import tiw.is.vols.livraison.DataAccessObjectTest;
import tiw.is.vols.livraison.dto.BaggageDTO;
import tiw.is.vols.livraison.model.Baggage;
import tiw.is.vols.livraison.model.Company;
import tiw.is.vols.livraison.model.Flight;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.Paths;

import static org.junit.jupiter.api.Assertions.*;

public class HttpEndpointTest extends DataAccessObjectTest {
    private static final Logger logger = LoggerFactory.getLogger(HttpEndpointTest.class);
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final HttpClient client = HttpClient.newHttpClient();

    @BeforeAll
    public static void setupClass() {
        DataAccessObjectTest.setupClass();
        ServerSetup.setupServer();
    }

    @AfterAll
    public static void tearDownClass() {
        DataAccessObjectTest.tearDownClass();
        ServerSetup.tearDownServer();
    }

    @BeforeEach
    public void setup(TestInfo testInfo) {
        super.setup(testInfo);
        testName = testInfo.getDisplayName();
    }

    /**
     * GET ALL Companies
     */
    @Test
    public void CompagniesServlet() throws Exception {
        try {

            HttpRequest request = null;
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/companies"))
                        .GET()
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            Company[] compagniesResp = objectMapper.readValue(response.body(), Company[].class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertEquals(8, compagniesResp.length);
        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * Test complet servlets compagnie
     */
    @Test
    public void CompagnieServlet() {
        try {

            HttpRequest request;
            Company c = new Company("CUSTOM-COMPANY-ID");

            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/company/create"))
                        .POST(HttpRequest.BodyPublishers.ofString("{\"id\":\"CUSTOM-COMPANY-ID\"}"))
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(200, response.statusCode());
            } catch (URISyntaxException ignored) {}

            // Vérification de l'existence de la compagnie
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/company?id=" + c.getId()))
                        .GET()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(200, response.statusCode());

                Company compagnieResp = objectMapper.readValue(response.body(), Company.class);
                logger.info(response.body());
                assertEquals("CUSTOM-COMPANY-ID", compagnieResp.getId());
            } catch (URISyntaxException ignored) {}

            // Modification de l'id de la compagnie
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/company"))
                        .PUT(HttpRequest.BodyPublishers.ofString("{\"id\":\"retestCompany\"}"))
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(405, response.statusCode()); // Not allowed
            } catch (URISyntaxException ignored) {}

            // Suppression de la compagnie
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/company/delete?id=" + c.getId()))
                        .DELETE()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(200, response.statusCode());
            } catch (URISyntaxException ignored) {}

            // Vérification de la non-existence de la compagnie (toute erreur renvoie un code 400)
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/company?id=" + c.getId()))
                        .GET()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(400, response.statusCode());
            } catch (URISyntaxException ignored) {}

        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * GET ALL Flights
     */
    @Test
    public void FlightsServlet() {
        try {

            HttpRequest request = null;
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flights"))
                        .GET()
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            Flight[] flights = objectMapper.readValue(response.body(), Flight[].class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertEquals(36, flights.length);
        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * Test complet servlets Flight
     */
    @Test
    public void FlightServlet() {
        try {

            HttpRequest request;
            Flight c = new Flight("CUSTOM-FLIGHT-ID", companies[0], "PARIS");
            String json = "{\"id\":\"" + c.getId() + "\",\"companyID\":\"" + c.getCompany().getId() + "\",\"pointLivraisonBagages\":\"" + c.getPointLivraisonBagages() + "\"}";

            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight/create"))
                        .POST(HttpRequest.BodyPublishers.ofString(json))
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(200, response.statusCode());
            } catch (URISyntaxException ignored) {}

            // Vérification de l'existence du vol
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight?id=" + c.getId()))
                        .GET()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(200, response.statusCode());

                Flight resp = objectMapper.readValue(response.body(), Flight.class);
                logger.info(response.body());
                assertEquals("CUSTOM-FLIGHT-ID", resp.getId());
            } catch (URISyntaxException ignored) {}

            // Modification de l'id du vol
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight"))
                        .PUT(HttpRequest.BodyPublishers.ofString("{\"id\":\"retest\"}"))
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(405, response.statusCode()); // Not allowed
            } catch (URISyntaxException ignored) {}

            // Suppression du vol
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight/delete?id=" + c.getId()))
                        .DELETE()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(200, response.statusCode());
            } catch (URISyntaxException ignored) {}

            // Vérification de la non-existence du vol (toute erreur renvoie un code 400)
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight?id=" + c.getId()))
                        .GET()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(400, response.statusCode());
            } catch (URISyntaxException ignored) {}

        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * GET ALL Baggages
     */
    @Test
    public void BaggagesServlet() {
        try {

            HttpRequest request = null;
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/baggages"))
                        .GET()
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            BaggageDTO[] baggages = objectMapper.readValue(response.body(), BaggageDTO[].class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertEquals(666, baggages.length);
        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * Test complet servlets Baggage
     */
    @Test
    public void BaggageServlet() {
        try {

            HttpRequest request;
            String json = "{\"id\":\"v-BaggageServlet()-0-0\",\"weight\":\"9\",\"passenger\":\"John Doe\"}";
            String num = "";
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/baggage/create"))
                        .POST(HttpRequest.BodyPublishers.ofString(json))
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(200, response.statusCode());
                num = response.body().split("\"numero\":")[1].split(",")[0];
            } catch (URISyntaxException ignored) {}


            // Vérification de l'existence du baggage
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/baggage?id=v-BaggageServlet()-0-0&num=" + num))
                        .GET()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(200, response.statusCode());

                BaggageDTO resp = objectMapper.readValue(response.body(), BaggageDTO.class);
                logger.info(response.body());
                assertEquals("v-BaggageServlet()-0-0", resp.flightId());
                assertEquals(Integer.parseInt(num), resp.numero());
            } catch (URISyntaxException ignored) {}

            // Suppression du vol
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/baggage/delete?id=v-BaggageServlet()-0-0&num=" + num))
                        .DELETE()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(200, response.statusCode());
            } catch (URISyntaxException ignored) {}

            // Vérification de la non-existence du vol (toute erreur renvoie un code 400)
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/baggage?id=v-BaggageServlet()-0-0&num=" + num))
                        .GET()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
                assertEquals(400, response.statusCode());
            } catch (URISyntaxException ignored) {}

        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * Close shipment
     */
    @Test
    public void CloseShipmentServlet() {
        try {

            HttpRequest request = null;
            String json = "{\"id\":\"v-CloseShipmentServlet()-4-1\"}";

            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight/close"))
                        .POST(HttpRequest.BodyPublishers.ofString(json))
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            Boolean resp = objectMapper.readValue(response.body(), Boolean.class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertTrue(resp);
        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * Mark baggage as delivered
     */
    @Test
    public void MarkBaggageDeliveredServlet() {
        try {

            HttpRequest request = null;
            String json = "{\"id\":\"v-MarkBaggageDeliveredServlet()-4-1\", \"num\":2}";

            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/baggage/deliver"))
                        .POST(HttpRequest.BodyPublishers.ofString(json))
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            BaggageDTO resp = objectMapper.readValue(response.body(), BaggageDTO.class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertEquals("v-MarkBaggageDeliveredServlet()-4-1", resp.flightId());
            assertEquals(2, resp.numero());
        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * Get unclaimed baggages from closed shipment
     */
    @Test
    public void GetUnclaimedBaggagesServlet() {
        try {

            HttpRequest request = null;
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight/unclaimedBaggages?id=v-GetUnclaimedBaggagesServlet()-3-3"))
                        .GET()
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            BaggageDTO[] resp = objectMapper.readValue(response.body(), BaggageDTO[].class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertEquals(3, resp.length);
        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * Mark baggage as retrieval
     */
    @Test
    public void MarkBaggageRetrievalServlet() {
        // get unclaimed baggages
        Integer unclaimed = 0;
        try {

            HttpRequest request = null;
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight/unclaimedBaggages?id=v-MarkBaggageRetrievalServlet()-3-3"))
                        .GET()
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            BaggageDTO[] resp = objectMapper.readValue(response.body(), BaggageDTO[].class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertEquals(3, resp.length);
            unclaimed = resp.length;
        } catch(Exception e) {
            fail(e.getMessage());
        }

        try {

            HttpRequest request = null;
            String json = "{\"id\":\"v-MarkBaggageRetrievalServlet()-3-3\", \"num\":2}";

            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/baggage/retrieval"))
                        .POST(HttpRequest.BodyPublishers.ofString(json))
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            BaggageDTO resp = objectMapper.readValue(response.body(), BaggageDTO.class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertEquals("v-MarkBaggageRetrievalServlet()-3-3", resp.flightId());
            assertEquals(2, resp.numero());
        } catch(Exception e) {
            fail(e.getMessage());
        }

        //check if unclaimed baggages are now 2
        try {

            HttpRequest request = null;
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight/unclaimedBaggages?id=v-MarkBaggageRetrievalServlet()-3-3"))
                        .GET()
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            BaggageDTO[] resp = objectMapper.readValue(response.body(), BaggageDTO[].class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertEquals(unclaimed-1, resp.length);// one less unclaimed baggage
        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

    /**
     * Get Lost Baggages
     */
    @Test
    public void GetLostBaggagesServlet() {
        try {

            HttpRequest request = null;
            try {
                request = HttpRequest.newBuilder()
                        .uri(new URI("http://127.0.0.1:8080/flight/lostBaggages?id=v-GetLostBaggagesServlet()-3-3"))
                        .GET()
                        .build();
            } catch (URISyntaxException ignored) {}
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

            BaggageDTO[] resp = objectMapper.readValue(response.body(), BaggageDTO[].class);
            logger.info(response.body());
            assertEquals(200, response.statusCode());
            assertEquals(5, resp.length);
        } catch(Exception e) {
            fail(e.getMessage());
        }
    }

}