package br.com.aula.webservice.exceptions;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

import br.com.aula.webservice.model.ErrorMessage;

@Provider//extensão e deve ser encontrada pelo jersey na inicialização
public class DaoExceptionMapper implements ExceptionMapper<DAOExceptions> {
	
	@Override
	public Response toResponse(DAOExceptions exception) {
		ErrorMessage error = new ErrorMessage(exception.getMessage(), exception.getCode());
		if(exception.getCode() == ErrorCode.BAD_REQUEST.getCode()){
			System.out.println("Aqui");
			return Response.status(Status.BAD_REQUEST).entity(error).type(MediaType.APPLICATION_JSON).build();
		}else if(exception.getCode() == ErrorCode.NOT_FOUND.getCode()){
			return Response.status(Status.NOT_FOUND).entity(error).type(MediaType.APPLICATION_JSON).build();
		}else{
			return Response.status(Status.INTERNAL_SERVER_ERROR).entity(error).type(MediaType.APPLICATION_JSON).build();
		}
	}
}
