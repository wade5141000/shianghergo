package com.shianghergo.exception;

public class ProductNotFoundException extends RuntimeException {
	Integer id;
	
	public ProductNotFoundException() {
	}
	

	public ProductNotFoundException(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public ProductNotFoundException(String message) {
		super(message);
	}
	
	public ProductNotFoundException(Throwable cause) {
		super(cause);
	}

	public ProductNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public ProductNotFoundException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public ProductNotFoundException(String message, Integer id) {
		super(message);
		this.id = id;
	}
}
