package tiw.is.vols.livraison.infrastructure.command.resource.baggage;

import tiw.is.vols.livraison.infrastructure.commandBus.ICommand;

/**
 * Command Record for Baggage creation.
 *
 * @param id String id of the new company that we want to create (payload).
 */
public record CreateBaggageCommand(String id, String weight, String passenger) implements ICommand {
}
