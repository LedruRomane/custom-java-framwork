package tiw.is.vols.livraison.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tiw.is.server.commandBus.CommandBus;
import tiw.is.server.utils.JsonFormatter;
import tiw.is.vols.livraison.command.resource.baggage.GetBaggagesCommand;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


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
        Map<String, Object> map = new HashMap<>();

        try {
            String response = formatter.serializeObject(this.commandBus.handle(
                    mapToCommand(map)
            ));
            resp.getWriter().write(response);

        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        }
    }

    private GetBaggagesCommand mapToCommand(Map<String, Object> params) {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.convertValue(params, GetBaggagesCommand.class);
    }
}
