<%@page import="java.util.Iterator"%>
<%@page import="com.demo.user.Model.ToDoListDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.user.Model.ProjectDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' type="text/css" href="../pages/style.css">
</head>
<body>
<%
ProjectDTO dto= (ProjectDTO)request.getAttribute("dto");
%>
<div class="div5" >
<form action="addTodoAnother">
<input type="hidden" name="pid" value="<%= dto.getId() %>">
<%List l =dto.getTodos();
Iterator<ToDoListDTO> itr=l.iterator();
int i=1;
%>

<b>Existing ToDos</b><br>
<% 
while (itr.hasNext()) 
{
	ToDoListDTO tdto=itr.next();
%>

TO DO<%=i%><br>
Description :<%=tdto.getDescription() %><br>
Status:<%=tdto.getStatus() %><br>
Created Date :<%=tdto.getCreatedDate() %><br>
Updated Date:<%=tdto.getUpdatedDate() %><br><br><br>
<% i++;
} %>
<h4>Enter ToDo Details</h4>
Description <input type="text" name="description"><br><br>
Status Status <select name="status">
<option value="completed">completed</option>
<option value="pending">pending</option>
</select><br><br>
Created Date <input type="text" name="createdDate"><br><br>
Updated Date <input type="text" name="updatedDate"><br><br>
<input type="submit" value="submit"><br>
<a href="viewProject?title=<%=dto.getTitle()%>">VIEW PROJECT</a><br><br>
</form>
</div>
</body>
</html>