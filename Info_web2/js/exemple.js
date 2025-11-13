//var message = 'Bienvenue';

// console.log(message);

// function ma_fonction() {
//     console.log('ma fonction');
// }

// ma_fonction();

// console.log(document.querySelector('.important').textContent)
// console.log(document.getElementById('Bienvenue').textContent)

// for (var i = 0; i < 10; i++) {
//     console.log(i);
// }

//function ajouter_perso() {
    //var nom_perso = 'Jean';

    //var nouveau_li = document.createElement('li');
    //var nouveau_text = document.createTextNode(text_personnage);
    //console.log('perso');
//}




var jean = {
    nom: 'jean',
    classe: 'guerrier',
    niveau: 2,
    passer_niveau: function() {
        this.niveau++;
    }
    }

console.log(jean);
console.log(jean.classe);
jean.passer_niveau();
console.log(jean.niveau);

function creer_personnage(nom, classe, niveau) {
    var nouveau_personnage = {
    nom: nom,
    classe: classe,
    niveau: niveau,
    passer_niveau: function() {
        this.niveau++;
    },
    creer_li: function() {
        var li_personnage = document.createElement('li');
        var texte_personnage = document.createTextNode(
            this.nom + '(' + this.classe + ', niveau' + this.niveau + ')'
        );
        li_personnage.appendChild(texte_personnage);
        li_personnage.setAttribute('class', this.classe) //définir ... -> demander !
        return li_personnage;
    }

    
}
return nouveau_personnage;
};

var nicole = creer_personnage('Nicole', 'voleur', 3);

console.log(nicole)

var troupe = [
    creer_personnage('Jean', 'guerrier', 2),
    creer_personnage('Nicole', 'voleur', 3),
    creer_personnage('Matteo', 'magicien', 1)
]

console.log(troupe);
console.log(troupe[0])

// Avant de mettre dans la boucle
// for (var i = 0; i < troupe.length; i++) {
//     console.log(troupe[i].nom);
// }


// var li_personnage = document.createElement('li');
// var texte_personnage = document.createTextNode('Matteo'); //créer élément text
// li_personnage.appendChild(texte_personnage); //rajouter un child à l'élément li? permet de relier ces? deux éléments



// var liste_perso = document.getElementById("liste_de_perso");
// liste_perso.appendChild(li_personnage);

for (var i = 0; i < troupe.length; i++) {
    var perso = troupe[i];
    li_personnage = perso.creer_li();

    // Pourquoi est-ce qu'on a enlevé cela ? -> demander !

    // var li_personnage = document.createElement('li');
    // var texte_personnage = document.createTextNode(perso.nom);
    // li_personnage.appendChild(texte_personnage); 

    var liste_perso = document.getElementById("liste_de_perso");
    liste_perso.appendChild(li_personnage);

}