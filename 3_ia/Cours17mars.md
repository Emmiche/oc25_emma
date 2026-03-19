# Cours du mardi 17 mars 2026 : fonctionnement d'un LLM

## Machine learning

Tout vient du machine learning (modélisation mathématique, entraînement). But : créer un model qui crée une prédiction y. C'est une fonction d'une entrée (x, un prompt, ...). Input (mots avant ?) - > Outpute (mot suivant ?). Entrée à une sortie.

IA symbolique se sont des experts qui mettent les règles, mais dans le machine learning c'est la machine elle-même (qui aprrend ?).

Données d'entrée = couple d'entrée - sortie ?

Chaque label est un Yi ?

Pour la classification d'image, le model donne une classe ? ....... On veut que le model soit entraîné ?  si image  d'entrée c'est un flamant rose, Yi = texte flamant rose. Selon la réponse du model, il est plus ou moins bon  (calculer la distance entre deux sortie, minimiser la distance (distance de la réponse de l'IA par rapport à la réalité, par exemple si le model répond que c'est un oiseau, sa réponse sera plus proche d'un autre model qui dirait que c'est un animal(si on parle du flamant rose))).

Minimiser valeur entre réponse du model et ????

^Yi = model. forward pass = réseau de neuronne ?

## Réseau de neurone

Neurone reçoit des infos en entrée et donne une réponse en sortie. Multiplier poids et entrée ? Produits scalaire entre les poids et x.

Deep learning : couches l'une sur les autres ?

Aller dans l'autre sens = minimiser ? -> faut dériver

On enchaine ..... devient une fonction composée.

## Tokenisation

........

2 étapes (par rapport au réseau de neurones) : tokenisation (....), et embedding (....)
