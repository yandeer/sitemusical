<!doctype html>
<html lang="fr">
	<head>
	  <meta charset="utf-8">
	  <title>Connexion</title>
	</head>
	<body>
        <?php
        /***********************************************
         * Nom du scirpt : connexion.php
         * Description : Propose un formulaire de connexion.
         * Les données sont comparées à celles enregistres dans la BD
         * Si Parametres correctes on indique que l'utilisateur qu'il est connecte
         */

         if (isset($_POST["Valider"]))
         //On récupere les données brut
	 $Login = $_POST['ZoneLogin'];
         $Email = $_POST['ZoneEmail'];
         $MDP = $_POST['ZoneMdp'];

        // Paramétres de connexion
         $host = 'localhost';
         $user = 'root';
         $passwd = 'Pandora1';
         $mabase = 'sitemusical';

         //Connexion au SGBD MySQL
         if ($conn = mysqli_connext($host,$user,$passwd,$mabase))
         {
             //Nombre de ligne envoyé > 0
             $Ligne = mysqli_num_rows($result);
             if ($Ligne==1)
             {
                 //Extraction ligne envoyée par la requéte
                $row = mysqli_fetch_assoc($result);
                //Recuperation du mot de passe dans la ligne
                $Mdp_Crypt_BD = $row['mdp'];

             }
         }
        ?>
            <h1> Connexion </h1>
            <form action ="<?php $_SERVER['PHP_SELF'] ?>" method="post">
		<div>
                    <label for = "ZoneLogin">Login : </label>
                    <input type="text" id="ZoneLogin" name="ZoneLogin" 				placeholder="Entrez votre login" required>
                </div>
                <div>
                    <label for = "ZoneEmail">Email : </label>
                    <input type="email" id="ZoneEmail" name="ZoneEmail" 			placeholder="Entrez votre email" required>
                </div>
                <div>
                    <label for ="ZoneMdp"> Mot de passe : </label>
                    <input type="password" id="ZoneMdp" name="ZoneMdp" 				placeholder="Entrez votre mot de passe" required>
                </div>
                <div>
		<!-- Zone du bouton valider -->
		<button type="submit" name= "Valider"> Connexion </button>
                </div>
       		</form>
	</body>
</html>





