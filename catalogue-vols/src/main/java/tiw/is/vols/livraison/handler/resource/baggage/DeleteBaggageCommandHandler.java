package tiw.is.vols.livraison.handler.resource.baggage;

import annotations.Handler;
import tiw.is.vols.livraison.dao.BaggageDao;
import tiw.is.vols.livraison.exception.ResourceNotFoundException;
import tiw.is.vols.livraison.command.resource.baggage.DeleteBaggageCommand;
import tiw.is.server.commandBus.ICommandHandler;

@Handler
public class DeleteBaggageCommandHandler implements ICommandHandler<Boolean, DeleteBaggageCommand> {
    private final BaggageDao dao;

    public DeleteBaggageCommandHandler(BaggageDao dao) {
        this.dao = dao;
    }

    /**
     * Execution for baggage deletion. Usually get command payload, calls DAO, and return DTO.
     *
     * @param command payload.
     * @return  boolean true if deleted.
     * @throws ResourceNotFoundException
     */
    public Boolean handle(DeleteBaggageCommand command) throws ResourceNotFoundException {
        if (!dao.deleteOneById(command.id(), command.num()))
            throw new ResourceNotFoundException("Le vol " + command.id() + " n'existe pas, ou le num " + command.num() + " bagage n'existe pas.");
        return true;
    }
}
