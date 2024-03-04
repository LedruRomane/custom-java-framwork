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
import tiw.is.vols.livraison.command.resource.baggage.GetBaggageCommand;
import tiw.is.vols.livraison.command.resource.baggage.GetBaggagesCommand;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;

@Servlet(
        path = "baggage",
        method = METHOD_REST.GET,
        params = {"id", "num"}
)
@Component(
        type = COMPONENT_TYPE.SERVLET
)
public class GetBaggageCommandHandlerServlet extends HttpServlet {
    private final CommandBus commandBus;
    private static final JsonFormatter<GetBaggagesCommand> formatter = new JsonFormatter<>();

    public GetBaggageCommandHandlerServlet(CommandBus commandBus) {
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
            String baggage = formatter.serializeObject(this.commandBus.handle(
                    mapToCommand(getParams(req))
            ));
            resp.getWriter().write(baggage);

        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }

    // 1. getParams
    private Map<String, Object> getParams(HttpServletRequest req) {
        String id = req.getParameter("id"); // generate from params
        String num = req.getParameter("num"); // generate from params
        return Map.of(
                "id", id,
                "num", num
        );
    }

    // 2. mapper to command
    private GetBaggageCommand mapToCommand(Map<String, Object> params) {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.convertValue(params, GetBaggageCommand.class);
    }
}
