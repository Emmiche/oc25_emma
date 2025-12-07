const canvas_image = document.getElementById("image");
const ctx_image = canvas_image.getContext("2d");

//const img = new Image(); //créer objet image
const img_arbretrois = new Image();
const img_arbrepine = new Image();
const img_sapin = new Image();
const img_coeur = new Image();

// Canvas
const canvasSizeX = 500;
const canvasSizeY = 200;
// Vitesse
const dx = 1; //se déplace de 1 à l'horizontal
const dy = 0; // se déplace uniquement horizontalement
// Position ?
var x = 250; //donner position de départ ?
var y = 250; //donner position de départ ?

function init() { // de l'initialisation ? Configure ? Defini ?
    img_arbretrois.src="images/arbretrois.svg";
    img_arbrepine.src="images/arbrepine.svg";
    img_sapin.src="images/sapin.svg";
    img_coeur.src="images/coeur.svg"

    ctx_image.setTransform(1, 0, 0, 1, 0, 0); // remettre ??? au début ?

    window.requestAnimationFrame(draw); //demander ce qu'il se passe là, fonction appelée constamment?
}


function draw() { //redessiner ... demander!
    // Efface canvas ?
    ctx_image.clearRect(0, 0, canvasSizeX, canvasSizeY);

    if (x > canvasSizeX) {
        ctx_image.translate(-canvasSizeX, -canvasSizeY);
        x = 1;
        y = 1;
    } else {
        ctx_image.drawImage(img_arbretrois, 0, 50, 60, 60); //quel nb représente quoi?
        ctx_image.drawImage(img_coeur, 120, 50, 40, 40);
        ctx_image.drawImage(img_arbrepine, 200, 50, 60, 60);
        ctx_image.drawImage(img_coeur, 320, 50, 40, 40);
        ctx_image.drawImage(img_sapin, 400, 50, 60, 60);

        ctx_image.translate(dx, dy); //translation de tout le canvas
        x = x + dx;
        //y = y + dy;

    // Quand tout est sorti de l’écran :
    if (x > canvasSizeX) {
        // On "téléporte" le monde à gauche
        ctx_image.translate(-x, 0);
        x = 0; // Ne fonctionne pas très bien
    }
    }
    window.requestAnimationFrame(draw); //toutes les secondes draw est rappelé
}

init() 