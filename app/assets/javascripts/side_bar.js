var connexion = document.getElementById("connexion");
var champsconnexion = document.getElementById("champsconnexion");

function afficherChamps() {
    if (champsconnexion.style.display!='block') {
        champsconnexion.style.display='block';
    }
    else {
        champsconnexion.style.display='none';
    }
}
 
if (connexion) {
    connexion.addEventListener("click", afficherChamps, false);
}