package tiw.is.arrivee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class VolService {
    private static final Logger log = LoggerFactory.getLogger(VolService.class);
    public Vol getVol(int volId) {
        log.info("fake GET /vol/{} on catalogue", volId);
        return new Vol("ma-companie", "v" + volId, volId % 10);
    }
}
