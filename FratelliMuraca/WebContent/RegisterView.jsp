<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>


<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>
<%@ include file="parts/navbar.jsp" %>
<body>
    

<div class="row justify-content-center">
        <div class="col-md-6 mt-4">
            <article class="card-body">
                <form action="register" method="POST" onsubmit="return validate()">
                    <div class="form-row">
                        <div class="col form-group">
                            <label>Nome</label>   
                            <input type="text" class="form-control" placeholder="" name="nome" id="nome">
                            <small id="nomeError" class="form-text text-danger"></small>
                        </div> <!-- form-group end.// -->
                        <div class="col form-group">
                            <label>Cognome</label>
                            <input type="text" class="form-control" placeholder=" " name="cognome" id="cognome">
                            <small id="cognomeError" class="form-text text-danger"></small>
                        </div> <!-- form-group end.// -->
                    </div> <!-- form-row end.// -->
                    <div class="form-group">
                        <label>Data di nascita</label>
                        <input type="date" class="form-control" placeholder="" name="ddn" id="dob">
                        <small id="ageMessage" class="form-text text-danger"></small>
                    </div> <!-- form-group end.// -->
                    <div class="form-group">
                        <label>Email address</label>
                        <input type="email" class="form-control" placeholder="" name="email" id="email" onfocusout="checkEmail()">
                        <small id="emailError" class="form-text text-danger"></small>
                        <small class="form-text text-muted">Non condivideremo la tua Email con nessuno</small>
                    </div> <!-- form-group end.// -->
                    <div class="form-group">
                        <label>Numero di telefono</label>
                        <input type="tel" class="form-control" placeholder="" name="phone" id="phone">
                        <small id="phoneError" class="form-text text-danger"></small>
                    </div> <!-- form-group end.// -->
                    <div class="form-group">
                        <label>Create password</label>
                        <input class="form-control" type="password" name="pwd" id="pwd" >
                        <small id="pwdError" class="form-text text-danger"></small>
                    </div> <!-- form-group end.// -->  
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block" style="background-color: #5f720f;" id="submit-button"> Registrati</button>
                    </div> <!-- form-group// -->      
                    <small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br> Terms of use and Privacy Policy.</small>                                          
                </form>
            </article> <!-- card-body end .// -->
            <div class="border-top card-body text-center">Gia' registrato? <a href="login">Log In</a></div>
        </div> <!-- col.//-->
    </div> <!-- row.//-->
<script>

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
        document.getElementById("emailError").innerText = "Inserisci la tua email.";
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
        document.getElementById("ageMessage").innerText = "Devi essere maggiorenne per registrarti.";
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

function checkEmail() {
	var email = document.getElementById('email').value;
	if (email.length === 0) {
        return;
    }
	console.log(email);
	
	var xhr = new XMLHttpRequest();
	xhr.open('GET', 'verify?email=' + encodeURIComponent(email), true)
	
	 xhr.onreadystatechange = function () {

		if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.exists) {
            	document.getElementById("emailError").innerText = "Questa email e' gia' stata usata";
            	document.getElementById("submit-button").disabled = true;
            }
            else {
            	document.getElementById("emailError").innerText = "";
            	document.getElementById("submit-button").disabled = false;
            }
        }
    };
    xhr.send();
}
</script>


</script>



<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="parts/footer.jsp" %>
</body>
</html>