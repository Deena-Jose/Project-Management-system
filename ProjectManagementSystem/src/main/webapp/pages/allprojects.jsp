<%@page import="java.util.Iterator"%>
<%@page import="com.demo.user.Model.ProjectDTO"%>
<%@page import="java.util.List"%>
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
<div class="div1" >

<%
List<ProjectDTO> l = (List<ProjectDTO>)request.getAttribute("list");
if (l.isEmpty())
{
%>
<h1>Project List is empty</h1>
<a href="${pgeContext.request.contextPath}/pages/addproject.jsp">Create  a Project</a><br><br>
<%
}
else{
	%>
<h1>PROJECT LIST </h1>
<%

Iterator<ProjectDTO> itr=l.iterator();
%>
<table border="1px">
<tr><td>ID</td><td>Title</td><td>Created Date</td><td>To Dos</td></tr>
<% 
while (itr.hasNext()) 
{
	ProjectDTO p=(ProjectDTO)itr.next();
%>
<tr><td><%=p.getId()%></td><td><%=p.getTitle()%></td><td><%=p.getCreatedDate()%></td><td><%=p.getTodos()%></td></tr>
<%} %>
</table>
<a href="${pgeContext.request.contextPath}/pages/home.jsp">Menu</a><br><br>
<%} %>
</div>
</body>
</html>