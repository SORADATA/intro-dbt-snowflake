## 🛠️ Guide des Commandes dbt

Cette section répertorie les commandes essentielles pour piloter le projet, du développement local jusqu'au déploiement.

### ⚙️ Initialisation et Dépendances
* `dbt init` : Initialise un nouveau projet dbt (structure des dossiers et configuration).
* `dbt deps` : Installe les packages externes listés dans `packages.yml` (ex: `dbt_utils`).
* `dbt debug` : Vérifie la connexion à Snowflake et la validité du fichier `profiles.yml`.

### 🚀 Transformation de Données (ELT)
* `dbt run` : Le cœur du projet. Exécute tous les modèles SQL et crée les tables/vues dans Snowflake.
* `dbt run --select nom_du_modele` : Exécute uniquement un modèle spécifique (ex: `stg_orders`).
* `dbt run --full-refresh` : Force la recréation complète des tables (indispensable pour les modèles incrémentaux après un changement de logique).



### 🧪 Qualité et Tests (Le "Green Check" ✅)
* `dbt test` : Lance tous les tests d'intégrité (unicité, non-nullité, relations entre tables et règles métiers).
* `dbt test --select nom_du_modele` : Teste uniquement un fichier spécifique.

### 📚 Documentation et Lignage (Lineage)
* `dbt docs generate` : Analyse le projet et génère le catalogue de métadonnées (types de colonnes, descriptions).
* `dbt docs serve` : Lance le serveur web local pour visualiser la documentation interactive.
* `dbt docs serve --port 8001` : Utilise un port spécifique (obligatoire pour l'accès via Onyxia).



### 🔍 Debug et Audit Avancé
* `dbt compile` : Transforme le code Jinja/SQL en SQL pur exploitable par Snowflake (idéal pour débugger des macros complexes).
* `dbt seed` : Charge les fichiers CSV du dossier `seeds/` directement dans Snowflake (pour les tables de référence comme les codes pays ou catégories).