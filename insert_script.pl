require "./build_data.pl";
require "./get_value.pl";

$level = 0;
while ($line = <STDIN>) {
	if ($line =~ /{/) {
        $level++;
        @keys = ();
        @values = ();
    }

	if ($line =~/}/) {
        &printInsertLine(@keys, @values) if $level == 1;
        $level--;
    }

    if ($line =~ /".*": / and $level == 1 and &get_value_type($line) ne "list") {
        push @keys, &get_key($line);
        push @values, &get_value($line);
	}
}

sub printInsertLine {

    $insertLine = "";
    
    if (@_ > 0) {
        $half = @_ / 2;

        @firstHalf = ();
        @secondHalf = ();

        $index = 0;
        foreach (@_) {
            if ($index < $half) {
                push @firstHalf, $_;
            } else {
                push @secondHalf, $_;
            }
            $index++;
        }

        $insertLine .= "INSERT INTO amis (";
        $local_index = 0;
        foreach (@firstHalf) {
            $insertLine .= $_;
            if ($local_index < @firstHalf - 1) {
                $insertLine .= ", ";
            }
            $local_index++;
        }
        $insertLine .= ")";
        $insertLine .= " VALUES (";
        $local_index = 0;
        foreach (@secondHalf) {
            $insertLine .= "\"$_\"";
            if ($local_index < @firstHalf - 1) {
                $insertLine .= ", ";
            }
            $local_index++;
        }
        $insertLine .= ");\n";

        print $insertLine;
    }
}
