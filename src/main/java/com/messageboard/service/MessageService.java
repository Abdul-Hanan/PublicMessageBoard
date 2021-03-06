package com.messageboard.service;

import java.util.List;


import com.messageboard.model.Post;

public interface MessageService {

	public Post createPost(Long userId, String userName, String topic, String message);

	public Post updatePostById(Long userId, Long postId, String topic, String message);

	public boolean deletePostById(Long id, Long postId);

	public List<Post> findAllPosts();

}
