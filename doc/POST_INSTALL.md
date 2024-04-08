Vous pouvez utiliser ClickHouse à partir de `clickhouse-client` ou à partir
du playground.

## Playground

Le playground se trouve à cette URL : https://__DOMAIN____PATH__/play.
Saisissez, en haut de la page, l'URL de ClickHouse (https://__DOMAIN____PATH__/),
votre login (__USER__) et le mot de passe que vous avez choisi.

Vous pouvez ensuite saisir votre requête SQL (par exemple : `SHOW DATABASES;`)
et cliquer sur "Run" pour voir le résultat.

## ClickHouse client

Vous pouvez également installer clickhouse-client.

Vous pouvez le démarrer avec vos paramètres :

```bash
clickhouse-client --secure --host __DOMAIN__ --port __PORT_CLICKHOUSE_SECURE__ --user __USER__
```

ClickHouse client vous demandera votre mot de passe et affichera le prompt où
vous pourrez saisir vos requêtes SQL.

Plus d'info sur la page officielle : https://clickhouse.com/docs/en/interfaces/cli

## Fichiers utilisateurs

Vous devez avoir les droits "SFTP" avec votre utilisateur.
En vous connectant en SFTP sur votre serveur, vous verrez un répertoire
/shared/clickhouse qui contient 3 sous-répertoires :

- user_files : pour déposer vos fichiers de données (CSV, etc). 
  Voir https://clickhouse.com/docs/en/sql-reference/table-functions/file
- user_defined : pour définir vos propres fonctions.
  Voir https://clickhouse.com/docs/en/sql-reference/functions/udf
- user_scripts : pour les scripts utilisés par les fonctions.

Par exemple, vous pouvez déposerun fichier CSV `mes_donnees.csv` dans le 
répertoire `/shared/clickhouse/user_files` puis le manipuler avec des requêtes
SQL du type `select * from file ('mes_donnees.csv', CSV)`.
