package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.model.Todo;
import com.example.model.User;

@Repository("todoRepository")
public interface TodoRepository extends JpaRepository<Todo, Integer> {

	@Query(value="select td from Todo td where td.creator = :creator and td.isDeleted = false order by td.id desc")
	List<Todo> findByCreator(@Param("creator") User creator);

}
