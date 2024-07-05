<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../parts/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Admin - Fratelli Muraca</title>
    <!-- Include Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;

            if (username.trim() === '' || password.trim() === '') {
                alert("Riempi i campi");
                return false;
            }

            return true;
        }
    </script>
</head>
<body style="background-color: #f8f9fa;">
    <div class="container">
        <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
            <div id="login-container" class="col-md-6" style="background-color: #fff; border: 1px solid #ccc; padding: 20px;">
                <div class="page-title text-center mb-4">Admin Login</div>
                <form action="login" method="POST" onsubmit="return validateForm()">
                    <div class="form-item">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" class="form-control">
                    </div>
                    <div class="form-item">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-success btn-block mt-4">Log in</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>