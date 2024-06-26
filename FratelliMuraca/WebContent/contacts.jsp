<!DOCTYPE html>
<html lang="it">
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>

<head>
    <%@ include file="parts/head.jsp" %>
    <title>Pagina 1</title>
</head>

<body class="bg-light">
<%@ include file="parts/navbar.jsp" %>

	 
    
    <main>
        <section class="container my-5 text-center">
            <h2 class="my-4">CONTATTACI</h2>
            <p>Per qualsiasi dubbio siamo a disposizione</p>
        </section>

        <section class="u-custom-color-2 py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2>Contattaci</h2>
                        <p>Sample text. Click to select the Text Element.</p>
                        <p><strong>Phone:</strong> <a href="tel:88002534236" class="u-text-palette-1-base">8 800 2534 236</a></p>
                        <p><strong>Send Email:</strong> <a href="mailto:email@example.com" class="u-text-palette-1-base">email@example.com</a></p>
                        <p><strong>Address:</strong> Calabria</p>
                    </div>
                    <div class="col-md-6">
                        <form action="https://forms.nicepagesrv.com/v2/form/process" method="POST" class="bg-white p-4 rounded">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your Name" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter a valid email address" required>
                            </div>
                            <div class="form-group">
                                <label for="message">Message</label>
                                <textarea class="form-control" id="message" name="message" rows="4" placeholder="Enter your message" required></textarea>
                            </div>
                            <button type="submit" class="btn u-custom-color-5">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <section class="container my-5">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="https://maps.google.com/maps?output=embed&amp;q=Manhattan%2C%20New%20York&amp;z=10&amp;t=m"></iframe>
            </div>
        </section>

    </main>

<%@ include file="parts/footer.jsp" %>

</html>