# Comment générer le mot de passe d'un user ?

Voir https://clickhouse.com/docs/en/operations/settings/settings-users/#user-namepassword

Les mots de passe entre `<password_sha256_hex>` et `</password_sha256_hex>` doivent être hashé en SHA256.

Voilà comment générer un mot de passe et le hash SHA256 :

```bash
PASSWORD=$(base64 < /dev/urandom | head -c20); echo "$PASSWORD"; echo -n "$PASSWORD" | sha256sum | tr -d '-'
```
