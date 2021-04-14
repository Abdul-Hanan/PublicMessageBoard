package com.messageboard.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.Arrays;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.junit.MockitoJUnitRunner;

import com.messageboard.model.Post;

@RunWith(MockitoJUnitRunner.class)
public class MessageServiceTests {

	private static MessageServiceImpl mockMessageServiceImpl;

	@BeforeClass
	public static void init() {

		// set mockUserServiceImpl mock object
		mockMessageServiceImpl = mock(MessageServiceImpl.class);

		// create Post objects

		Post post = new Post(1l, 1l, "hanan", "topic1", "message1");
		Post postUpdated = new Post(1l, 1l, "hanan", "topic1updated", "message1updated");

		when(mockMessageServiceImpl.createPost(1l, "hanan", "topic1", "message1")).thenReturn(post);
		when(mockMessageServiceImpl.updatePostById(1l, 1l, "topic1updated", "message1updated")).thenReturn(postUpdated);
		when(mockMessageServiceImpl.findAllPosts()).thenReturn(Arrays.asList(postUpdated));
		when(mockMessageServiceImpl.deletePostById(1l, 2l)).thenReturn(false);
		when(mockMessageServiceImpl.deletePostById(1l, 1l)).thenReturn(true);

	}

	@Test
	public void createPostTest() {

		Post post = mockMessageServiceImpl.createPost(1l, "hanan", "topic1", "message1");

		assertNotNull(post);
		assertEquals(Long.valueOf("1"), post.getId());
		assertEquals(Long.valueOf("1"), post.getUserId());
		assertEquals("hanan", post.getUserName());
		assertEquals("topic1", post.getTopic());
		assertEquals("message1", post.getMessage());
	}

	@Test
	public void updatePostTest() {
		Post post = mockMessageServiceImpl.updatePostById(1l, 1l, "topic1updated", "message1updated");

		assertNotNull(post);
		assertEquals(Long.valueOf("1"), post.getId());
		assertEquals(Long.valueOf("1"), post.getUserId());
		assertEquals("hanan", post.getUserName());
		assertEquals("topic1updated", post.getTopic());
		assertEquals("message1updated", post.getMessage());
	}

	@Test
	public void findAllPostsTest() {

		List<Post> postlist = mockMessageServiceImpl.findAllPosts();
		assertNotNull(postlist);
		assertEquals(1, postlist.size());
	}

	@Test
	public void deletePostTest() {

		boolean deleted = mockMessageServiceImpl.deletePostById(1l, 2l);
		assertEquals(false, deleted);

		boolean deleted2 = mockMessageServiceImpl.deletePostById(1l, 1l);
		assertEquals(true, deleted2);
	}

}
