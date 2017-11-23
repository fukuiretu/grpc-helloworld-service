# setup

### DB

```
mysql -u root -e "CREATE DATABASE grpc_helloworld_development DEFAULT CHARACTER SET utf8;"
bundle exec ridgepole -c config/database.yml -f db/Schemafile  --apply
```
