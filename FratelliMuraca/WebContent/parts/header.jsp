<!-- Header-->
<header style="background-color: #607244">
    <div id="logo-container" class="container px-4 px-lg-5 my-5" style="background-color: #607244">
        <div class="text-center">
            <img id="logo" alt="logo" src="media/logo.png" >
        </div>
    </div>
</header>

<style>
/* Stili per il logo */
#logo-container {
    transition: transform 0.3s ease;
}
</style>

<script>
    // Funzione per gestire lo scroll
    window.addEventListener('scroll', function() {
        var logoContainer = document.getElementById('logo-container');
        var scrolled = window.scrollY;

        // Calcola la scala in base alla posizione dello scroll
        var scale = 1 - (scrolled / 500); // Modifica il valore 500 a seconda di quanto vuoi che l'effetto sia pronunciato

        // Limita il valore della scala
        if (scale < 0.5) {
            scale = 0.5; // Modifica il valore minimo della scala se necessario
        }

        // Applica la trasformazione di scala all'intero contenitore del logo
        logoContainer.style.transform = 'scale(' + scale + ')';
    });
</script>