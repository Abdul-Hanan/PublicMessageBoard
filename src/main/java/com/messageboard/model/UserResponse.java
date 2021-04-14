package com.messageboard.model;

public class UserResponse {
	private String message;
	private int returnCode;
	private User user;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getReturnCode() {
		return returnCode;
	}

	public void setReturnCode(int returnCode) {
		this.returnCode = returnCode;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserResponse(String message, int returnCode, User user) {
		super();
		this.message = message;
		this.returnCode = returnCode;
		this.user = user;
	}
	
	public UserResponse() {
		
	}
	

}
