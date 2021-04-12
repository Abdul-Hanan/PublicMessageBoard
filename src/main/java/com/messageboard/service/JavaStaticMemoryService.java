package com.messageboard.service;

import java.util.List;

import com.messageboard.model.Post;
import com.messageboard.model.User;


public interface JavaStaticMemoryService {
	
	public Post createPost(Long userId, String userName, String topic, String message);

	public void updatePostById(Long id, Post post);

	public void deletePostById(Long id, Long postId);

	public List<Post> findAllPosts();

	public User createUser(String username, String imageUrl);
	

}
