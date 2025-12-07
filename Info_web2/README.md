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
    /*gap: 10px;*/ /*espace entre les images ?*/
    /*display: flex;*/
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
````

- Le code doit être sur GitHub est être déployé sur le web avec GitHub Pages : emmiche.github.io/oc25_emma/Info_web2/page1.html
- La page doit pouvoir s’adapter aux petits écrans (smartphone) (adaptation du texte à côté des images dans CSS avec float: left;).

### Thème

J'ai décidé de faire ce site sur le thème de mon travail de maturité, qui s'intitule : Les jeux vidéo comme leviers de sensibilisation aux enjeux environnementaux : l'exemple de la forêt numérique.

### Structure du code

Je ne m'y connait pas en en html, je vais donc probablement suivre la recommendation pour la structure du code, c'est-à-dire celle-là :

                |/
                |_ contenu/
                |     |_ page1.html
                |     |_ page2.html
                |     |_ page3.html
                |    
                |_ css/
                |     |_style.css
                |
                |_ js/
                |    |_animation.js
                |    |_fonctions.js
                |
                |_ images/
                |        |_ image1.png
                |        |_ image2.jpg
                |
                |_ fonts/
                |       |_ fontx-Regular.tff
                |       |_ fontx-Bold.tff
                |
                |_ index.html 

 Voici un schéma de la strucutre html :              
![structurehtml](https://github.com/user-attachments/assets/c9321fcf-1f6d-4b49-a140-c797ca1a9562)



### Maquette/apparence

Voici la maquette de mon idée de départ :
![maquette_ideedepart_info](https://github.com/user-attachments/assets/a9ffbca0-fc8a-491b-ac05-0c77369b5603)


