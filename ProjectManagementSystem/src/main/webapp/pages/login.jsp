<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>project Management System</title>
<link rel='stylesheet' type="text/css" href="../pages/style.css">
</head>

<body>
<div class="div1" >

<div class="div2">
<form action="home">
<h1>${failed}</h1>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <h1>LOGIN</h1><br><br>
<table >
<tr><td>User Name </td><td> <input type="text" name="uname"></td></tr>
<tr><td>Password</td><td> <input type="text" name="password"></td></tr>
<tr><td colspan="2"><input type="submit" value="submit"></td></tr>
</table>
</form>
</div>

<div class="div3">
<form action="addUser">
<h1>NEW USER?SIGN UP FIRST</h1><br><br>
<table>
<tr><td>User Name</td><td><input type="text" name="uname"></td></tr>
<tr><td>Mail Id</td><td><input type="text" name="mailId"></td></tr>
<tr><td>Password</td><td><input type="text" name="password"></td></tr>
<tr><td colspan="2"><input type="submit"></td></tr>
</table>
</form>
</div>
</div>
</body>
</html>