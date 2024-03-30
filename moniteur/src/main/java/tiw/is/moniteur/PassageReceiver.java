package tiw.is.moniteur;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class PassageReceiver {
    private final BagageManagerService bagageManagerService;
    private static final Logger log = LoggerFactory.getLogger(ArriveeReceiver.class);



    public PassageReceiver(BagageManagerService bagageManagerService) {
        this.bagageManagerService = bagageManagerService;
    }

    @RabbitListener(queues = "tiw.is.moniteur")
    public void receive(String message) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            Passage passage = objectMapper.readValue(message, Passage.class);
            log.info("Received passage from M2 {}: " + passage);
            bagageManagerService.passage(passage);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
