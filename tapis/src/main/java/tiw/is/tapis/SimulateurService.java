package tiw.is.tapis;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
    @Value("${tiw.is.capteurs}")
    private int nbCapteurs;


    public SimulateurService(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    public void simulateBagageTravel(Bagage bagage) {
        for (int i = 0; i < nbCapteurs; i++) {
            final int numero = i;
            new Thread(() -> {
                long sleepDuration = random.nextLong(5000L); //temps aléatoire entre 0 et 5s
                try {
                    Thread.sleep(sleepDuration);
                } catch (InterruptedException e) {
                    log.warn("Interrupted while waiting to send capteur, continuing...");
                }
                // On envoie M2
                Passage passage = new Passage(bagage, numero);
                /* TODO: section 3 */
            }).start();
        }
    }
}
