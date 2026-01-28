<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form for testing ....</title>
</head>
<body>
<h2>Testing Data-base methods - ... </h2>
<h3>Insert method working testing - </h3>
<form action="../TestServlet" method="GET">
<label>Name : </label> <input type="text" id="name"  name = "name" required="required">
<label>Age : </label> <input type= "number" id="age" name = "age" required="required">
<input type="submit">
</form>

</body>
</html>