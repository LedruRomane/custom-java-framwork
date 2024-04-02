package tiw.is.arrivee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.Collection;

@Service
public class VolService {
    private static final Logger log = LoggerFactory.getLogger(VolService.class);
    private final WebClient webClient;

    public VolService(WebClient.Builder webClientBuilder) {
        this.webClient = webClientBuilder.baseUrl("http://localhost:8080").build();
    }

    public Vol getVol(String volId) {
        log.info("GET /vol/{} on catalogue", volId);
        return this.webClient.get()
                .uri("/flight?id=" + volId)
                .retrieve()
                .bodyToMono(Vol.class)
                .block();
    }

    public Collection<Bagage> getBaggages(String volId) {
        log.info("GET /flight/bagages/{} on catalogue", volId);
        return this.webClient.get()
                .uri("/flight/baggages?id=" + volId)
                .retrieve()
                .bodyToFlux(Bagage.class)
                .collectList()
                .block();
    }
}