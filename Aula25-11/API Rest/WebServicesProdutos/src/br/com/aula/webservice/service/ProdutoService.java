package br.com.aula.webservice.service;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.aula.webservice.dao.ProdutoDao;
import br.com.aula.webservice.model.Produto;

@RequestScoped
public class ProdutoService {
	
	@Inject
	private ProdutoDao produtoDao;
	
	public List<Produto> findAll() {
		return produtoDao.findAll();
	}
	
	public void save(Produto produto) {
		produtoDao.save(produto);
	}
	
	public void update(Produto produto) {
		produtoDao.update(produto);
	}
	
	public void delete(Long id) {
		produtoDao.delete(id);
	}
	
	public Produto findById(Long id) {
		return produtoDao.findById(id);
	}
}
