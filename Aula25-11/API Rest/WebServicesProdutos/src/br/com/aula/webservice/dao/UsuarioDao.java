package br.com.aula.webservice.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.aula.webservice.exceptions.DAOExceptions;
import br.com.aula.webservice.exceptions.ErrorCode;
import br.com.aula.webservice.model.Usuario;

@Stateless
public class UsuarioDao {
	
	@PersistenceContext(unitName = "projeto_produtos")
	private EntityManager em;
	
	public Usuario loginUsuario(Usuario usuario){
		Usuario usuarioTemp = null;
		
		try {
			usuarioTemp = em.
					createQuery("SELECT u FROM Usuario u WHERE u.email = :email and u.senha = :senha", Usuario.class)
					.setParameter("email", usuario.getEmail())
					.setParameter("senha", usuario.getSenha())
					.getSingleResult();
		}catch (IllegalArgumentException e) {
			throw new DAOExceptions("Usuário não Encontrado " + e.getMessage(), ErrorCode.NOT_FOUND.getCode());
		}
		catch (RuntimeException e) {
			throw new DAOExceptions("Erro ao recuperar usuário do banco " + e.getMessage(), ErrorCode.SERVER_ERROR.getCode());
		}
		
		return usuario;
	}

}
