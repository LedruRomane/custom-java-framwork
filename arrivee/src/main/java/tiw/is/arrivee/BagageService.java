package tiw.is.arrivee;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.FanoutExchange;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Collection;

@Component
public class BagageService {
    private static final ObjectMapper om = new ObjectMapper();
    private static final Logger log = LoggerFactory.getLogger(BagageService.class);
    private final RabbitTemplate rabbitTemplate;

    private final FanoutExchange fanoutExchange;


    public BagageService(RabbitTemplate rabbitTemplate, FanoutExchange fanoutExchange) {
        this.rabbitTemplate = rabbitTemplate;
        this.fanoutExchange = fanoutExchange;
    }

    public void sendBagages(Collection<Bagage> baggages) {
        for (Bagage bagage : baggages) {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            try {
                om.writeValue(baos, bagage);
            } catch (IOException e) {
                log.error("Failed to write bagage {}: {}", bagage, e);
            }
            var data = baos.toByteArray();
            log.info("Sending message M1 for bagage {} ...", bagage);
            rabbitTemplate.convertAndSend(fanoutExchange.getName(), "", data); // M1 (dépose)
        }
    }
}
