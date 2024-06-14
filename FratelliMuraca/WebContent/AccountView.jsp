<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>
<%@ include file="parts/navbar.jsp" %>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header text-white" style="background-color: #5f720f;">
            <h3>I tuoi dati</h3>
        </div>
        <div class="card-body">
            <form id="userDataForm" action="modificaDati" method="POST" onsubmit="return validate()">
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="name">Nome</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="name" name="name" value="<%= session.getAttribute("name") %>" disabled>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="surname">Cognome</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="surname" name="surname" value="<%= session.getAttribute("surname") %>" disabled>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="email">Email</label>
                        <div class="input-group">
                            <input type="email" class="form-control" id="email" name="email" value="<%= session.getAttribute("email") %>" disabled>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="birthdate">Data di Nascita</label>
                        <div class="input-group">
                            <input type="date" class="form-control" id="birthdate" name="birthdate" value="<%= session.getAttribute("ddn") %>" disabled>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="password">Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="password" name="password" value="<%= session.getAttribute("password") %>" disabled>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="phone">Numero di Telefono</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="phone" name="phone" value="<%= session.getAttribute("phone") %>" disabled>
                        </div>
                    </div>
                </div>
                <button type="button" id="editBtn" class="btn btn-success mt-3" style="background-color: #5f720f;">Modifica i Dati</button>
                <button type="submit" id="saveBtn" class="btn btn-primary mt-3" style="display: none;">Salva i Dati</button>
            </form>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        $('#editBtn').click(function() {
            $('#userDataForm input').prop('disabled', false);
            $('#editBtn').hide();
            $('#saveBtn').show();
        });
    });
    
    function validate() {
        var valid = true;

        // Reset errors
        document.getElementById("nomeError").innerText = "";
        document.getElementById("cognomeError").innerText = "";
        document.getElementById("emailError").innerText = "";
        document.getElementById("phoneError").innerText = "";
        document.getElementById("pwdError").innerText = "";
        document.getElementById("ageMessage").innerText = "";

        // Validate Nome
        var nome = document.getElementById("nome").value.trim();
        if (nome === "") {
            document.getElementById("nomeError").innerText = "Inserisci il tuo nome.";
            valid = false;
        }
        
     // Validate Cognome
        var cognome = document.getElementById("cognome").value.trim();
        if (cognome === "") {
            document.getElementById("cognomeError").innerText = "Inserisci il tuo cognome.";
            valid = false;
        }

        // Validate Email
        var email = document.getElementById("email").value.trim();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email === "") {
            document.getElementById("emailError").innerText = "Inserisci una Mail";
            valid = false;
        } else if (!emailRegex.test(email)) {
            document.getElementById("emailError").innerText = "Inserisci un'email valida.";
            valid = false;
        } 
    	
        var dob = new Date(document.getElementById("dob").value);
        var today = new Date();
        var age = today.getFullYear() - dob.getFullYear();
        var month = today.getMonth() - dob.getMonth();
        if (month < 0 || (month === 0 && today.getDate() < dob.getDate())) {
            age--;
        }
        if (age < 18) {
            document.getElementById("ageMessage").innerText = "Inserisci una data di nascita corretta";
            valid = false;
        }

        // Validate Password
        var password = document.getElementById("pwd").value.trim();
        var pwdRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
        if (password === "") {
            document.getElementById("pwdError").innerText = "Inserisci una password.";
            valid = false;
        } else if (!pwdRegex.test(password)) {
            document.getElementById("pwdError").innerText = "La password deve avere almeno 8 caratteri, un numero, una lettera maiuscola e una minuscola.";
            valid = false;
        }
        
        var phone = document.getElementById("phone").value.trim();
        var phoneRegex = /^\d{10}$/;
        if (phone === "") {
            document.getElementById("phoneError").innerText = "Inserisci il tuo numero di telefono.";
            valid = false;
        } else if (!phoneRegex.test(phone)) {
            document.getElementById("phoneError").innerText = "Inserisci un numero di telefono valido (10 cifre).";
            valid = false;
        }

        return valid;
    }
</script>

<%@ include file="parts/footer.jsp" %>
</body>
</html>