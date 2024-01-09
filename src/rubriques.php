<?php 
    include("poka_connexion.php"); 
    include("header.php");
?>

<div class="barre">
    <?php
        $mot_de_passe = $_SESSION['mdp'];
        if ($mot_de_passe == 'LaMaquette123'){
            echo "<a href='Poka_maquettiste.php'>Accueil</a>";
        }
        if ($mot_de_passe == 'LesPages123'){
          echo "<a href='Poka_pigiste.php'>Accueil</a>";
        }
        if ($mot_de_passe == 'Admin123'){
          echo "<a href='Poka_administrateur.php'>Accueil</a>";
        }
    ?>
    <a class = "active" href = "rubriques.php">Rubriques</a>
</div>

<div id="page">
  <div id="corps">
      <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3>
  </div>

  <h2>Rubriques</h2>
<?php
    $rubriques = $cnx->query("select * from Rubrique;");
    foreach($rubriques as $ligne){
        echo $ligne['numrubrique']."  ".$ligne['titre_rubrique']."</br>";
    }
?>
  
<br/>
<br/>
<?php include("footer.php"); ?>