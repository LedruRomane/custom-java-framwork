package tiw.is.vols.livraison.command.resource.baggage;

import tiw.is.server.commandBus.ICommand;

/**
 * Command Record for Baggage creation.
 *
 * @param id Flight id where the baggage will be created.
 */
public record CreateBaggageCommand(String id, String weight, String passenger) implements ICommand {
}
