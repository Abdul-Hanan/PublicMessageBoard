package com.messageboard.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.messageboard.model.User;
import com.messageboard.model.UserResponse;
import com.messageboard.service.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	private UserService userService;

	@PostMapping(value = "create")
	public ResponseEntity<?> create(@RequestParam(required = true) String name,
			@RequestParam(required = false) String avatarUrl) {

		UserResponse userResponse = new UserResponse();

		if (name.isBlank()) {
			userResponse.setMessage("Name can not be Blank");
			userResponse.setReturnCode(400);

			return ResponseEntity.badRequest().body(userResponse);
		}

		User user = userService.createUser(name.strip(), avatarUrl);

		if (user == null) {
			userResponse.setMessage("Username already exists please try a differ one.");
			userResponse.setReturnCode(400);
			return ResponseEntity.badRequest().body(userResponse);
		} else {
			userResponse.setMessage("User Created");
			userResponse.setReturnCode(201);
			userResponse.setUser(user);
			return ResponseEntity.ok(userResponse);
		}
	}

	@PostMapping(value = "check")
	public ResponseEntity<?> checkIfUserExists(@RequestParam(required = true) Long userId) {

		UserResponse userResponse = new UserResponse();

		User user = userService.checkIfUserExists(userId);

		if (user == null) {
			userResponse.setMessage("User Not found");
			userResponse.setReturnCode(400);
			return ResponseEntity.badRequest().body(userResponse);
		} else {
			userResponse.setMessage("User Exists");
			userResponse.setReturnCode(200);
			userResponse.setUser(user);
			return ResponseEntity.ok(userResponse);
		}
	}

	@ExceptionHandler(MissingServletRequestParameterException.class)
	public ResponseEntity<?> handleMyException(Exception exception) {
		return ResponseEntity.badRequest().body("Required Parameter not found.");
	}

}
