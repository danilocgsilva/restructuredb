require "./build_data.pl";
require "./get_value.pl";

$level = 0;
while ($line = <STDIN>) {
	if ($line =~ /{/) {
        $level++;
        &printInsertLine(@keys, @values) if $level == 1;
        @keys = ();
        @values = ();
    }

	if ($line =~/}/) {
        $level--;
    }

    if ($line =~ /".*": / and $level == 1 and &get_value_type($line) ne "list") {
        push @keys, &get_key($line);
        push @values, &get_value($line);
	}
}

sub printInsertLine {
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

        print "INSERT INTO amis (";
        $local_index = 0;
        foreach (@firstHalf) {
            print $_;
            if ($local_index < @firstHalf - 1) {
                print ", ";
            }
            $local_index++;
        }
        print ")";
        print " VALUES (";
        $local_index = 0;
        foreach (@secondHalf) {
            print "\"$_\"";
            if ($local_index < @firstHalf - 1) {
                print ", ";
            }
            $local_index++;
        }
        print ");\n";
    }
}
