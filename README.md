# 5e-SRD-DB
A small python script that executes a series of SQL queries to recreate the [SRD5](https://dnd.wizards.com/articles/features/systems-reference-document-srd).

Requires &#8805;python3.6.

## Usage
As a sensible default, running the file blindly will create a folder named `OUT`, and inside build a sqlite database named `SRD5.db`.

```
./5e-srd-db.py
```

To change the output file/directory, use the `-o` flag:

```
./5e-srd-db.py -o build/my-cool-original-system.db
```

You can run `./5e-srd-db.py -h` or `./5e-srd-db.py --help` to see a full list of commands.

## Helper Scripts
These are a combination of bash and python scripts to compile SQL insert statements out of data copied and pasted directly from the SRD5. Any `*.txt` files are licensed under the OGL and aren't necessary to build the database. These are (as the folder would suggest) just helper scripts to compile the text files.

## Licensing
The content of any built database is licensed under the OGL 1.0, and any scripts that insert or manipulate OGL data are likewise licensed. These can be found in the [sql/ogl-content](sql/ogl-content/) folder.
All other scripts are licensed under the MIT License.

## About
Created by [Gavin Lochtefeld](https://github.com/glochtefeld).
