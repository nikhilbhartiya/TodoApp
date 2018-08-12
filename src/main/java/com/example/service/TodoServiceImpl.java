package com.example.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.example.model.Todo;
import com.example.model.User;
import com.example.repository.TodoRepository;

@Service
public class TodoServiceImpl implements TodoService {

	@Autowired
	private TodoRepository todoRepository;

	@Autowired
	private UserService userService;

	@Override
	public void saveTodo(Todo todo) {
		if (todo.getId() == null) {
			todo.setCreatedAt(new Date());
		} else {
			Todo dbTodo = todoRepository.findOne(todo.getId());
			todo.setCreatedAt(dbTodo.getCreatedAt());
		}
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User loggedInUser = userService.findUserByEmail(auth.getName());
		todo.setCreator(loggedInUser);
		todoRepository.save(todo);
	}

	@Override
	public Todo findById(Integer todoId) {
		return todoRepository.findOne(todoId);
	}

	@Override
	public List<Todo> findAllByCreator(User creator) {
		List<Todo> todoList = todoRepository.findByCreator(creator);
		if (todoList == null) {
			todoList = new ArrayList<Todo>();
		}

		return todoList;
	}

	@Override
	public void deleteTodo(Integer id) {
		Todo todo = todoRepository.findOne(id);
		todo.setDeleted(true);
		todoRepository.save(todo);

	}

}
