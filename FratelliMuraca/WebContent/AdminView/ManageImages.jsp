<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<%
LinkedList<ProductBean> listaProdotti = (LinkedList<ProductBean>) request.getAttribute("listaProdotti");
LinkedList<ImageBean> listaImmagini = (LinkedList<ImageBean>) request.getAttribute("listaImmagini");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestione immagini</title>
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
  #drop-area img {
    max-width: 100px;
    max-height: 100px;
    display: none;
    margin-top: 10px;
  }
</style>
</head>
<body>

<form action="manageImages" method="POST" enctype="multipart/form-data">
  <label for="prodotti">ID PRODOTTO</label>
  <select name="idProdotto" id="prodotti">
    <%for (ProductBean prodotto : listaProdotti) {%>
      <option value="<%= prodotto.getId() %>"><%= prodotto.getId() %>, <%= prodotto.getNome() %></option>
    <%}%>
  </select>

  <br><br>
  
  <label for="immagine">Inserisci immagine</label>
  <input name="immagine" type="file" id="immagine" class="form-control-file" accept="image/png, image/gif, image/jpeg">
  
  <br><br>

  <!-- Area per il drag-and-drop -->
  <div id="drop-area">
    Trascina qui l'immagine
  </div>

  <input type="submit" value="Carica">
</form>

<br><br><br>

<table>
  <thead>
    <tr>
      <th>id_immagine</th>
      <th>immagine</th>
      <th>id_prodotto</th>
      <th>action</th>  
    </tr>
  </thead>
  <tbody>
    <% for (ImageBean immagine : listaImmagini) {%>
    <tr>
      <td><%= immagine.getId() %></td>    
      <td><img src="/FratelliMuraca/imageServlet?img=<%= immagine.getId() %>"></td>
      <td><%= immagine.getProductId() %></td>
      <td><a href="./manageImages?id=<%= immagine.getId() %>">Rimuovi</a></td>  
    </tr>
    <% } %>
  </tbody>
</table>

<script>
  // Gestione drag-and-drop
  const dropArea = document.getElementById('drop-area');
  const fileInput = document.getElementById('immagine');

  // Prevenire l'azione di default per eventi di drag-and-drop
  ;['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, preventDefaults, false)
    document.body.addEventListener(eventName, preventDefaults, false)
  });

  function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
  }

  // Evidenzia area di drop quando un file viene trascinato sopra
  ;['dragenter', 'dragover'].forEach(eventName => {
    dropArea.addEventListener(eventName, () => dropArea.classList.add('dragging'), false)
  });

  ;['dragleave', 'drop'].forEach(eventName => {
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
      imgPreview.style.display = 'block'; // Mostra l'anteprima
    }
  }
</script>

</body>
</html>
