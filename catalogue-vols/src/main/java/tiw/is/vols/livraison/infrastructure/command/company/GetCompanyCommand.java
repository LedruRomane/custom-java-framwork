package tiw.is.vols.livraison.infrastructure.command.company;

import tiw.is.vols.livraison.infrastructure.commandBus.ICommand;

public record GetCompanyCommand(String id) implements ICommand {}