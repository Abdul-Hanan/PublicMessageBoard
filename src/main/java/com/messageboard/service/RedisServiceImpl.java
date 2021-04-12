package com.messageboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.messageboard.model.Post;
import com.messageboard.model.User;
@Service
public class RedisServiceImpl implements RedisService {

	@Override
	public void updatePostById(Long id, Post post) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePostById(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean createPost(Post post) {
		return false;
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Post> findAllPosts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createUser(String username, String imageUrl) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long createPost(Long userId, String userName, String title, String message) {
		// TODO Auto-generated method stub
		return null;
	}


}
