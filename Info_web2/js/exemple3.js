console.log("Bonjour");

const status = document.getElementById("statut");
const ctx_statut = statut.getContext("2d"); // const est comme var c'est une variable ... demander !


ctx_statut.fillStyle = "green";
ctx_statut.fillRect(0, 0, 300, 300);

const dessin = document.getElementById("dessin");
const context = dessin.getContext("2d");


context.beginPath();
context.strokeStyle = "red"; // changer couleur trait
context.moveTo(250, 100);
context.lineTo(100, 250); //comme forward avec python
context.lineTo(250, 400);
context.lineTo(400, 250);
context.closePath(); // ferme "chemin" pour nous
context.fillStyle = "red";
context.fill();
context.stroke(); // appeler fonction strok pour dessiner 


context.beginPath();
context.arc(250, 250, 50, 0, 2 * Math.PI); // position, position, rayon?, angle? (en radiant)
context.fillStyle = "black";
context.fill();

// context.fillStyle = "black"
// context.fillRect(0, 0, 200, 100)
// context.fillRect(200, 200, 100, 100)

// for (var i = 0; i < 5; i++) {
//     for (var j = 0; j < 5; j++) {
//         if ((i + j) % 2 == 0) {
//             context.fillStyle = "black";
//         } else {
//             context.fillStyle = "white";
//         }

//         context.fillRect(100 * i, 100 * j, 100, 100);
//     }
// }