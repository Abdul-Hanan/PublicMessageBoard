package com.messageboard.model;

public class User {
	private Long id;
	private String username;
	private String avatarUrl;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAvatarUrl() {
		return avatarUrl;
	}

	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub

		if (obj != null && obj instanceof User) {
			if (this.username.equalsIgnoreCase(((User) obj).getUsername())) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", avatarUrl=" + avatarUrl + "]";
	}

}
