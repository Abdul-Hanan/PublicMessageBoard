package com.messageboard.service;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import java.time.LocalDateTime;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.messageboard.model.Post;


@RunWith(SpringJUnit4ClassRunner.class)
public class MessageServiceTests {
	
	@InjectMocks
	private MessageServiceImpl messageService;
	
	@SuppressWarnings("deprecation")
	@Before
	public void setup(){
		MockitoAnnotations.initMocks(this);
	}

	
	@Test
	public void createPostTest(){
	
		Post post = new Post();
		post.setId(1l);
		post.setUserId(1l);
		post.setUserName("TestName");
		post.setTopic("TestTopic");
		post.setMessage("TestMessage");
		post.setDateTime(LocalDateTime.now().withNano(0).toString().replace("T", " "));
		
		when(messageService.createPost(1l, "TestName", "TestTopic", "TestMessage")).thenReturn(post);
		
		int resultSize = MessageServiceImpl.allPosts.size();
		assertEquals(1, resultSize);
	}
	
//	@Test
//	public void updatePostByIdTest(){
//		ToDo toDo = new ToDo(1,"Todo Sample 1",true);
//		when(toDoRepository.findOne(1L)).thenReturn(toDo);
//		ToDo result = toDoService.getToDoById(1);
//		assertEquals(1, result.getId());
//		assertEquals("Todo Sample 1", result.getText());
//		assertEquals(true, result.isCompleted());
//	}
//	
//	@Test
//	public void deletePostByIDTest(){
//		ToDo toDo = new ToDo(8,"Todo Sample 8",true);
//		when(toDoRepository.save(toDo)).thenReturn(toDo);
//		ToDo result = toDoService.saveToDo(toDo);
//		assertEquals(8, result.getId());
//		assertEquals("Todo Sample 8", result.getText());
//		assertEquals(true, result.isCompleted());
//	}
//	
//	@Test
//	public void findAllPostsTest(){
//		ToDo toDo = new ToDo(8,"Todo Sample 8",true);
//		toDoService.removeToDo(toDo);
//        verify(toDoRepository, times(1)).delete(toDo);
//	}
}
