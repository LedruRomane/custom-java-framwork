package tiw.is.vols.livraison.handler.resource.baggage;

import annotations.Handler;
import annotations.ServletFromHandler;
import annotations.params.METHOD_REST;
import tiw.is.server.commandBus.ICommandHandler;
import tiw.is.vols.livraison.command.resource.baggage.GetBaggageCommand;
import tiw.is.vols.livraison.command.resource.baggage.GetBaggagesFromFlightCommand;
import tiw.is.vols.livraison.dao.BaggageDao;
import tiw.is.vols.livraison.dto.BaggageDTO;
import tiw.is.vols.livraison.exception.ResourceNotFoundException;
import tiw.is.vols.livraison.model.Baggage;

import java.util.Collection;
import java.util.Optional;

@Handler
@ServletFromHandler(
        path = "flight/baggages",
        method = METHOD_REST.GET,
        params = {"id"}
)
public class GetBaggagesFromFlightCommandHandler implements ICommandHandler<Collection<BaggageDTO>, GetBaggagesFromFlightCommand> {

    private final BaggageDao dao;
    public GetBaggagesFromFlightCommandHandler(BaggageDao dao) {
        this.dao = dao;
    }

    /**
     * Execution found one baggage. Usually get command payload, calls DAO, and return DTO.
     *
     * @param command payload with Flight's ID.
     * @return Collection<BaggageDTO>.
     */
    public Collection<BaggageDTO> handle(GetBaggagesFromFlightCommand command) throws ResourceNotFoundException {
        return dao.getAllFromFlight(command.id()).stream().map(BaggageDTO::fromBaggage).toList();
    }
}
