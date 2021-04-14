package com.messageboard.model;

public class Post {
	private Long id;
	private Long userId;
	private String userName;
	private String topic;
	private String message;
	private String dateTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", userId=" + userId + ", userName=" + userName + ", topic=" + topic + ", message="
				+ message + ", dateTime=" + dateTime + "]";
	}

	public Post(Long id, Long userId, String userName, String topic, String message) {
		super();
		this.id = id;
		this.userId = userId;
		this.userName = userName;
		this.topic = topic;
		this.message = message;
	}

	public Post() {
		
	}
	
}
