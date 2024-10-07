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

<%
ProjectDTO dto= (ProjectDTO)request.getAttribute("dto");
List<Integer> lf=(List<Integer>)request.getAttribute("lfinished");
List<Integer> luf=(List<Integer>)request.getAttribute("lunfinished");
int lfsize =lf.size();
int lufsize=luf.size();

%>
<div class="div1" >
<h1>Project<%=dto.getId()%></h1><br>
<h3>Summary : <%=lfsize%>/<%=lfsize+lufsize%> todos completed</h3>

<h2> Pending</h2>
<%Iterator<Integer> itr=luf.iterator();
int i=1;

while (itr.hasNext()) 
{%>
	
	<label >Task<%=itr.next()%></label>
<%}
	%>

<h2> Completed</h2>
<%Iterator<Integer> itr1=lf.iterator();
while (itr1.hasNext()) 
{%>
		<label >Task<%=itr1.next() %> </label><br>
<%}
	
	%>
	<a href="${pgeContext.request.contextPath}/pages/home.jsp">Menu</a><br><br>
	</div>
</body>
</html>