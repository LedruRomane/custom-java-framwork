package tiw.is.arrivee;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;

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

    // POST /arrivee/{volId} du TP
    @PostMapping("/{volId}")
    public Vol initLivraisonVol(@PathVariable String volId) {
        log.info("Arrivee du vol :" + volId);
        Vol vol = volService.getVol(volId); // vol exists

        Collection<Bagage> bagages = volService.getBaggages(vol.id()); // GET /vol/{volId} du TP
        bagageService.sendBagages(bagages);
        return vol;
    }
}
