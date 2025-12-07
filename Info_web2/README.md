# Projet Web

Dans ce projet, nous devons faire un site web.

## Cahier des charges

Le cahier des charge décrit à quoi le site doit ressembler en terme de contenu, style et organisation.

Le cahier des charge comprend des éléments imposés :

- Le site web doit contenir au minimum quatre pages dans quatre fichiers HTML différents, dont une page d’accueil : page1.html, page2.html, page3.html, page4.html.
- La page d’accueil doit présenter le sujet traiter et offrir au visiteur une table des matières du site web avec un lien vers les pages correspondantes et une brève description du contenu. Voici le code pour la table des matières:

````
<!--En HTML-->
 <h2>Table des matières</h2>

<div class="cadre-groupe">
    <p>
        <a href="page2.html">
            <img class="img-float" src="images/middleforestpixel.jpg"  width="200">
            L'importance des forêts
        </a>
        
        <br>
        <a href="page3.html">
            <img class="img-float" src="images/colorful-gaming-accessories.jpg"  width="200">
            Les jeux vidéo
        </a>

        <br>
        <a href="page4.html">
            <img class="img-float" src="images/analysis.png"  width="200">
            Analyse et conclusion
        </a>
    </p>
</div>
````

````
/* En CSS */
.cadre-groupe {
    border: 2px solid rgb(2, 107, 0); /* bordure 2 pixels, style plein, même couleur verte qu'autre cadre*/
    padding: 15px; /*espace entre le contenu et la bordure */
    margin: 20px; /* espace autour du cadre ?*/
    background-color: #f9f9f9; 
    /*float: left;*/
}
````

- Il doit y avoir une barre de navigation pour naviguer entre les quatre pages:
  En HTML:

 ````
  <div id="navigation">
    <ul>
        <li><a href="page1.html">Acceuil</a></li>
        <li><a href="page2.html">L'importance des forêts</a></li>
        <li><a href="page3.html">Les jeux vidéo</a></li>
        <li><a href="page4.html">Analyse et conclusion</a></li>
    </ul>

</div>
````

````
/* En CSS */

#navigation {
    background-color: rgb(115, 204, 115);
    padding-top: 5px;
    padding-bottom: 5px; /*agrandi zone grise*/
}

#navigation ul {
    /* border: solid 1px blue; */
    width: fit-content; /* demander!*/
    padding-left: 0px;
    margin-left: auto;
    margin-right: auto;
}
/* espace entre navigation et li fait que ... éléments descendants*/
#navigation li {
    display: inline; /* ??*/
    /* border: solid 1px red; */
    margin-left: 20px;
    margin-right: 20px;
}
````

- Chaque page doit contenir au moins 100 mots.
- Le sujet traité doit être liés aux STIM et le contenu (texte, images, équations, code, animations, etc.) doit être cohérent, pertinent et maîtrisé par l’élève.
- La page web doit contenir soit des équations, soit du code informatique, soit un formulaire dynamique.
- Le site web doit être stylé avec une feuille CSS. Chaque page en a une : style.v1.css, style.v2.css, style.v3.css, style.v4.css.
- Il doit y avoir une animation réalisée avec canvas (en javascript).
  Exemple:

````
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

// redessiner encore et encore pour faire une animation infinie

````

- Le code doit être sur GitHub est être déployé sur le web avec GitHub Pages : emmiche.github.io/oc25_emma/Info_web2/page1.html
- La page doit pouvoir s’adapter aux petits écrans (smartphone) (adaptation du texte à côté des images dans CSS avec float: left;).

### Thème

J'ai décidé de faire ce site sur le thème de mon travail de maturité, qui s'intitule : Les jeux vidéo comme leviers de sensibilisation aux enjeux environnementaux : l'exemple de la forêt numérique.

### Structure du code

Voici un schéma (pas complet) de comment j'ai organisé tous mes fichiers (HTML, CSS, JS, et autres) :

                |/
                |_ css/
                |     |_style.v1.css
                |     |_style.v2.css
                |     |_style.v3.css
                |     |_style.v4.css
                |     |...
                |  
                |_ images/
                |     |_ analysis.png
                |     |_ arbrepine.svg
                |     | ...
                |
                |_ js/
                |    |_animationamourforet.js
                |    |...
                |
                |_ contenu/
                      |_ page1.html
                      |_ page2.html
                      |_ page3.html
                      |_ page4.html
                      |...


                


 Voici un schéma d'unde strucutre html :              
![structurehtml](https://github.com/user-attachments/assets/c9321fcf-1f6d-4b49-a140-c797ca1a9562)



### Maquette/apparence

Voici la maquette de mon idée de départ :
![maquette_ideedepart_info](https://github.com/user-attachments/assets/a9ffbca0-fc8a-491b-ac05-0c77369b5603)
Dans la version finale, certaines choses ne sont plus là, tandis que d'autres sont restées ou ont été modifiées. La majorité des idées sont tout de même restées.


### Difficultés

L'animation était vraiment dure, même à la fin je n'ai pas réussi à le faire correctement. Pour arriver à quelque chose, j'ai du particulièrement persévérer, j'ai du regarder ce que chaque ligne de code fesait. On peut voir mes diificultés à travers tous mes commentaires et les nombreux points d'interrogation.

