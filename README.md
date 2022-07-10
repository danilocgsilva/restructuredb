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
