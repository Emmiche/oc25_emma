const canvas_image = document.getElementById("image"); //récupère élément html ? Permet manipuler une variable en js ?
const ctx_image = canvas_image.getContext("2d"); // récupère context de dessin 2d, outil qui permet de dessiner?

//const img = new Image(); //créer objet image
const img_arbretrois = new Image();
const img_arbrepine = new Image();
const img_sapin = new Image();
const img_coeur = new Image();

// Canvas (interne)
const canvasSizeX = 750;
const canvasSizeY = 150;

// Taille réelle du canvas ? Cadre visible défini en html ?
canvas_image.width = 750;
canvas_image.height = 150;

// Vitesse, variable de mouvement
const dx = 1; //se déplace de 1 à l'horizontal
const dy = 0; // se déplace uniquement horizontalement

// Position ? 
var x = 250; //donner position de départ ? x sert à savoir quand le canvas doit revenir à gauche ?
var y = 250; //donner position de départ ?

// appelée une seule fois au début ?
function init() { // fonction d'initialisation ? Configure ? Defini ?
    img_arbretrois.src="images/arbretrois.svg";
    img_arbrepine.src="images/arbrepine.svg"; // donne une source à une image (avant c'était comme un slot vide?)
    img_sapin.src="images/sapin.svg";
    img_coeur.src="images/coeur.svg"

    ctx_image.setTransform(1, 0, 0, 1, 0, 0); // remettre ??? au début ? un reset?
    // sinon canvas partirai complètement hors champ ?

    window.requestAnimationFrame(draw); //demander ce qu'il se passe là, fonction appelée constamment?
    //lance la boucle d'animation
    // draw() executé avant chaque rafraîchissement ?
}


function draw() { //redessiner ... demander!
    // Efface canvas, sinon anciens dessins resteraient visibles
    ctx_image.clearRect(0, 0, canvasSizeX, canvasSizeY);

    // gestion du retour si on a trop translaté ? 
    if (x > canvasSizeX) { // si translaté plus loin que largeur canva (interne?) -> canva déplacé à gauche, positions (logiques?) remisent à 1
        ctx_image.translate(-canvasSizeX, -canvasSizeY); //-canvaSiveY pas forcément util car déplacement uniquement horizontal
        x = 1;
        y = 1;
    } else { // alignement des images
        ctx_image.drawImage(img_arbretrois, 0, 50, 60, 60); //quel nb représente quoi?
        ctx_image.drawImage(img_coeur, 120, 50, 40, 40); // -> drawImage(image, x, y, largeur, hauteur)
        ctx_image.drawImage(img_arbrepine, 200, 50, 60, 60);
        ctx_image.drawImage(img_coeur, 320, 50, 40, 40);
        ctx_image.drawImage(img_sapin, 400, 50, 60, 60);

        ctx_image.translate(dx, dy); //translation de tout le canvas
        x = x + dx; // x augmente
        //y = y + dy;

    // Quand tout est sorti de l’écran, retour quand dépassé largeur :
    if (x > canvasSizeX) { // quand x dépasse largeur canvas
        // On "téléporte" le monde/la caméra à gauche
        ctx_image.translate(-x, 0);
        x = 0; // pour recommencer animation
    }
    }
    //boucle
    window.requestAnimationFrame(draw); //toutes les secondes draw est rappelé
}

init() //appel init, animation démarre

// Résumé :
// charge 4 images
//fixe taille du canvas
//à chaque frame :

   // tout effacer
   // images dessinées
   // canvas déplacé avec translate
   // x avance
   // quand x dépasse largeur tout est remis au début ?

// redissiner encore et encore pour faire une animation infinie

