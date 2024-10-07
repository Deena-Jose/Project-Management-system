package com.demo.user.Service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import com.demo.user.Model.ProjectDTO;
import com.demo.user.Model.UserDTO;

@Repository
public interface ProjectRepo extends JpaRepository<ProjectDTO,Integer>  {

	ProjectDTO findByTitle(String title);
	
   

}
