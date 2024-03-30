package tiw.is.moniteur;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Service
public class BagageManagerService {
    private static final Logger log = LoggerFactory.getLogger(BagageManagerService.class);
    @Value("${tiw.is.capteurs}")
    private int nbCapteurs;

    private final WebClient webClient;

    private final Map<Integer, Set<Integer>> bagageCapteurs = new HashMap<>();
    private final Map<Integer, Boolean> bagageDelivered = new HashMap<>();

    public BagageManagerService(WebClient.Builder webClientBuilder) {
        this.webClient = webClientBuilder.baseUrl("http://localhost:8080").build();
    }

    public void registerBagage(Bagage bagage) {
        bagageCapteurs.putIfAbsent(bagage.numero(), new HashSet<>());
    }

    public void passage(Passage passage) {
        int bagageId = passage.bagage().numero();
        bagageCapteurs.get(bagageId).add(passage.capteur());

        if (bagageCapteurs.get(bagageId).size() == nbCapteurs) {
            log.info("[PASSAGE ALL CHECK] Bagage " + bagageId + " has passed all capteurs, marking as delivered.");
            bagageDelivered.put(bagageId, true);
            log.info("POST /baggage/deliver/ on catalogue for flight " + passage.bagage().flightId() + " and baggage " + bagageId);
            this.webClient.post()
                    .uri("/baggage/deliver")
                    .bodyValue("{\"id\": \"" + passage.bagage().flightId() + "\",\"num\":" + bagageId + "}\n")
                    .retrieve()
                    .bodyToMono(Void.class)
                    .block();
        }

        if(bagageDelivered.size() == bagageCapteurs.size()){
            log.info("All bagages have been delivered");
            log.info("POST /flight/close on catalogue for flight " + passage.bagage().flightId());
            this.webClient.post()
                    .uri("/flight/close")
                    .bodyValue("{\"id\": \"" + passage.bagage().flightId() + "\"}\n")
                    .retrieve()
                    .bodyToMono(Void.class)
                    .block();
        }
    }
}
