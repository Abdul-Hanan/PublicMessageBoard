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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.messageboard.model.Post;
import com.messageboard.model.PostResponse;
import com.messageboard.model.User;
import com.messageboard.model.UserResponse;
import com.messageboard.service.JavaStaticMemoryService;
import com.messageboard.service.RedisService;

@RestController
@RequestMapping("/message/*")
public class MessageService {

	@Autowired
	JavaStaticMemoryService javaStaticMemoryService;

	@PostMapping(value = "create")
	public ResponseEntity<?> create(@RequestParam Long userId, @RequestParam String userName,
			@RequestParam String topic, @RequestParam String message) {

		PostResponse postResponse = new PostResponse();

		if (userName == null || userName.isBlank() || userId == null || userId==0l) {
			postResponse.setMessage("Unauthorized: username not found");
			postResponse.setReturnCode(401);
			return ResponseEntity.badRequest().body(postResponse);

		} else if (topic.isBlank()) {
			postResponse.setMessage("Post topic can not be empty");
			postResponse.setReturnCode(400);
			return ResponseEntity.badRequest().body(postResponse);

		} else if (message.isBlank()) {
			postResponse.setMessage("Post message can not be empty");
			postResponse.setReturnCode(400);
			return ResponseEntity.badRequest().body(postResponse);
		}

		Post post = javaStaticMemoryService.createPost(userId, userName, topic, message);

		if (post == null) {
			postResponse.setMessage("Unable to create post, please contact your system administrator.");
			postResponse.setReturnCode(500);
			return ResponseEntity.badRequest().body(postResponse);
		} else {
			postResponse.setMessage("Post Created");
			postResponse.setReturnCode(201);
			postResponse.setPost(post);
			return ResponseEntity.ok(postResponse);
		}
	}

	@PutMapping(value = "/{id}")
	@ResponseStatus(HttpStatus.OK)
	public void modify(@PathVariable("id") Long id, @RequestBody Post post) {
		javaStaticMemoryService.updatePostById(id, post);
	}

	@DeleteMapping(value = "delete")
	@ResponseStatus(HttpStatus.OK)
	public void delete(@RequestParam Long userId , @RequestParam Long postId) {
		javaStaticMemoryService.deletePostById(userId, postId);
	}

	@GetMapping(value = "view")
	public ResponseEntity<List<Post>> view() {
		List<Post> allPosts = javaStaticMemoryService.findAllPosts();
		return new ResponseEntity<List<Post>>(allPosts, HttpStatus.OK);
	}
}
