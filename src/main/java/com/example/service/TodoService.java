package com.example.service;

import java.util.List;

import com.example.model.Todo;
import com.example.model.User;

public interface TodoService {
	
	public void saveTodo(Todo todo);
	
	public Todo findById(Integer id);
	
	public List<Todo> findAllByCreator(User creator);

	public void deleteTodo(Integer id);

}
