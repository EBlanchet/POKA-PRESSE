<?php
    include("header.php");
    include("poka_connexion.php"); 
?>

<div class="barre">
    <a class="active" href="Poka_pigiste.php">Accueil</a>
    <a href="publications.php">Publications</a>
    <a href="en_attente.php">En attente</a>
    <a href="rubriques.php">Rubriques</a>
</div>

<div id="page">
  <div id="corps">
      <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3>
      <h2>
      <form action="Poka_presse1.php" method="POST" >
        <input type = "submit" name = "deconnexion" value = "Déconnexion"/>
        <?php 
          if (isset($_POST['deconnexion'])){
            session_destroy();
          }
        ?>
      </form>
      </h2>
  </div>

<h2>
  <?php 
    $mat = $_SESSION['matricule'];
    if ($mat){
        $personne = $cnx->query('select nom, prenom from Acteurs where Acteurs.matricule = \''.$mat.'\';');
        foreach($personne as $ligne){
          echo "<h3 class = 'centered'>Bonjour ".$ligne['prenom']." ravi de vous revoir !</h3>";
        }
    }
  ?> 
</h2>
  
<br/>
<br/>
<?php include("footer.php"); ?>