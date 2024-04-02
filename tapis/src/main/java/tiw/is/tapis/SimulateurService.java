package tiw.is.tapis;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.FanoutExchange;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class SimulateurService {
    private static final Logger log = LoggerFactory.getLogger(SimulateurService.class);
    private static final ObjectMapper om = new ObjectMapper();
    private static final Random random = new Random();
    private final RabbitTemplate rabbitTemplate;
    private final FanoutExchange fanoutExchange;

    @Value("${tiw.is.capteurs}")
    private int nbCapteurs;


    public SimulateurService(RabbitTemplate rabbitTemplate, FanoutExchange fanoutExchange) {
        this.rabbitTemplate = rabbitTemplate;
        this.fanoutExchange = fanoutExchange;
    }

    public void simulateBagageTravel(Bagage bagage) {
        for (int i = 0; i < nbCapteurs; i++) {
            final int numero = i;
            new Thread(() -> {
                long sleepDuration = random.nextLong(4000L); //temps aléatoire entre 0 et 4s
                try {
                    Thread.sleep(sleepDuration);
                } catch (InterruptedException e) {
                    log.warn("Interrupted while waiting to send capteur, continuing...");
                }
                // On envoie M2
                Passage passage = new Passage(bagage, numero);
                try {
                    String message = om.writeValueAsString(passage);
                    log.info("Sending message M2 for passage: {}", message);
                    rabbitTemplate.convertAndSend("tiw.is.moniteur", message); // send M2
                } catch (JsonProcessingException e) {
                    log.error("Failed to serialize passage: {}", passage);
                }
            }).start();
        }
    }
}
