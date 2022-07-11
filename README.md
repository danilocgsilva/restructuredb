# Restructuredb

Intelligence to understands patterns from a non relational database.

## Important files

* ### `keys_count.pl`

Receives a formatted json from a non-structured database and counts keys occurrences.

Usage example:
```
cat your_formatted_json_data.json | perl keys_count.pl
```
or
```
perl keys_count.pl < your_formatted_json_data.json
```

* ### `create_table.pl`

Splits the creation script for sqlite database.

Usage example:
```
perl create_table.pl < amis.json | sqlite3 amis.db
```
The above script creates a new sqlite file with the content generated by `create_table.pl` script using input from `amis.json`. The resulting sqlite file already will have all required fields to receive the information.

If you just want to print/see the raw creating sqlite script, just do:
```
perl create_table.pl < amis.json
```
