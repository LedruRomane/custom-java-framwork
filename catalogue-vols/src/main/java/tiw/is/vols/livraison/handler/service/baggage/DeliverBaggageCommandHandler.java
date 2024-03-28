package tiw.is.vols.livraison.handler.service.baggage;

import annotations.Handler;
import annotations.ServletFromHandler;
import annotations.params.METHOD_REST;
import tiw.is.vols.livraison.dao.BaggageDao;
import tiw.is.vols.livraison.dao.FlightDao;
import tiw.is.vols.livraison.dto.BaggageDTO;
import tiw.is.vols.livraison.exception.ResourceNotFoundException;
import tiw.is.vols.livraison.command.service.baggage.DeliverBaggageCommand;
import tiw.is.server.commandBus.ICommandHandler;
import tiw.is.vols.livraison.model.Baggage;
import tiw.is.vols.livraison.model.Flight;

import java.util.Optional;

@Handler
@ServletFromHandler(
        path = "baggage/deliver",
        method = METHOD_REST.POST,
        params = {"id", "num"}
)
public class DeliverBaggageCommandHandler implements ICommandHandler<BaggageDTO, DeliverBaggageCommand> {
    private final BaggageDao dao;
    private final FlightDao flightDao;

    public DeliverBaggageCommandHandler(BaggageDao dao, FlightDao flightDao) {
        this.dao = dao;
        this.flightDao = flightDao;
    }

    /**
     * Execution: mark a baggage as deliver.
     *
     * @param command Flight's ID and baggage's num.
     * @return BaggageDTO
     * @throws ResourceNotFoundException
     */
    public BaggageDTO handle(DeliverBaggageCommand command) throws ResourceNotFoundException, IllegalStateException {
        Flight flight = flightDao.getOneById(command.id());
        if (flight == null) {
            throw new ResourceNotFoundException("The flight doesn't exist: " + command.id());
        }

        if (!flight.isLivraisonEnCours()) {
            throw new IllegalStateException("Impossible de livrer un bagage pour un vol dont la livraison est fermée.");
        }

        Baggage baggage = Optional.ofNullable(dao.getOneById(flight.getId(), command.num())).orElseThrow(
                () -> new ResourceNotFoundException("Le baggage " + command.num() + " du vol " + flight.getId() + " n'existe pas."));

        baggage.delivrer();
        dao.update(baggage);

        return (new BaggageDTO(baggage.getFlight().getId(), baggage.getNumero(), baggage.getWeight(), baggage.getPassenger()));
    }
}
