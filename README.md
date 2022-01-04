# 5e-SRD-DB
A small python script that executes a series of SQL queries to recreate the [SRD5](https://dnd.wizards.com/articles/features/systems-reference-document-srd).

## Usage
As a sensible default, running the file blindly will create a folder named `OUT`, and inside build a sqlite database named `SRD5.db`.

```./5e-srd-db.py```

To change the output file/directory, use the `-o` flag:

```./5e-srd-db.py -o build/my-cool-original-system.db```

## Licensing
The content of any built database is licensed under the OGL 1.0, and any scripts that insert or manipulate OGL data are likewise licensed. These can be found in the [sql/ogl-content]() folder.
All other scripts are licensed under the MIT License.

## About
Created by [Gavin Lochtefeld](https://github.com/glochtefeld).
