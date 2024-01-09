<?php 
    include("poka_connexion.php"); 
    include("header.php");
?>

<div class="barre">
    <a href = "en_attente.php">En attente</a>
    <a class = "active" href = "choix_article.php">Choix article</a>
</div>

<div id="page">
  <div id="corps">
      <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3>
  </div>
  
  <h2>Entrée d'un nouvel article :</h2></br>

<form action="" method="POST"></br>
    Numéro Article : <input type="text" name="numero" size="10"  /> (Article-[...])</br></br>
    Titre Article : <input type="text" name="titre" /><br/></br>
    Lien contenu : <input type="text" name="lien"/><br/></br>
    Nombre de feuillets : <input type="int" name="feuillets"/><br/></br>
    Pigiste : <select name = "matricule">
	<option value="" selected="selected">-- choix --</option>
    <?php 
    $mat = $cnx->query("select matricule, nom, prenom from Acteurs where role = 'pigiste';");
    foreach($mat as $ligne){
        echo "<option value=".$ligne['matricule'].">".$ligne['prenom']." ".$ligne['nom']."</option>";
    }
    ?>
    </select><br/></br>

    <input type="reset" name="reset" value="Effacez" /> 
    <input type="submit" name="submit" value="Validez" />
</form>

<?php
    
    if (isset($_POST["numero"], $_POST["titre"], $_POST["lien"], $_POST["feuillets"], $_POST["matricule"])){
        $numero = $_POST["numero"];

        $cnx->exec('insert into Article (numArticle, titre_article, chapeau, lien_contenu, nb_feuillets, matricule_pigiste, en_attente) values (\''.$_POST["numero"].'\', \''.$_POST["titre"].'\', \'chapeau\', \''.$_POST["lien"].'\', \''.$_POST["feuillets"].'\', \''.$_POST["matricule"].'\', \'oui\');');
        
        $res = $cnx->query('select numArticle from Article where numArticle = \''.$numero.'\';');
        if (! $res){
            echo "L'insertion a echouée !";
        }
        else {
            echo "Réussite de l'insertion de l'article Numéro : ".$numero." dans les articles en attente !";
        }
    }
    
?>

  
<br/>
<br/>
<?php include("footer.php"); ?>