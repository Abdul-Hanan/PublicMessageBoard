package com.messageboard.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.messageboard.model.Post;
import com.messageboard.model.User;

@Service
public class JavaStaticMemoryServiceImpl implements JavaStaticMemoryService {

	public static List<User> allUsers = new ArrayList<>();
	// public static List<Post> allPosts = new ArrayList<>();
	public static LinkedHashMap<Long, Post> allPosts = new LinkedHashMap<>();

	private static Long userCountGlobal = 0l;
	private static Long postCountGlobal = 0l;

	@Override
	public Post updatePostById(Long userId, Long postId, String topic, String message) {

		Post post = null;

		if (allPosts.containsKey(postId)) {
			if (allPosts.get(postId).getUserId() == userId) {

				post = allPosts.get(postId);
				post.setDateTime(LocalDateTime.now().withNano(0).toString().replace("T", " "));
				post.setTopic(topic);
				post.setMessage(message);

				allPosts.put(postId, post);

			}
		}
		return post;
	}

	public boolean deletePostById(Long userId, Long postId) {
		// TODO Auto-generated method stub
		boolean success = false;
		if (allPosts.containsKey(postId)) {
			Post post = allPosts.get(postId);
			if (post.getUserId() == userId) {
				allPosts.remove(postId);
				success = true;
			}
		}

		return success;
	}

	public List<Post> findAllPosts() {
		// TODO Auto-generated method stub
		List<Post> posts = new ArrayList<>(allPosts.values());
		return posts;
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

	@Override
	public Post createPost(Long userId, String userName, String topic, String message) {
		// TODO Auto-generated method stub

		try {
			postCountGlobal++;

			Post post = new Post();
			post.setId(postCountGlobal);
			post.setUserId(userId);
			post.setUserName(userName);
			post.setTopic(topic);
			post.setMessage(message);
			post.setDateTime(LocalDateTime.now().withNano(0).toString().replace("T", " "));

			allPosts.put(postCountGlobal, post);

			return post;

		} catch (Exception e) {
			// Print Trace or log to any logging service
			return null;
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
