package com.demo.user.Service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.demo.user.Model.ProjectDTO;
import com.demo.user.Model.ToDoListDTO;

@Repository
public interface ToDoRepo extends JpaRepository<ToDoListDTO,Integer> {

}
