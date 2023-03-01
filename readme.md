### docker
```bash
docker run --name postgressimplebank -p 5435:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres
---
docker exec -it postgressimplebank psql -U root
----
docker logs postgressimplebank
----
docker exec -it postgressimplebank /bin/sh
createdb --username=root --owner=root simple_bank
---
```