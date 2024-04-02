package tiw.is.tapis;

import org.springframework.amqp.core.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitConfig {

    @Bean
    public FanoutExchange fanout() {
        return new FanoutExchange("tiw.is.arrivee.fanout");
    }

    @Bean
    public Queue anonymousQueue() {
        return new AnonymousQueue();
    }

    @Bean
    public Queue moniteurQueue() {
        return new Queue("tiw.is.moniteur");
    }

    @Bean
    public Binding binding(FanoutExchange fanout, Queue anonymousQueue) {
        return BindingBuilder.bind(anonymousQueue).to(fanout);
    }
}