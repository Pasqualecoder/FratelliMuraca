<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/admin_style.css">
<meta charset="ISO-8859-1">
<title>login admin Fratelli Muraca</title>

</head>
<body>
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

    <script src="./js/admin-script.js"></script>
</body>
</html>