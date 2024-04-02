package tiw.is.moniteur;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class ArriveeReceiver {

    private final BagageManagerService bagageManagerService;
    private static final Logger log = LoggerFactory.getLogger(ArriveeReceiver.class);


    public ArriveeReceiver(BagageManagerService bagageManagerService) {
        this.bagageManagerService = bagageManagerService;
    }

    @RabbitListener(queues = "#{anonymousQueue.name}")
    public void receive(byte[] message) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            Bagage bagage = objectMapper.readValue(message, Bagage.class);
            log.info("Received bagage from M1 {}: " + bagage);
            bagageManagerService.registerBagage(bagage);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}