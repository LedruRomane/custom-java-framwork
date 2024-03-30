package tiw.is.vols.livraison.command.resource.baggage;

import tiw.is.server.commandBus.ICommand;

/**
 * Command record for getting all baggages from specific flight.
 *
 * @param id  Flight ID.
 */
public record GetBaggagesFromFlightCommand(String id) implements ICommand {
}
