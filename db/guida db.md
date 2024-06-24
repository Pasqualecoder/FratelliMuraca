# Guida import/export database fratellimuracadb

## Import
- aprire la console mysql su Datagrip del localhost
- droppare il db precedente
    - **DROP DATABASE fratellimuracadb;**
- creare il nuovo db con lo stesso nome
    - **CREATE DATABASE fratellimuracadb;**
- file>open> FratelliMuraca/db/dump.sql
- tasto destro sulla prima riga > run dump.sql
- in target data source/schema premere su + e selezionare
**@localhost/fratellimuracadb** (IMPORTANTE ASSICURATI DI AVER SCELTO IL DATABASE OLTRE AL @localhost)
- run

## Export
- aprire il cmd
- cd C:\Program Files\MySQL\MySQL Server 8.0\bin
- .\mysqldump.exe --hex-blob -u root -p fratellimuracadb > C:\Users\NOMEUTENTE\PERCORSO\FratelliMuraca\db\dump.sql
