package tiw.is.vols.livraison.handler.resource.flight;

import annotations.Handler;
import annotations.ServletFromHandler;
import annotations.params.METHOD_REST;
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
@ServletFromHandler(
        path = "flight/create",
        method = METHOD_REST.POST,
        params = {"id", "companyID", "pointLivraisonBagages"}
)
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

        try {
            Flight flightToModify = Optional.ofNullable(dao.getOneById(dto.id())).orElseThrow(
                    () -> new ResourceNotFoundException("Le vol " + dto.id() + " n'existe pas.")
            );
            flightToModify.setCompany(company);
            flightToModify.setPointLivraisonBagages(dto.pointLivraisonBagages());
            dao.save(flightToModify);

        } catch (ResourceNotFoundException e) {
            // If the flight does not exist, we create it.
            dao.save(new Flight(dto.id(), company, dto.pointLivraisonBagages()));
            return dto;
        }

        return dto;
    }
}
