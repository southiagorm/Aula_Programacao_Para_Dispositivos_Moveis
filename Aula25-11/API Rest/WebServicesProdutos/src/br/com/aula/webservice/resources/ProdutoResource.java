package br.com.aula.webservice.resources;

import java.util.List;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import br.com.aula.webservice.model.Produto;
import br.com.aula.webservice.service.ProdutoService;

@Path("/produtos")
@Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
@Consumes(MediaType.APPLICATION_JSON + ";charset=utf-8")
@RequestScoped
public class ProdutoResource {
	
	@Inject
	private ProdutoService produtoService;
	
	@GET
	public List<Produto> getProdutos(){
		return produtoService.findAll();
	}
	
	@GET
	@Path("{produtoId}")
	public Produto getProduto(@PathParam("produtoId") long id) {
		return produtoService.findById(id);
	}
	
	@POST
	public void save(Produto produto) {
		produtoService.save(produto);
	}
	
	@PUT
	@Path("{produtoId}")
	public void update(@PathParam("produtoId") long id, Produto produto) {
		produto.setId(id);
		produtoService.update(produto);
	}
	
	@DELETE
	@Path("{produtoId}")
	public void delete(@PathParam("produtoId") long id) {
		produtoService.delete(id);
	}

}
