<?php 
    include("poka_connexion.php"); 
    include("header.php");
?>

<div class="barre">
    <a href = "choix_article.php">Choix article</a>
    <a class = "active" href = "choix_article2.php">Choix</a>
</div>

<div id="page">
  <div id="corps">
      <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3>
  </div>

<?php
    if (isset($_POST['choix_article'])){
        if (!empty($_POST['rubrique_possible'])){
            foreach($_POST['rubrique_possible'] as $ligne){
                $cnx->exec('insert into est_possible values (\''.$_POST["choix_article"].'\', \''.$ligne.'\');');
                $cnx->exec('update Article set en_attente = NULL where numArticle = \''.$_POST["choix_article"].'\';');
            } 
            $res = $cnx->query('select * from est_possible where numArticle = \''.$_POST["choix_article"].'\';');
            if (! $res){
                echo "L'insertion des rubriques possibles a echouée !";
            }
            else {
                echo "Réussite de l'insertion des rubriques possible pour l'article Numéro : ".$_POST["choix_article"]."<br/>";
                echo "A ce jour, l'insertion est possible mais la modification de 'l'état de l'article' (en attente ou non) n'est pas possible";
            }
            if (isset($_POST['choix_image'])){
                $cnx->exec('insert into illustre_article values (\''.$_POST["choix_article"].'\', \''.$_POST['choix_image'].'\');');
                $res = $cnx->query('select * from illustre_article where numArticle = \''.$_POST["choix_article"].'\';');
                if (! $res){
                    echo "L'insertion d'image illustrante a echouée ou vous n'en avez pas choisi";
                }
                else {
                    echo "Réussite de l'insertion d'une image illustrante pour l'article Numéro : ".$_POST["choix_article"]."<br/>";
                }
            }
        }
        else {
            echo "Veuillez faire au moins un choix dans les catégories suivantes : Choix article, Choix rubrique(s) possible(s)<br/><br/>";
        }
    }
    
?>

<br/>
<br/>
<?php include("footer.php"); ?>