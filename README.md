```
export ENCRYPTION_PASSWORD=<password to encrypt>
openssl aes-256-cbc -pass pass:$ENCRYPTION_PASSWORD -in ~/.gnupg/secring.gpg -out ./secring.gpg.enc
openssl aes-256-cbc -pass pass:$ENCRYPTION_PASSWORD -in ~/.gnupg/pubring.gpg -out ./pubring.gpg.enc
```

to decrypt

```
./deceypt-pgp.sh /tmp
```
