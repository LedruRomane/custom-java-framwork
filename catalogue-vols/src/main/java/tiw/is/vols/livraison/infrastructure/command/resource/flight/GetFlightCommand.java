package tiw.is.vols.livraison.infrastructure.command.resource.flight;

import tiw.is.vols.livraison.infrastructure.commandBus.ICommand;

public record GetFlightCommand(String id) implements ICommand {}