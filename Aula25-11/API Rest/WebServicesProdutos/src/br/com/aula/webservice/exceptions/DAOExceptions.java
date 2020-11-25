package br.com.aula.webservice.exceptions;

public class DAOExceptions extends RuntimeException {

	private static final long serialVersionUID = 186175141845311399L;
	
	private int code;

	public DAOExceptions(String message, int code) {
		super(message);
		this.code = code;
	}

	public int getCode() {
		return code;
	}

}
