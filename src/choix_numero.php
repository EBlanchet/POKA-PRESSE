<?php 
    include("poka_connexion.php"); 
    include("header.php");
?>

<div class="barre">
    <a href = "assemblage.php">Assemblage</a>
    <a class = "active" href = "choix_numero.php">Choix numéro</a>
</div>

<div id="page">
  <div id="corps">
      <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3>
  </div>

<h2>Choix numéro (non fonctionnel à ce jour):</h2></br>

  <form action="" method="POST"></br>
    Code Numéro (exemple: PO20LK): <input type="text" name="titre" /><br/></br>
    Titre Numéro : <input type="text" name="titre" /><br/></br>
	Maquettiste : <select name="matricule">
    <?php 
    $mat = $cnx->query("select matricule, nom, prenom from Acteurs where role = 'maquettiste';");
    foreach($mat as $ligne){
        echo "<option value=".$ligne['matricule']." selected = 'selected'>".$ligne['prenom']." ".$ligne['nom']."</option>";
    }
    ?>
    <option value="" selected="selected">-- choix --</option>
    </select><br/></br>
    Rubriques apparaissant dans un numéro :<br/><br/>
    <?php
    $rubriques = $cnx->query("select * from Rubrique;");
    foreach($rubriques as $ligne){
        echo "<input type = 'checkbox' name = 'rubriques_numero' value = ".$ligne['numrubrique']."/><label for = 'rubriques_numero'>".$ligne['titre_rubrique']."</label><br/><br/>";
    }
    ?><br/>

    <input type="reset" name="reset" value="Effacez" /> 
    <input type="submit" name="submit" value="Validez" />
</form>

<?php

?>
  
<br/>
<br/>
<?php include("footer.php"); ?>