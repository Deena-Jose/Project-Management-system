<%@page import="com.demo.user.Model.ToDoListDTO"%>
<%@page import="java.util.Iterator"%>
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
<div class="div5" >
<%
ProjectDTO dto= (ProjectDTO)request.getAttribute("dto");
if(dto==null)
{
%>
<h1>Project dosen't exist</h1>
<a href="${pgeContext.request.contextPath}/pages/home.jsp">Menu</a><br><br>
<%
}
else
{
%>

<h1>Project Details</h1>
<div class="div6">
<table border="">
<tr><td>Id</td><td><%=dto.getId() %></td></tr>
<tr><td>Title </td><td><%=dto.getTitle() %></td></tr>
<tr><td>Created Date </td><td><%=dto.getCreatedDate()%></td></tr>
<%List<ToDoListDTO> l=dto.getTodos();
Iterator<ToDoListDTO> itr=l.iterator();
int i=0;
while (itr.hasNext()) 
{
	ToDoListDTO tdto=itr.next();
	i++;
%>
<tr><th colspan="2"> ToDo<%=i%></th></tr>
<tr> <td>Description</td><td><%=tdto.getDescription() %></td></tr>
 <tr><td>Status</td><td><%=tdto.getStatus() %></tr>
 <tr><td>Created Date</td><td><%=tdto.getCreatedDate() %></td></tr>
 <tr><td>Updated Date</td><td><%=tdto.getUpdatedDate() %></td></tr>
 <tr><td>
 <a href="edit?id=<%=tdto.getId()%>"> Edit TO DO</a></td><td>
<a href="deleteTodo?id=<%=tdto.getId()%>"> Remove TO DO</a></td></tr>

 <%} %>
 </table><br>
<a href="addTodo?id=<%=dto.getId()%>"> Add TO DO</a><br>
<a href="viewSummary?id=<%=dto.getId()%>">Get Summary</a><br>
</div>
<%} %>
</div>
</body>
</html>