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
                                <textarea class="form-control" id="message" name="message" rows="4" placeholder="Scrivi qui il tuo messaggio" required></textarea>
                            </div>
                            <button type="submit" class="btn u-custom-color-5">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>

		<section class="container my-5">
		    <div class="embed-responsive embed-responsive-16by9">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3102.1341553974507!2d16.27606152637361!3d38.966604592616974!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133fe5b9026eb951%3A0x4ae99a21a20554ee!2sPiazza%205%20Dicembre%2C%2088046%20Lamezia%20Terme%20CZ!5e0!3m2!1sen!2sit!4v1719519092382!5m2!1sen!2sit" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>		    </div>
		</section>


    </main>

<%@ include file="parts/footer.jsp" %>

</html>