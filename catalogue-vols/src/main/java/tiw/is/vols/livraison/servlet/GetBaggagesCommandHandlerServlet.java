package tiw.is.vols.livraison.servlet;

import annotations.Component;
import annotations.Servlet;
import annotations.params.COMPONENT_TYPE;
import annotations.params.METHOD_REST;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tiw.is.server.commandBus.CommandBus;
import tiw.is.server.utils.JsonFormatter;
import tiw.is.vols.livraison.command.resource.baggage.GetBaggagesCommand;

import java.io.IOException;

@Servlet(
        path = "baggages",
        method = METHOD_REST.POST
)
@Component(
        type = COMPONENT_TYPE.SERVLET
)
public class GetBaggagesCommandHandlerServlet extends HttpServlet {
    private final CommandBus commandBus;
    private static final JsonFormatter<GetBaggagesCommand> formatter = new JsonFormatter<>();

    public GetBaggagesCommandHandlerServlet(CommandBus commandBus) {
        this.commandBus = commandBus;
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json");

        try {
            GetBaggagesCommand command = new GetBaggagesCommand();
            String baggage = formatter.serializeObject(this.commandBus.handle(command));
            resp.getWriter().write(baggage);

        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }
}
