# Building a Database

## Create a table

* In order to create a table, we can use the ```CREATE TABLE``` command.

```SQL
    CREATE table plays(
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        year INTEGER NOT NULL
    );
```

## Insert values into a table

* In order to insert values, we can use ```INSERT``` command

```SQL
    INSERT INTO plays (title,year) 
    VALUES ('Macbeth',1888);
```

Values in ```id``` column will be populated automatically since it's a primary key

## Import a file into SQLite

```shell
    cat import_db.sql | sqlite3 database_name.db
```