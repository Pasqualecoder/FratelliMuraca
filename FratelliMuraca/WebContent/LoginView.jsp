<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>


<!DOCTYPE html>
<html>
<head><title>Login - Fratelli Muraca</title></head>
<%@ include file="parts/head.jsp" %>
<%@ include file="parts/navbar.jsp" %>
<body>
	<% 
	// Se la creazione è andata a buon fine l'attributo creationState viene settato a true per far vedere un messaggio di successo
	Boolean creationState = (Boolean) request.getAttribute("creationState");
	if(creationState != null) { 
			if (creationState.booleanValue() == true) {%>
				<div class="p-3 mb-2 bg-success text-white">Operazione completata con successo. Effettua l'accesso</div>
				
			<%}
			else {%>
				<div class="p-3 mb-2 bg-danger text-white">Errore durante la creazione dell'account. Riprova più tardi</div>
	
			<%}
	 }%>
    
    <h1 class="font-italic text-center">Login</h1>
    <form class="col-sm-4 mx-auto mt-4" method="POST" action="login">
        <!-- Email input -->
        <div data-mdb-input-init class="form-outline mb-4">
            <label class="form-label" for="form2Example1">Indirizzo Email</label>
            <input name="email" type="email" id="form2Example1" class="form-control" />
        </div>
    
        <!-- Password input -->
        <div data-mdb-input-init class="form-outline mb-4">
		    <label class="form-label" for="form2Example2">Password</label>
		    <div class="input-group">
		        <input name="pwd" type="password" id="form2Example2" class="form-control" />
		        <span class="input-group-text" id="togglePassword">
		            <i class="fa fa-eye-slash" aria-hidden="true"></i>
		        </span>
		    </div>
		</div>

    
        <!-- 2 column grid layout for inline styling -->
        <div class="row mb-4">
            <div class="col d-flex justify-content-center">
                <!-- Checkbox -->
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                    <label class="form-check-label" for="form2Example31"> Remember me </label>
                </div>
            </div>
    
            <div class="col">
                <a href="home/?page=contacts">Password Dimenticata?</a>
            </div>
        </div>
        
        <div class="mb-3">
            <a href="register">Non Ancora Registrato?</a>
        </div>
    
        <!-- Submit button -->
        <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-success btn-block mb-4"">Log in</button>
    </form>


<script>
	// show password
    document.getElementById('togglePassword').addEventListener('click', function() {
        const pwdField = document.getElementById('form2Example2');
        const icon = this.querySelector('i');
        
        // Toggle the type attribute
        if (pwdField.type === 'password') {
            pwdField.type = 'text';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        } else {
            pwdField.type = 'password';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        }
    });
</script>


<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="parts/footer.jsp" %>
</body>
</html>