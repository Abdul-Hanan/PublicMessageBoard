package com.messageboard.service;

import java.time.LocalDateTime;
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

	public void deletePostById(Long userId, Long postId) {
		// TODO Auto-generated method stub
		allPosts.forEach(P -> {
			if (P.getId() == postId && P.getUserId()==userId) {
				allPosts.remove(allPosts.indexOf(P));
			}
		});
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

			allPosts.add(post);
			
			return post;

		} catch (Exception e) {
			// Print Trace or log to any logging service
			return null;
		}

	}

}
