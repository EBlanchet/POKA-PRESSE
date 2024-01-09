<?php 
    include("header.php");
    include("poka_connexion.php"); 
?>

<div class="barre">
    <?php
        $mot_de_passe = $_SESSION['mdp'];
        if ($mot_de_passe == 'LesPages123'){
          echo "<a href='Poka_pigiste.php'>Accueil</a>";
        }
        if ($mot_de_passe == 'LaRedaction123'){
          echo "<a href='Poka_redacteur.php'>Accueil</a>";
        }
        if ($mot_de_passe == 'Admin123'){
          echo "<a href='Poka_administrateur.php'>Accueil</a>";
        }
    ?>
    <a class="active" href="en_attente.php">En attente</a>
</div>

<div id="page">
  <div id="corps">
      <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3><br/>
      <h2>Articles en attente : </h2></br>
      <?php
        $articles = $cnx->query("select titre_article, lien_contenu, nom, prenom from Article join Acteurs on Acteurs.matricule = Article.matricule_pigiste where en_attente = 'oui';");
        foreach($articles as $ligne){
        echo "<p><a href=".$ligne['lien_contenu']." name = ".$ligne['titre_article'].">".$ligne['titre_article']."(Auteur : ".$ligne['nom']." ".$ligne['prenom'].")</a></p>";
        }
      ?>   
  </div>

<form action="" method="POST" >
<?php
  $mot_de_passe = $_SESSION['mdp'];
  if (isset($mot_de_passe)){
    if ($mot_de_passe == 'LaRedaction123' || $mot_de_passe == 'Admin123'){
      echo '<input type = "submit" name = "nouveau" value = "Ajouter un nouvel article"/><br/><br/>';
    }
  }
  /*
  Par manque de temps je n'est pas pu faire la mise à jour des articles en attente.
  Ceux-ci étant supprimé si leur délais d'attente est supérieur à 6 mois.
  Il aurait fallu ajouter une variable 'temps' dans la table Article,
  puis avec une requete supprimer tout les articles avec une date de mise en ligne
  supérieure à 6 mois en appuyant sur le bouton "Mettre à jour articles en attente".
  */
?>
<!--  
  <input type = "submit" name = "maj" value = "Mettre à jour articles en attente"/><br/><br/>  
-->         
</form>

<?php
  if (isset($_POST['nouveau'])){
    //if ($_POST['maj'] == "Mettre à jour articles en attente"){
    //}
    if ($_POST['nouveau'] == "Ajouter un nouvel article"){
      echo '<meta http-equiv="refresh" content="0;url=nouvel_article.php">';
    }
  }

?>


<br/>
<br/>
<?php include("footer.php"); ?>