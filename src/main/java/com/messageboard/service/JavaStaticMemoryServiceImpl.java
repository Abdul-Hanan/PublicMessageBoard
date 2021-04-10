package com.messageboard.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.messageboard.model.Post;
import com.messageboard.model.User;

@Service
public class JavaStaticMemoryServiceImpl implements JavaStaticMemoryService {

	public static List<User> allUsers = new ArrayList<>();
	public static List<Post> allPosts = new ArrayList<>();
	private static Long userCountGlobal = 0l;
	private static Long postCountGlobal = 0l;

	public void updatePostById(Long id, Post post) {
		// TODO Auto-generated method stub
		allPosts.forEach(P -> {
			if (P.getId() == post.getId()) {
				allPosts.set(allPosts.indexOf(P), post);
			}
		});
	}

	public void deletePostById(Long id) {
		// TODO Auto-generated method stub
		allPosts.forEach(P -> {
			if (P.getId() == id) {
				allPosts.remove(allPosts.indexOf(P));
			}
		});
	}

	public void createPost(Post post) {
		allPosts.add(post);
	}

	public List<Post> findAllPosts() {
		// TODO Auto-generated method stub
		return allPosts;
	}

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

}
