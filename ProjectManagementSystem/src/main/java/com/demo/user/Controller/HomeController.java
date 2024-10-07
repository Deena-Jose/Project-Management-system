package com.demo.user.Controller;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.user.Model.ProjectDTO;
import com.demo.user.Model.ToDoListDTO;
import com.demo.user.Model.UserDTO;
import com.demo.user.Service.DAO;

@Controller
public class HomeController {

	@Autowired
	private DAO dao;
		
	@RequestMapping("/login")
	public String home() {
		System.out.println("in controller");
		return "login";
		
	}
	
	@RequestMapping("/home")
		public String login(UserDTO dto , Model m) {
		System.out.println("in controller2");
		//UserDTO dto1=dao.getPasswordByUname(dto.getUname());
		UserDTO dto1=dao.findByUnameAndPassword(dto.getUname(),dto.getPassword());
		if(dto1==null)
		{
		System.out.println("Invalid Username or password");
		m.addAttribute("failed", "Invalied login");
		return "login";
		}
		else
		return "home";
	}
	@RequestMapping("/addUser")
	public String addUser (UserDTO dto) {
		System.out.println("in controller3");
		dao.save(dto);
			return "login";
			}
	@RequestMapping("/pages/addproject1")
	public String addProject1 (@RequestParam("title")String title , @RequestParam("createdDate1")String date ,
			ProjectDTO dto , ToDoListDTO dto1) {
	    dao.save(dto1);
		dto.setTitle(title);
		dto.setCreatedDate(date);
		List<ToDoListDTO> l =new ArrayList<ToDoListDTO>();
		l.add(dto1);
		dto.setTodos(l);
		System.out.println("in controller addprojeect");
		dao.save(dto);
			return "home";
			}
	@RequestMapping("/pages/addTodoAnother")
	public String addTodo (@RequestParam("pid")int id ,ToDoListDTO dto,Model m) {
		System.out.println("in controller dddto");
		ProjectDTO pdto=dao.findProjectById(id).orElse(null);
		//m.addAttribute("dto",dto);
		List<ToDoListDTO> l=pdto.getTodos();
		ToDoListDTO dto1=dao.save(dto);
		l.add(dto1);
		dao.save(pdto);
		m.addAttribute("dto",pdto);
		System.out.println("in controller dddto end");
		return "addtodo";
			}
	@RequestMapping("/pages/listAllProjects")
	public String viewProjects(Model m)
	{
		System.out.println("in controller list");
		List<ProjectDTO> l=dao.getAllProjects();
		System.out.println(l);
		m.addAttribute("list", l);
		return "allprojects";
	}
	@RequestMapping("/listAllProjects")
	public String viewProjects1(Model m)
	{
		System.out.println("in controller list");
		List<ProjectDTO> l=dao.getAllProjects();
		System.out.println(l);
		m.addAttribute("list", l);
		return "allprojects";
	}
	@RequestMapping("/pages/viewProject")
	public String viewProjectByTitle(@RequestParam("title") String title ,Model m)
	{
		System.out.println("in controller list");
		//List<ProjectDTO> l=dao.getAllProjects();
		ProjectDTO dto=dao.findByTitle(title);
		System.out.println(dto);
		m.addAttribute("dto", dto);
		return "projectview";
	}
	@RequestMapping("/pages/edit")
	public String editTodo(@RequestParam("id") int id,Model m)
	{
		System.out.println("edited");
		ToDoListDTO dto=dao.findById(id).orElse(null);
		m.addAttribute("dto",dto);
		return "edit";
		}
	@RequestMapping("/pages/addTodo")
	public String addTodo(@RequestParam("id") int id,Model m )
	{
		System.out.println("deleted");
		ProjectDTO dto=dao.findProjectById(id).orElse(null);
		m.addAttribute("dto",dto);
		return "addtodo";
	}
	
	@RequestMapping("/pages/deleteTodo")
	public String deleteTodo(@RequestParam("id") int id,Model m )
	{
		System.out.println("deleted");
	
		dao.delete(id);
		return "home";
	}
	@RequestMapping("/pages/editnew")
	public String editnew(ToDoListDTO dto ,Model m )
	{
		System.out.println("edited new");
	     dao.save(dto);
			return "home";
	}
	@RequestMapping("/pages/viewSummary")
	public String viewSummary(@RequestParam("id") int id,Model m )
	{
		System.out.println("summry");
		ProjectDTO dto=dao.findProjectById(id).orElse(null);
		List<Integer> lfinished=new ArrayList<Integer>() ;
		List<Integer> lunfinished=new ArrayList<Integer>() ;
		List<ToDoListDTO> l =dto.getTodos();
		Iterator<ToDoListDTO> itr=l.iterator();
		//int i=1;
		while (itr.hasNext()) 
		{
			ToDoListDTO tdto=itr.next();
			if(tdto.getStatus().equals("completed"))
			{
				System.out.println("sum hii");
				lfinished.add(tdto.getId());
				System.out.println("summry helloo");
			}
			else
				lunfinished.add(tdto.getId());
							
		}
		System.out.println(lfinished);
		System.out.println(lunfinished);
		m.addAttribute("lfinished", lfinished);
		m.addAttribute("lunfinished", lunfinished);
		m.addAttribute("dto",dto);
		return "viewsummary";
	}


}
