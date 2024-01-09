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
    </div>
</body>
</html>