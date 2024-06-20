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

<div class="login-container" id="login-container">
        <div class="login-header" id="login-header">
            <span class="header-text">Login</span>
        </div>
        <div class="login-body">
            <form>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password">
                </div>
                <button type="submit" class="login-button">Login</button>
            </form>
        </div>
    </div>
</form>
    <script src="./js/admin-script.js"></script>
</body>
</html>