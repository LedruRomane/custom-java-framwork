package tiw.is.tapis;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
@RabbitListener(queues = "tapis")
public class BagageFromArriveeReceiver {
    private static final ObjectMapper om = new ObjectMapper();
    private static final Logger log = LoggerFactory.getLogger(BagageFromArriveeReceiver.class);

    @RabbitHandler
    public void receiveBagage(String message) {
        try {
            Bagage bagage = om.readValue(message, Bagage.class);
            log.info("Received bagage {}", bagage);
        } catch (IOException e) {
            log.error("Failed to read bagage from the following payload: {}", message);
        }
    }

    @RabbitHandler
    public void receiveBagage(byte[] data) {
        log.info("Received message as bytes");
        receiveBagage(new String(data));
    }
}
