package tiw.is.arrivee;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

@Component
public class BagageService {
    private static final ObjectMapper om = new ObjectMapper();
    private static final Logger log = LoggerFactory.getLogger(BagageService.class);
    private final RabbitTemplate rabbitTemplate;

    public BagageService(RabbitTemplate rabbitTemplate) {
        this.rabbitTemplate = rabbitTemplate;
    }

    public void sendBagages(Vol vol) {
        /*for (int i = 0; i < vol.nbBagages(); i++) {
            Bagage bagage = vol.getBagage(i);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            try {
                om.writeValue(baos, bagage);
            } catch (IOException e) {
                log.error("Failed to write bagage {}: {}", bagage, e);
            }
            var data = baos.toByteArray();
            log.info("Sending message M1 for bagage {} ...", bagage);
            *//* TODO: section 1 & section 2 *//*
        }*/
    }
}
