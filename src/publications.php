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
        if ($mot_de_passe == 'LaRedaction123'){
          echo "<a href='Poka_redacteur.php'>Accueil</a>";
        }
        if ($mot_de_passe == 'Admin123'){
          echo "<a href='Poka_administrateur.php'>Accueil</a>";
        }
    ?>
    <a class = "active" href = "publications.php">Publications</a>
</div>

<div id="page">
  <div id="corps">
      <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3>
  </div>

<form action="" method="POST" >
  <input type = 'radio' name = 'choix' id = 'Magazines publiés' value = 'Magazines publiés'/><label for = 'Magazines publiés'>Magazines publiés</label><br/><br/>
  <input type = 'radio' name = 'choix' id = 'Articles publiés' value = 'Articles publiés'/><label for = 'Articles publiés'>Articles publiés</label><br/><br/>
  <input type = "submit" value = "valider"/><br/><br/>
    
  <?php
    $choix = isset($_POST['choix']);
    if($choix){
      if ($_POST['choix'] == "Magazines publiés"){
        $magazine = $cnx->query('select code, lien_maquette from Version_maquette natural join Numero;');
        foreach($magazine as $ligne){
          echo "<p><a href=".$ligne['lien_maquette']." name = ".$ligne['code'].">Code magazine : ".$ligne['code']."</a><br/></p>";
        }
      }
      if ($_POST['choix'] == "Articles publiés"){
        $articles = $cnx->query("select titre_article, lien_contenu, nom, prenom from Article join Acteurs on Acteurs.matricule = Article.matricule_pigiste where en_attente = 'non';");
        foreach($articles as $ligne){
          echo "<p><a href=".$ligne['lien_contenu']." name = ".$ligne['titre_article'].">".$ligne['titre_article']."(Auteur : ".$ligne['nom']." ".$ligne['prenom'].")</a><br/></p>";
        }
      }
    }
  ?> 
  
</form>
  
<br/>
<br/>
<?php include("footer.php"); ?>