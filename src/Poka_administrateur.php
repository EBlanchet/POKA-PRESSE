<?php 
    include("header.php");
    include("poka_connexion.php"); 
?>

<div class="barre">
    <a class="active" href="Poka_administrateur.php">Accueil</a>
    <a href="publications.php">Publications</a>
    <a href="assemblage.php">Assemblage</a>
    <a href="en_attente.php">En attente</a>
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

<form action="" method="POST" >
  <?php
    $mat = $_SESSION['matricule'];
    echo "<h3 class = 'centered'>Bonjour ravi de vous revoir !</h3>";
  ?> 
  
</form>
  
<br/>
<br/>
<?php include("footer.php"); ?>