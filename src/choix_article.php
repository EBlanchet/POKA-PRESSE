<?php 
    include("poka_connexion.php"); 
    include("header.php");
?>

<div class="barre">
    <a href = "assemblage.php">Assemblage</a>
    <a class = "active" href = "choix_article.php">Choix article</a>
</div>

<div id="page">
  <div id="corps">
      <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3>
  </div>
  <form action="choix_article2.php" method="POST"></br>
  <h2>Choix article :</h2></br>
<?php
    $articles = $cnx->query("select numArticle, titre_article, nom, prenom from Article join Acteurs on Acteurs.matricule = Article.matricule_pigiste where en_attente = 'oui';");
    foreach($articles as $ligne){
        echo "<input type = 'radio' name = 'choix_article' value = ".$ligne['numarticle']."/><label for = 'choix_article'>".$ligne['titre_article']." (Auteur : ".$ligne['nom']." ".$ligne['prenom'].")</label><br/><br/>";
    }
    echo "<h2>Choix image illustrante :</h2></br>";
    $images = $cnx->query("select * from Image_article;");
    foreach($images as $ligne){
      echo "<input type = 'radio' name = 'choix_image' value = ".$ligne['numimage_article']."/><label for = 'choix_image'>".$ligne['numimage_article']."<img src=".$ligne['lien_image_article']."></label>";
    }
    echo "</br><h2>Choix rubrique(s) possible(s) :</h2></br>";
    $rubriques = $cnx->query("select * from Rubrique;");
    foreach($rubriques as $ligne){
        echo "<input type = 'checkbox' name = 'rubrique_possible[]' value = ".$ligne['numrubrique']."/><label for = 'rubrique_possible'>".$ligne['titre_rubrique']."</label><br/><br/>";
    }
    echo '<input type = "submit" value = "valider"/>  ';
    echo '<input type = "reset" value = "effacer"/><br/><br/>';
?>
  </form>
<br/>
<br/>
<?php include("footer.php"); ?>