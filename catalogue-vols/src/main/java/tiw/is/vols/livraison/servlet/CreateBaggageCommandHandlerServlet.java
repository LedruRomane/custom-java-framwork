package tiw.is.vols.livraison.servlet;

import annotations.Component;
import annotations.Servlet;
import annotations.params.COMPONENT_TYPE;
import annotations.params.METHOD_REST;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tiw.is.server.commandBus.CommandBus;
import tiw.is.server.utils.JsonFormatter;
import tiw.is.vols.livraison.command.resource.baggage.CreateBaggageCommand;
import tiw.is.vols.livraison.command.resource.baggage.GetBaggageCommand;
import tiw.is.vols.livraison.command.resource.baggage.GetBaggagesCommand;

import java.io.IOException;
import java.util.Map;

@Servlet(
        path = "baggage/create",
        method = METHOD_REST.POST
)
@Component(
        type = COMPONENT_TYPE.SERVLET
)
public class CreateBaggageCommandHandlerServlet extends HttpServlet {
    private final CommandBus commandBus;
    private static final JsonFormatter<GetBaggagesCommand> formatter = new JsonFormatter<>();

    public CreateBaggageCommandHandlerServlet(CommandBus commandBus) {
        this.commandBus = commandBus;
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json");
        Map<String, Object> body = new ObjectMapper().readValue(req.getReader(), Map.class);

        try {
            String baggage = formatter.serializeObject(this.commandBus.handle(
                    mapToCommand(body)
            ));
            resp.getWriter().write(baggage);

        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }

    private CreateBaggageCommand mapToCommand(Map<String, Object> params) {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.convertValue(params, CreateBaggageCommand.class);
    }
}
