<%@page import="com.demo.user.Model.ToDoListDTO"%>
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
ToDoListDTO tdto= (ToDoListDTO)request.getAttribute("dto");
%>
<div class="div4" >
<form action="editnew">
<input type="hidden" name="id" value="<%= tdto.getId() %>">
<h4> Description :<input type="text" name="description" value= "<%=tdto.getDescription() %>"></h4><br><br>
<h4> Status:<input type="text"  name="status" value= "<%=tdto.getStatus() %>"></h4><br><br>
<h4> Created Date :<input type="text" name="createdDate" value= "<%=tdto.getCreatedDate() %>"></h4><br><br>
<h4> Updated Date:<input type="text" name="updatedDate" value= "<%=tdto.getUpdatedDate() %>"></h4><br><br>
<input type="submit" value="submit">
</form>
</div>
</body>
</html>