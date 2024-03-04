package tiw.is.server.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import tiw.is.server.commandBus.ICommand;

import java.io.IOException;

public class JsonFormatter<T> {
    private final ObjectMapper mapper = new ObjectMapper();

    public String serializeObject(Object object) throws JsonProcessingException {
        return mapper.writeValueAsString(object);
    }

    public T deserializeObject(String json, Class<T> clazz) throws IOException {
        return mapper.readValue(json, clazz);
    }
}