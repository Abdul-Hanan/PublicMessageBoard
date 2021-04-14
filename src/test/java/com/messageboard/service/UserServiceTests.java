package com.messageboard.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.junit.MockitoJUnitRunner;

import com.messageboard.model.User;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceTests {

	private static UserServiceImpl mockUserServiceImpl;

	@BeforeClass
	public static void init() {

		// set mockUserServiceImpl mock object
		mockUserServiceImpl = mock(UserServiceImpl.class);

		// create an User object
		User user = new User(1l, "hanan", "Test");
		// create another User object
		User user2 = new User(2l, "hanan2", "Test2");

		when(mockUserServiceImpl.checkIfUserExists(1L)).thenReturn(user);
		when(mockUserServiceImpl.createUser("hanan2", "Test2")).thenReturn(user2);
		when(mockUserServiceImpl.createUser("hanan2", "Test4")).thenReturn(null);

	}

	@Test
	public void getUserTest() {
		Long userId = 1L;

		User user = mockUserServiceImpl.checkIfUserExists(userId);

		assertNotNull(user);
		assertEquals(Long.valueOf("1"), user.getId());
		assertEquals("hanan", user.getUsername());
		assertEquals("Test", user.getAvatarUrl());
	}

	@Test
	public void addUserTest() {
		User user = mockUserServiceImpl.createUser("hanan2", "Test2");

		assertNotNull(user);
		assertEquals(Long.valueOf("2"), user.getId());
		assertEquals("hanan2", user.getUsername());
		assertEquals("Test2", user.getAvatarUrl());
	}

	@Test
	public void addUserDuplicateUsernameTest() {

		User user = mockUserServiceImpl.createUser("hanan2", "Test4");
		assertEquals(null, user);
	}

}
