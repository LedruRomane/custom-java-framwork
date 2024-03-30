package tiw.is.arrivee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/arrivee")
public class InitDelivery {
    private static final Logger log = LoggerFactory.getLogger(InitDelivery.class);
    private final VolService volService;
    private final BagageService bagageService;

    public InitDelivery(VolService volService, BagageService bagageService) {
        this.volService = volService;
        this.bagageService = bagageService;
    }

    @GetMapping
    public String respondGet() {
        return "Please use POST";
    }

    @PostMapping("/{volId}")
    public Vol initLivraisonVol(@PathVariable int volId) {
        log.info("Arrivee du vol {}", volId);
        Vol vol = volService.getVol(volId);
        bagageService.sendBagages(vol);
        return vol;
    }
}
