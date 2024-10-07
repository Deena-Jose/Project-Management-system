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
<div class="div5">
<form action="addproject1">
<h1>Enter Project Details</h1><br><br>
Project Title <input type="text" name="title"><br><br>
Created Date <input type="text" name="createdDate1"><br><br>
<h3>ToDo 1</h3><br><br>
Description <input type="text" name="description"><br><br>
Status <select name="status">
<option value="completed">completed</option>
<option value="pending">pending</option>
</select><br><br>
Created Date <input type="text" name="createdDate"><br><br>
Updated Date <input type="text" name="updatedDate"><br><br>

<input type="submit" value="submit">
</form>
</div>
</body>
</html>