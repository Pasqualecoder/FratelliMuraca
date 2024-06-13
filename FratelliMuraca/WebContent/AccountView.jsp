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
            <h3 >I tuoi dati</h3>
        </div>
        <div class="card-body">
            <form id="userDataForm">
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="name">Nome</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="name" name="name" value="<%= session.getAttribute("name") %>" disabled>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-primary" onclick="toggleEdit('name')">Modifica</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="surname">Cognome</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="surname" name="surname" value="<%= session.getAttribute("surname") %>" disabled>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-primary" onclick="toggleEdit('surname')">Modifica</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="email">Email</label>
                        <div class="input-group">
                            <input type="email" class="form-control" id="email" name="email" value="<%= session.getAttribute("email") %>" disabled>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-primary" onclick="toggleEdit('email')">Modifica</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="birthdate">Data di Nascita</label>
                        <div class="input-group">
                            <input type="date" class="form-control" id="birthdate" name="birthdate" value="<%= session.getAttribute("ddn") %>" disabled>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-primary" onclick="toggleEdit('birthdate')">Modifica</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="password">Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="password" name="password" value="<%= session.getAttribute("password") %>" disabled>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-primary" onclick="toggleEdit('password')">Modifica</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="phone">Numero di Telefono</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="phone" name="phone" value="<%= session.getAttribute("phone") %>" disabled>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-outline-primary" onclick="toggleEdit('phone')">Modifica</button>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-success mt-3" style="background-color: #5f720f;">Salva Modifiche</button>
            </form>
        </div>
    </div>
</div>

<!-- Script per abilitare/disabilitare la modifica dei campi -->
<script>
    function toggleEdit(fieldId) {
        var field = document.getElementById(fieldId);
        if (field.disabled) {
            field.disabled = false;
            field.focus();
        } else {
            field.disabled = true;
        }
    }
</script>

<!-- Bootstrap and jQuery scripts -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<%@ include file="parts/footer.jsp" %>
</body>
</html>