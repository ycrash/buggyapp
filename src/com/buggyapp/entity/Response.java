package com.buggyapp.entity;

/**
 * @author Ankita
 *	
 *	Response is used to send a response from Servlet.
 *	
 */

public class Response {

	private String results;
	private String message;
	private Boolean status;
	
	public Response() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Response(String results, String message, Boolean status) {
		super();
		this.results = results;
		this.message = message;
		this.status = status;
	}

	public String getResults() {
		return results;
	}

	public void setResults(String results) {
		this.results = results;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}
}
