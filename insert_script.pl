require "./build_data.pl";

$level = 0;
while ($line = <STDIN>) {
	if ($line =~ /{/) {
        $level++;
        print "\n" if ($level == 1);
    }

	if ($line =~/}/) {
        $level--;
    }

    if ($line =~ /".*": / and $level == 1 and &get_value_type($line) ne "list") {
		$key = &get_key($line);
        print "INSERT \"aha\" INTO $key;\n"
	}
}
