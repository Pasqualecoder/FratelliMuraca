<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8"%>
<%
LinkedList<ProductBean> listaProdotti = (LinkedList<ProductBean>) request.getAttribute("listaProdotti");
LinkedList<ImageBean> listaImmagini = (LinkedList<ImageBean>) request.getAttribute("listaImmagini");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestione Immagini Admin - Fratelli Muraca</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style>
  /* Aggiungi un po' di stile per l'area di drag-and-drop */
  #drop-area {
    border: 2px dashed #ccc;
    border-radius: 10px;
    width: 300px;
    height: 100px;
    font-family: sans-serif;
    text-align: center;
    line-height: 100px;
    margin: 20px auto;
    background-color: #f9f9f9;
  }
  #drop-area.dragging {
    border-color: #000;
  }
  /* Stile per le immagini nella tabella */
  .img-thumbnail {
    max-width: 200px; /* Imposta la larghezza massima delle immagini */
    max-height: 200px; /* Imposta l'altezza massima delle immagini */
  }
</style>
</head>
<body>
<div class="container">
	<a class="mt-4 btn btn-lg btn-warning go-back" href="dashboard">&#171; Dashboard</a>
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <h1 class="mt-4 mb-4 font-weight-bold">Gestione Immagini</h1>
        </div>
    </div>
</div>

<form action="manageImages" method="POST" enctype="multipart/form-data" class="container mt-4">
  <div class="form-group">
    <label for="prodotti">ID PRODOTTO</label>
    <select name="idProdotto" id="prodotti" class="form-control">
      <% for (ProductBean prodotto : listaProdotti) { %>
        <option value="<%= prodotto.getId() %>"><%= prodotto.getId() %>, <%= prodotto.getNome() %></option>
      <% } %>
    </select>
  </div>

  <div class="form-group">
    <label for="immagine">Inserisci immagine</label>
    <input name="immagine" type="file" id="immagine" class="form-control-file" accept="image/png, image/gif, image/jpeg">
  </div>

  <!-- Area per il drag-and-drop -->
  <div id="drop-area" class="border rounded p-4">
    Trascina qui l'immagine
  </div>

  <input type="submit" value="Carica" class="btn btn-success mt-3">
</form>

<div class="container mt-4">
  <table class="table">
    <thead>
      <tr class="font-weight-bold text-bold">
        <th>ID Immagine</th>
        <th>Immagine</th>
        <th>ID Prodotto</th>
        <th>Action</th>  
      </tr>
    </thead>
    <tbody>
      <% for (ImageBean immagine : listaImmagini) { %>
      <tr>
        <td><%= immagine.getId() %></td>    
        <td><img src="/FratelliMuraca/imageServlet?img=<%= immagine.getId() %>" class="img-thumbnail"></td>
        <td><%= immagine.getProductId() %></td>
        <td><a href="./manageImages?id=<%= immagine.getId() %>" class="btn btn-sm btn-danger">Rimuovi</a></td>  
      </tr>
      <% } %>
    </tbody>
  </table>
</div>



<script>
  // Gestione drag-and-drop
  const dropArea = document.getElementById('drop-area');
  const fileInput = document.getElementById('immagine');

  // Prevenire l'azione di default per eventi di drag-and-drop
  ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, preventDefaults, false)
    document.body.addEventListener(eventName, preventDefaults, false)
  });

  function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
  }

  // Evidenzia area di drop quando un file viene trascinato sopra
  ['dragenter', 'dragover'].forEach(eventName => {
    dropArea.addEventListener(eventName, () => dropArea.classList.add('dragging'), false)
  });

  ['dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, () => dropArea.classList.remove('dragging'), false)
  });

  // Gestione del drop
  dropArea.addEventListener('drop', handleDrop, false);

  function handleDrop(e) {
    const dt = e.dataTransfer;
    const files = dt.files;

    // Prendi solo il primo file se ce ne sono più di uno
    if (files.length > 0) {
      fileInput.files = files; // Metti il file nel file input

      // Mostra l'anteprima dell'immagine
      const imgPreview = document.createElement('img');
      imgPreview.src = URL.createObjectURL(files[0]);
      imgPreview.onload = () => {
        URL.revokeObjectURL(imgPreview.src); // Libera la memoria
      }
      dropArea.innerHTML = ''; // Rimuovi il testo "Trascina qui l'immagine"
      dropArea.appendChild(imgPreview); // Aggiungi l'anteprima dell'immagine
      imgPreview.classList.add('img-thumbnail'); // Aggiungi classe Bootstrap per le miniature delle immagini
    }
  }
</script>

</body>
</html>
