package br.com.aula.webservice.service;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.aula.webservice.dao.UsuarioDao;
import br.com.aula.webservice.model.Usuario;

@RequestScoped
public class UsuarioService {
	
	@Inject
	private UsuarioDao usuarioDao;
	
	public Usuario loginUsuario(Usuario usuario) {
		return usuarioDao.loginUsuario(usuario);
	}
}
