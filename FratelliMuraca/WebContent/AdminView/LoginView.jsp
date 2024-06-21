<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/admin_style.css">
<meta charset="UTF-8">
<title>Login Admin - Fratelli Muraca</title>

</head>
<body>
<form action="admin" method="POST">

<div class="login-container central-container">
       	<div class="container-title">
        Login
    	</div>
        
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password">
                </div>
                <button type="submit" class="login-button">Login</button>
        
    </div>
</form>
</body>
</html>