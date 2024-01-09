<?php 
    include("poka_connexion.php"); 
    include("header.php");
?>

<div class="barre">
  <?php
        $mot_de_passe = $_SESSION['mdp'];
        if ($mot_de_passe == 'LaRedaction123'){
          echo "<a href='Poka_redacteur.php'>Accueil</a>";
        }
        if ($mot_de_passe == 'Admin123'){
          echo "<a href='Poka_administrateur.php'>Accueil</a>";
        }
    ?>
    <a class = "active" href = "assemblage.php">Assemblage</a>
</div>

<div id="page">
  <div id="corps">
      <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3>
  </div>

<form action="" method="POST" >
  <input type = 'radio' name = 'choix' id = 'Choix articles' value = 'Choix articles'/><label for = 'Choix articles'>Choix articles</label><br/><br/>
  <input type = 'radio' name = 'choix' id = 'Choix prochain numero' value = 'Choix prochain numero'/><label for = 'Choix prochain numero'>Choix prochain numéro</label><br/><br/>
  <!--<input type = 'radio' name = 'choix' id = 'Choix version maquette' value = 'Choix version maquette'/><label for = 'Choix version maquette'>Choix version maquette</label><br/><br/>-->
  <input type = "submit" value = "valider"/><br/><br/>
   
  <?php
    $choix = isset($_POST['choix']);
    if($choix){
      if ($_POST['choix'] == "Choix articles"){
        header('Location: choix_article.php');
        exit();
      }
      if ($_POST['choix'] == "Choix prochain numero"){
        header('Location: choix_numero.php');
        exit();
      }
      //if ($_POST['choix'] == "Choix version maquette"){
      //}
    }
  ?> 
  
  </form> 
  
<br/>
<br/>
<?php include("footer.php"); ?>