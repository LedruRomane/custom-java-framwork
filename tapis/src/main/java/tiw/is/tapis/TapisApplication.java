package tiw.is.tapis;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableRabbit
public class TapisApplication {

    public static void main(String[] args) {
        SpringApplication.run(TapisApplication.class, args);
    }

}
