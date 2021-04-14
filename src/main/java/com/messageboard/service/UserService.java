package com.messageboard.service;

import com.messageboard.model.User;

public interface UserService {

	public User createUser(String username, String imageUrl);

	public User checkIfUserExists(Long userId);

}
