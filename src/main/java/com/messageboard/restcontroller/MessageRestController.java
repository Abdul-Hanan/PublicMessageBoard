package com.messageboard.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.messageboard.model.Post;
import com.messageboard.model.PostResponse;
import com.messageboard.service.MessageService;

@RestController
@RequestMapping("/message/*")
public class MessageRestController {

	@Autowired
	MessageService messageService;

	@PostMapping(value = "create")
	public ResponseEntity<?> create(@RequestParam(required = true) Long userId,
			@RequestParam(required = true) String userName, @RequestParam(required = true) String topic,
			@RequestParam(required = true) String message) {

		PostResponse postResponse = new PostResponse();

		if (userName == null || userName.isBlank() || userId == null || userId == 0l) {
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

		Post post = messageService.createPost(userId, userName, topic, message);

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

	@PutMapping(value = "update")
	public ResponseEntity<PostResponse> modify(@RequestParam(required = true) Long userId,
			@RequestParam(required = true) Long postId, @RequestParam(required = true) String topic,
			@RequestParam(required = true) String message) {

		PostResponse postResponse = new PostResponse();

		Post updatedPost = messageService.updatePostById(userId, postId, topic, message);

		if (updatedPost != null) {
			postResponse.setMessage("Successfully updated");
			postResponse.setReturnCode(200);
			postResponse.setPost(updatedPost);
			return ResponseEntity.ok(postResponse);
		} else {
			postResponse.setMessage("Unable to update, please contact your system administrator");
			postResponse.setReturnCode(500);
			return ResponseEntity.badRequest().body(postResponse);
		}
	}

	@DeleteMapping(value = "delete")
	public ResponseEntity<?> delete(@RequestParam(required = true) Long userId,
			@RequestParam(required = true) Long postId) {

		PostResponse postResponse = new PostResponse();

		boolean deleted = messageService.deletePostById(userId, postId);

		if (deleted) {
			postResponse.setMessage("Successfully Deleted");
			postResponse.setReturnCode(200);
			return ResponseEntity.ok(postResponse);
		} else {
			postResponse.setMessage("Unable to delete, please contact your system administrator");
			postResponse.setReturnCode(500);
			return ResponseEntity.badRequest().body(postResponse);
		}

	}

	@GetMapping(value = "view")
	public ResponseEntity<List<Post>> view() {
		List<Post> allPosts = messageService.findAllPosts();
		return new ResponseEntity<List<Post>>(allPosts, HttpStatus.OK);
	}

	@ExceptionHandler(MissingServletRequestParameterException.class)
	public ResponseEntity<?> handleMyException(Exception exception) {
		return ResponseEntity.badRequest().body("Required Parameter not found.");
	}

}
