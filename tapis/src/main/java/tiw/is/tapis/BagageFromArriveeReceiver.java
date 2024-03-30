package tiw.is.tapis;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class BagageFromArriveeReceiver {
    private static final ObjectMapper om = new ObjectMapper();
    private static final Logger log = LoggerFactory.getLogger(BagageFromArriveeReceiver.class);
    private final SimulateurService simulateurService;

    public BagageFromArriveeReceiver(SimulateurService simulateurService) {
        this.simulateurService = simulateurService;
    }

    public void receiveBagage(String message) {
        try {
            Bagage bagage = om.readValue(message, Bagage.class);
            log.info("Received bagage from M1 {}:", bagage);
            simulateurService.simulateBagageTravel(bagage);
        } catch (IOException e) {
            log.error("Failed to read bagage from the following payload: {}", message);
        }
    }

    @RabbitListener(queues= "#{anonymousQueue.name}")
    public void receive(byte[] data) {
        receiveBagage(new String(data));
    }
}
