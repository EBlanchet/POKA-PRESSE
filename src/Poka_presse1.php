<?php session_start(); ?>
<!DOCTYPE html>
<html lang = "fr">
    <head>
    <title>POKA PRESSE</title>
        <link rel = "shortcut icon" href ="https://i.imgur.com/5I6B4Bc.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta charset="UTF-8">
        <style type="text/css">
            * { margin: 0; padding: 0; outline: 0; }
            body {
                margin: 0;
                font-family : sans-serif;
            }
            h1 {
                font-size : 500%;
                color:black;
                text-align: center;
            }
            h4 {
                font-size: 63%;
                text-align: left;
            }
            div {
                font-size: 75%;
                color: black;
                text-align: left;
            }
            .centered {
                text-align : center;
            }
            #page {
                position: relative;
                min-height: 100vh;
            }
            #corps {
                padding-bottom: 2%;
            }
            #footer {
            font-size : 100%;
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 3%;
            }
        </style>
    </head>
 
 <body>
    <div id="page">
            <div id="corps">
                <h1 class = "centered"> <img src="https://i.imgur.com/5I6B4Bc.png"> POKA PRESSE </h3>
            </div>

    <form action="" method="POST"></br>
    Identifiant <input type="text" name="matricule" size="10"  /></br></br>
    Mot de passe <input type="password" name="mdp" size="15" /><br /></br>
    <input type="reset" name="reset" value="Effacez" /> 
    <input type="submit" name="submit" value="Validez" />
    </form>

<?php
    unset($_SESSION['mdp']);
    unset($_SESSION['matricule']);
    if (isset($_POST['mdp'])){
        $mot_de_passe = $_POST['mdp'];
        $_SESSION['mdp'] = $mot_de_passe;
    }
    if (isset($_POST['matricule'])){
        $mat = $_POST['matricule'];
        $_SESSION['matricule'] = $mat;
    }

    include("poka_connexion.php");
    
    if (isset($_POST['matricule'])){
        $res = $cnx->query('select matricule, role from Acteurs where matricule = \''.$_POST['matricule'].'\';');
        foreach($res as $ligne){
            if ($ligne['role'] == 'maquettiste'){
                if ($_POST['mdp'] == 'LaMaquette123'){
                    header('Location: Poka_maquettiste.php');
                    exit();
                }
            }
            if ($ligne['role'] == 'pigiste'){
                if ($_POST['mdp'] == 'LesPages123'){
                    header('Location: Poka_pigiste.php');
                    exit();
                }
            }
            if ($ligne['role'] == 'redacteur'){
                if ($_POST['mdp'] == 'LaRedaction123'){
                    header('Location: Poka_redacteur.php');
                    exit();
                }
            }
        }
        if ($_POST['matricule'] == 'administrateur'){
            if ($_POST['mdp'] == 'Admin123'){
                header('Location: Poka_administrateur.php');
                exit();
            }
        }
        echo "</br>Identifiant ou Mot de passe erroné</br>";
    }
?>

<footer id="footer">
    <h4 class = "centered">
        Elise Blanchet - L2MI - TP 11 - TD 7 - Université Gustave Eiffel - 
    <script language="JavaScript">
        document.write()
        var date = new Date()
        var annee = date.getYear()
        if (annee < 2000)
        annee += (annee < 1900) ? 1900 : 0
        var jour = date.getDay()
        var mois = date.getMonth()
        var jma = date.getDate()
        if (jma < 10)
        jma = "0" + jma
        var tab_jour = new Array("Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi")
        var tab_mois = new Array(" janvier "," fevrier "," mars ","avril ","mai ","juin","juillet ","aout ","septembre "," octobre "," novembre "," décembre ")
        document.write("   " + tab_jour[jour]+ " " + jma + " " + tab_mois[mois] + annee + " ")
        document.write("</b></i></font>")
    </script>
    </h4>
    </footer>

 </body>
</html>