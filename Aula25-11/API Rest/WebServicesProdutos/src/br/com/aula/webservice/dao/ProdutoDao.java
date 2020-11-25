package br.com.aula.webservice.dao;

import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.aula.webservice.exceptions.DAOExceptions;
import br.com.aula.webservice.exceptions.ErrorCode;
import br.com.aula.webservice.model.Produto;

@Stateless
public class ProdutoDao {
	
	@PersistenceContext(unitName = "projeto_produtos")
	private EntityManager em;
	
	public void save(Produto produto) {
		try {
			em.persist(produto);
		}catch (RuntimeException e) {
			throw new DAOExceptions("Erro ao tentar salvar um produto no banco" + e.getMessage(), ErrorCode.SERVER_ERROR.getCode());
		}
	}
	
	public void update(Produto produto) {
		Produto produtoManaged = null;
		
		if(produto.getId() <= 0) {
			throw new DAOExceptions("O id precisa ser maior que zero.", ErrorCode.BAD_REQUEST.getCode());
		}
		
		try {
			produtoManaged = em.find(Produto.class, produto.getId());
			produtoManaged.setNome(produto.getNome());
			produtoManaged.setQtde(produto.getQtde());
			//em.merge(produto);
		}catch (NullPointerException e) {
			throw new DAOExceptions("Produto Informado para atualização não existe.", ErrorCode.NOT_FOUND.getCode());
		}catch (RuntimeException e) {
			throw new DAOExceptions("Erro ao tentar alterar um produto no banco" + e.getMessage(), ErrorCode.SERVER_ERROR.getCode());
		}
	}
	
	public void delete (Long id) {
		Produto produto = null;
		
		if(id <= 0) {
			throw new DAOExceptions("O id precisa ser maior que zero.", ErrorCode.BAD_REQUEST.getCode());
		}
		
		try {
			produto = em.find(Produto.class, id);
			em.remove(produto);
		}catch (IllegalArgumentException e) {
			throw new DAOExceptions("Produto Informado para remoção não existe.", ErrorCode.NOT_FOUND.getCode());
		}catch (RuntimeException e) {
			throw new DAOExceptions("Erro ao tentar remover um produto no banco" + e.getMessage(), ErrorCode.SERVER_ERROR.getCode());
		}
		
		
	}
	
	public Produto findById(Long id) {
		Produto produto = null;
		
		if(id <= 0) {
			throw new DAOExceptions("O id precisa ser maior que zero.", ErrorCode.BAD_REQUEST.getCode());
		}
		
		try {
			produto = em.find(Produto.class, id);
		}catch (RuntimeException e) {
			throw new DAOExceptions("Erro ao buscar produto por id no banco" + e.getMessage(), ErrorCode.SERVER_ERROR.getCode());
		}
		
		if(produto == null) {
			throw new DAOExceptions("Produto de " + id + ", não existe", ErrorCode.NOT_FOUND.getCode());
		}
		
		return produto;
	}
	
	public List<Produto> findAll(){
		try {
			return em.createQuery("FROM Produto", Produto.class).getResultList();
		}catch (RuntimeException e) {
			throw new DAOExceptions("Erro ao recuperar todos os produtos do banco" + e.getMessage(), ErrorCode.SERVER_ERROR.getCode());
		}
	}
	
}
