package tiw.is.moniteur;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableRabbit
public class MoniteurApplication {

	public static void main(String[] args) {
		SpringApplication.run(MoniteurApplication.class, args);
	}

}
