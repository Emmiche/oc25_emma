const canvas_image = document.getElementById("image");
const ctx_image = canvas_image.getContext("2d");

//const img = new Image(); //créer objet image
const img_donut = new Image();

// on va executer code suivant quand tel évènement arrive, ici c'est quand l'image est chargé
//img_donut.onload = function() {
    //ctx_image.drawImage(img, 150, 150, 50, 50); // les deux dernières valeurs sont largeur et hauteur?
    //ctx_image.drawImage(img_donut, 150, 150, 50, 50);
//}
//img.src = "/oc25_emma/Info_web2/images/Pandoraforest.jpg";
//img_donut.src = "/oc25_emma/Info_web2/images/donuts-cake-svgrepo-com.svg";


const canvasSizeX = 500;
const canvasSizeY = 500;
const dx = 1;
const dy = 1;
var x = 1; //donner position de départ ?
var y = 1; //donner position de départ ?

function init() {
    img_donut.src="images/donuts-cake-svgrepo-com.svg";
    window.requestAnimationFrame(draw); //demander ce qu'il se passe là, fonction appelée constamment?
}


function draw() { //redessiner ... demander!
    ctx_image.clearRect(0, 0, 500, 500);

    if (x > canvasSizeX) {
        ctx_image.translate(-canvasSizeX, -canvasSizeY);
        x = 1;
        y = 1;
    } else {
        ctx_image.drawImage(img_donut, 1, 1, 50, 50);
        ctx_image.translate(dx, dy); //translation de tout le canvas
        x = x + dx;
        y = y + dy;
    }
    window.requestAnimationFrame(draw); //toutes les secondes draw est rappelé
}

init()