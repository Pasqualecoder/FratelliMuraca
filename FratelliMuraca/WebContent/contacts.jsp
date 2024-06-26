<!DOCTYPE html>
<html lang="it">
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>

<head>
    <%@ include file="parts/head.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="Sample Headline, Contact Us">
    <meta name="description" content="">
    <title>Pagina 1</title>
</head>

<body class="bg-light">
<%@ include file="parts/navbar.jsp" %>

	 
    
    <main>
        <section class="container my-5 text-center">
            <img src="images/Screenshot2024-06-25075306.png" class="img-fluid" alt="Screenshot">
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
                        <div class="social-icons">
                            <a href="#" class="btn btn-outline-primary btn-circle"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="btn btn-outline-primary btn-circle"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="btn btn-outline-primary btn-circle"><i class="fab fa-instagram"></i></a>
                        </div>
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

        <section class="u-custom-color-5 py-5 text-center">
            <div class="container">
                <h2>Sample Headline</h2>
                <p>Sample text. Click to select the Text Element.</p>
                <form action="https://forms.nicepagesrv.com/v2/form/process" method="POST" class="form-inline justify-content-center mt-3">
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="name-inline" class="sr-only">Name</label>
                        <input type="text" class="form-control" id="name-inline" name="name" placeholder="Enter your Name" required>
                    </div>
                    <button type="submit" class="btn btn-light mb-2">Submit</button>
                </form>
            </div>
        </section>
    </main>

    <footer class="u-footer bg-dark text-white py-3 text-center">
        <div class="container">
            <p>Testo di esempio. Fai clic per selezionare l'Oggetto di Testo.</p>
        </div>
    </footer>

    <section class="text-center py-2 bg-secondary text-white">
        <p>This site was created with the <a href="https://nicepage.com/" class="text-white" target="_blank" rel="nofollow">Nicepage</a></p>
    </section>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>