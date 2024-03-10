package tiw.is.vols.livraison.handler.resource.flight;

import annotations.Handler;
import tiw.is.vols.livraison.dao.FlightDao;
import tiw.is.vols.livraison.dto.FlightDTO;
import tiw.is.vols.livraison.exception.ResourceNotFoundException;
import tiw.is.vols.livraison.command.resource.flight.GetFlightsCommand;
import tiw.is.server.commandBus.ICommandHandler;

import java.util.Collection;

@Handler
public class GetFlightsCommandHandler implements ICommandHandler<Collection<FlightDTO>, GetFlightsCommand> {
    private final FlightDao dao;

    public GetFlightsCommandHandler(FlightDao dao) {
        this.dao = dao;
    }

    /**
     * Execution: Get All flights.
     *
     * @param command
     * @return Collection of FlightDTO.
     * @throws ResourceNotFoundException
     */
    public Collection<FlightDTO> handle(GetFlightsCommand command) throws ResourceNotFoundException {
        return dao.getAll().stream().map(FlightDTO::fromFlight).toList();
    }
}
