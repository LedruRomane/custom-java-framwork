package tiw.is.moniteur;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class BagageManagerService {
    private static final Logger log = LoggerFactory.getLogger(BagageManagerService.class);
    @Value("${tiw.is.capteurs}")
    private int nbCapteurs;

    public void registerBagage(Bagage bagage) {
        log.info("Arrivee du bagage {}", bagage);
        /* TODO: section 3 */
    }

    public void passage(Passage passage) {
        log.info("Passage: {}", passage);
        /* TODO: section 3 */
    }
}
