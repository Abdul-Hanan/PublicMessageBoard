package com.messageboard.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.messageboard.model.Post;
import com.messageboard.service.RedisService;

@RestController
@RequestMapping("/message/*")
public class MessageService {

	@Autowired
	RedisService redisService;

	@PostMapping(value = "create")
	public ResponseEntity<Boolean> create(@RequestBody Post post) {

		boolean created = false;
		created = redisService.createPost(post);

		return new ResponseEntity<Boolean>(created, HttpStatus.CREATED);
	}

	@PutMapping(value = "/{id}")
	@ResponseStatus(HttpStatus.OK)
	public void modify(@PathVariable("id") Long id, @RequestBody Post post) {
		redisService.updatePostById(id, post);
	}

	@DeleteMapping(value = "/{id}")
	@ResponseStatus(HttpStatus.OK)
	public void delete(@PathVariable("id") Long id) {
		redisService.deletePostById(id);
	}

	@GetMapping(value = "view")
	public ResponseEntity<List<Post>> view() {
		List<Post> allPosts = redisService.findAllPosts();
		return new ResponseEntity<List<Post>>(allPosts, HttpStatus.OK);
	}
}
