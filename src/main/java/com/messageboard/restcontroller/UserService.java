package com.messageboard.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.messageboard.model.User;
import com.messageboard.model.UserResponse;
import com.messageboard.service.JavaStaticMemoryService;
import com.messageboard.service.JavaStaticMemoryServiceImpl;

@RestController
@RequestMapping("/rest/user/*")
public class UserService {

	@Autowired
	JavaStaticMemoryService javaStaticMemoryService;

	@PostMapping(value = "create")
	public ResponseEntity<?> create(@RequestParam String name, @RequestParam String avatarUrl) {

		UserResponse userResponse = new UserResponse();

		if (name.isBlank()) {
			userResponse.setMessage("Name can not be Blank");
			userResponse.setReturnCode(400);

			return ResponseEntity.badRequest().body(userResponse);
		}

		User user = javaStaticMemoryService.createUser(name.strip(), avatarUrl);

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

	@GetMapping(value = "printList")
	public void list() {
		JavaStaticMemoryServiceImpl.allUsers.forEach(x -> System.out.println(x));
	}

}
