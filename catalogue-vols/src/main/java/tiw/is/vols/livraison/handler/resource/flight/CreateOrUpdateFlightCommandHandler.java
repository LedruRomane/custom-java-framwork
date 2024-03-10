package tiw.is.vols.livraison.handler.resource.flight;

import annotations.Handler;
import tiw.is.vols.livraison.dao.CompanyDao;
import tiw.is.vols.livraison.dao.FlightDao;
import tiw.is.vols.livraison.dto.FlightDTO;
import tiw.is.vols.livraison.exception.ResourceNotFoundException;
import tiw.is.vols.livraison.command.resource.flight.CreateOrUpdateFlightCommand;
import tiw.is.server.commandBus.ICommandHandler;
import tiw.is.vols.livraison.model.Company;
import tiw.is.vols.livraison.model.Flight;

import java.util.Optional;

@Handler
public class CreateOrUpdateFlightCommandHandler implements ICommandHandler<FlightDTO, CreateOrUpdateFlightCommand> {

    private final FlightDao dao;
    private final CompanyDao companyDao;

    public CreateOrUpdateFlightCommandHandler(
            FlightDao dao,
            CompanyDao companyDao
    ) {
        this.dao = dao;
        this.companyDao = companyDao;
    }

    /**
     * Execution: Create or Update a flight.
     *
     * @param command payload that contain flight's ID.
     * @return FlightDTO.
     * @throws ResourceNotFoundException
     */
    public FlightDTO handle(CreateOrUpdateFlightCommand command) throws ResourceNotFoundException {
        FlightDTO dto = new FlightDTO(command.id(), command.companyID(), command.pointLivraisonBagages());

        Company company = Optional.ofNullable(companyDao.getOneById(dto.company())).orElseThrow(
                () -> new ResourceNotFoundException("La compagnie " + dto.company() + " n'existe pas.")
        );
        dao.save(new Flight(dto.id(), company, dto.pointLivraisonBagages()));

        return dto;
    }
}
