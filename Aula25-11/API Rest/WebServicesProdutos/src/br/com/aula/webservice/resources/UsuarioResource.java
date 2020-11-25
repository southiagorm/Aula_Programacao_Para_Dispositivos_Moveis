package br.com.aula.webservice.resources;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;

import br.com.aula.webservice.model.Usuario;
import br.com.aula.webservice.service.UsuarioService;

@Path("/usuario")
@RequestScoped
public class UsuarioResource {
	
	@Inject
	private UsuarioService usuarioService;
	
	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	public Usuario loginUsuario(Usuario usuario) {
		return usuarioService.loginUsuario(usuario);
	}
}
