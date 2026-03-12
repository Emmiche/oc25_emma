# Cours du 10 mars 2026 : cycle de vie d'un LLM

(Problèmes avec benchmark : saturation et contamination.)

5 étapes :

- Collecte et préparation des données : plusieurs sources, principalement Internet. Si on fait rien pour trier, ça sera biaisé et ça se répétera. Filtrer les données, enlever choses inutiles. Anonymiser certaines données pur la confidentialité. On ne sait pas vraiment où les données sont cherchées ? Tous les mois, ils regardent ce qu'il y a de nouveau et l'enregistre. Certaines données sont moins nombreuses mais de meilleure qualité, donc plus de poid leur sont donnés (ex : Github). Data scheduling = combien de temps on passe sur certaines données (?).Mettre des priorités (ex : priorité sur Wikipedia car de meilleure qualité).
  
- Evaluation (ce qu'on a fait au TP2)

- Déploiement : quantification et distillation = comment rendre le model plus petit. Moins de byte/bit ? = moins de ??? Gros model enseigne au petit model.
