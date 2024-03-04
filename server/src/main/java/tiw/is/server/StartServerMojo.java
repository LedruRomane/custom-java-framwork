package tiw.is.server;

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugins.annotations.Mojo;

import java.nio.file.Paths;

@Mojo(name = "startServer")
public class StartServerMojo extends AbstractMojo {

    public void execute() throws MojoExecutionException {
        try {
            Serveur serveur = new ServeurImpl(Paths.get("src/main/resources/appConfiguration.json"));
            getLog().info("Server started.");
        } catch (Exception e) {
            throw new MojoExecutionException("Error starting server", e);
        }
    }
}