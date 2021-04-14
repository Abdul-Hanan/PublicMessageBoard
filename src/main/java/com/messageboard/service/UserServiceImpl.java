package com.messageboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.messageboard.model.User;

@Service
public class UserServiceImpl implements UserService {

	public static List<User> allUsers = new ArrayList<>();
	private static Long userCountGlobal = 0l;

	public User createUser(String username, String imageUrl) {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUsername(username);
		user.setAvatarUrl(imageUrl);

		if (allUsers.contains(user)) {
			return null;
		} else {
			userCountGlobal++;
			user.setId(userCountGlobal);
			allUsers.add(user);
			return user;
		}

	}

	@Override
	public User checkIfUserExists(Long userId) {
		// TODO Auto-generated method stub
		User user = null;
		for (User u : allUsers) {
			if (u.getId() == userId) {
				user = u;
			}
		}

		return user;
	}

}
