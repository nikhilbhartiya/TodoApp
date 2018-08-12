package com.example.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.example.model.Todo;
import com.example.model.User;
import com.example.service.TodoService;
import com.example.service.UserService;

@Controller
@RequestMapping(value = "/todo")
public class TodoController {

	@Autowired
	private TodoService todoService;

	@Autowired
	private UserService userService;

	@RequestMapping(value = {"/list" }, method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User loggedInUser = userService.findUserByEmail(auth.getName());
		modelAndView.addObject("todos", todoService.findAllByCreator(loggedInUser));
		modelAndView.setViewName("todo_list");
		return modelAndView;
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView createForm() {
		ModelAndView modelAndView = new ModelAndView();
		Todo todo = new Todo();
		modelAndView.addObject("todo", todo);
		modelAndView.setViewName("create_todo");
		return modelAndView;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createTodo(@Valid Todo todo, BindingResult bindingResult) {
		ModelAndView modelAndView = new ModelAndView();

		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("create_todo");
		} else {
			todoService.saveTodo(todo);
			modelAndView.addObject("successMessage", "Todo is created successfully");
			modelAndView.addObject("todo", new Todo());
			modelAndView.setViewName("create_todo");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public ModelAndView updateForm(@PathVariable Integer id) {
		ModelAndView modelAndView = new ModelAndView();
		Todo todo = todoService.findById(id);
		modelAndView.addObject("todo", todo);
		modelAndView.setViewName("update_todo");
		return modelAndView;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updateTodo(@Valid Todo todo, BindingResult bindingResult) {
		ModelAndView modelAndView = new ModelAndView();

		if (bindingResult.hasErrors()) {
			modelAndView.setViewName("update_todo");
		} else {
			todoService.saveTodo(todo);
			modelAndView.addObject("successMessage", "Todo is updated successfully");
			modelAndView.addObject("todo", todo);
			modelAndView.setViewName("update_todo");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	public RedirectView delete(@PathVariable Integer id) {
		
		todoService.deleteTodo(id);
		
		/*ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("successMessage", "Todo with id : " + id + " deleted successfully");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User loggedInUser = userService.findUserByEmail(auth.getName());
		modelAndView.addObject("todos", todoService.findAllByCreator(loggedInUser));
		
		modelAndView.setViewName("todo_list");
		return modelAndView;*/
		
		RedirectView redirectView = new RedirectView("/todo/list");
		
		return redirectView;
	}

}
