package tiw.is.vols.livraison.functionnal.service;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tiw.is.vols.livraison.functionnal.db.ServeurManager;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class FlightBusinessTest extends ServeurManager {
    private final static Logger LOG = LoggerFactory.getLogger(FlightBusinessTest.class);
    private final String resource = "flightBusiness";

    @Test
    void closeShipment() {
        String command = "closeShipment";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "vol1");

        String result = (String) serveur.processRequest(resource, command, params);
        LOG.info(result);
        assertEquals("true", result);
    }

    @Test
    void getLostBaggages() {
        String command = "getLostBaggages";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "vol3");

        String result = (String) serveur.processRequest(resource, command, params);
        LOG.info(result);
        assertEquals("[{\"flightId\":\"vol3\",\"numero\":23,\"weight\":2.0,\"passenger\":\"Lost\"}]", result);
    }

    @Test
    void getUnclaimedBaggages() {
        String command = "getUnclaimedBaggages";
        Map<String, Object> params = new HashMap<>();
        params.put("id", "vol3");

        String result = (String) serveur.processRequest(resource, command, params);
        LOG.info(result);
        assertEquals("[{\"flightId\":\"vol3\",\"numero\":22,\"weight\":2.0,\"passenger\":\"Unclaimed\"}]", result);
    }
}
