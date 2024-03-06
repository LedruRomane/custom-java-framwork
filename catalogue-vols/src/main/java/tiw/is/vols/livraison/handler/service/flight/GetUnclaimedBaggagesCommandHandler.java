package tiw.is.vols.livraison.handler.service.flight;

import annotations.Handler;
import annotations.ServletFromHandler;
import annotations.params.METHOD_REST;
import tiw.is.vols.livraison.dao.BaggageDao;
import tiw.is.vols.livraison.dao.FlightDao;
import tiw.is.vols.livraison.dto.BaggageDTO;
import tiw.is.vols.livraison.exception.ResourceNotFoundException;
import tiw.is.vols.livraison.command.service.flight.GetUnclaimedBaggagesCommand;
import tiw.is.server.commandBus.ICommandHandler;
import tiw.is.vols.livraison.model.Flight;

import java.util.Collection;
import java.util.Optional;

@Handler
@ServletFromHandler(
        path = "flight/unclaimedBaggages",
        method = METHOD_REST.GET,
        params = {"id"}
)
public class GetUnclaimedBaggagesCommandHandler implements ICommandHandler<Collection<BaggageDTO>, GetUnclaimedBaggagesCommand> {

    private final FlightDao dao;
    private final BaggageDao baggageDao;

    public GetUnclaimedBaggagesCommandHandler(FlightDao dao, BaggageDao baggageDao) {
        this.dao = dao;
        this.baggageDao = baggageDao;
    }

    /**
     * Execution: get all unclaimed baggages from a flight.
     *
     * @param command Flight's ID.
     * @return Collection of BaggageDTO.
     * @throws ResourceNotFoundException
     * @throws IllegalStateException
     */
    public Collection<BaggageDTO> handle(GetUnclaimedBaggagesCommand command) throws ResourceNotFoundException, IllegalStateException {
        Flight flight = Optional.ofNullable(dao.getOneById(command.id())).orElseThrow(
                () -> new ResourceNotFoundException("Le flight " + command.id() + " n'existe pas.")
        );
        if (flight.isLivraisonEnCours())
            throw new IllegalStateException("Impossible de lister les bagages perdus tant que la livraison est en cours.");

        return baggageDao.getBagagesNonRecuperesByFlightId(flight.getId()).stream().map(BaggageDTO::fromBaggage).toList();
    }
}
