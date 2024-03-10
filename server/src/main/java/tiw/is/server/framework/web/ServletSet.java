package tiw.is.server.framework.web;

import jakarta.servlet.http.HttpServlet;

import java.util.Set;

public class ServletSet {

    public final Set<Class<HttpServlet>> servlets;

    public ServletSet(Set<Class<HttpServlet>> servlets) {

        this.servlets = servlets;
    }


}
