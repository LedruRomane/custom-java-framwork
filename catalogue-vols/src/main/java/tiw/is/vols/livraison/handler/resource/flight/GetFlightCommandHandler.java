package tiw.is.vols.livraison.handler.resource.flight;

import annotations.Handler;
import tiw.is.vols.livraison.dao.FlightDao;
import tiw.is.vols.livraison.dto.FlightDTO;
import tiw.is.vols.livraison.exception.ResourceNotFoundException;
import tiw.is.vols.livraison.command.resource.flight.GetFlightCommand;
import tiw.is.server.commandBus.ICommandHandler;
import tiw.is.vols.livraison.model.Flight;

import java.util.Optional;

@Handler
public class GetFlightCommandHandler implements ICommandHandler<FlightDTO, GetFlightCommand> {

    private final FlightDao dao;
    public GetFlightCommandHandler(FlightDao dao) {
        this.dao = dao;
    }

    /**
     * Execution: get one flight by ID.
     *
     * @param command payload with flight ID.
     * @return FlightDTO.
     */
    public FlightDTO handle(GetFlightCommand command) throws ResourceNotFoundException {
        Flight flight = Optional.ofNullable(dao.getOneById(command.id())).orElseThrow(
                () -> new ResourceNotFoundException("Le flight " + command.id() + " n'existe pas.")
        );

        return FlightDTO.fromFlight(flight);
    }
}
