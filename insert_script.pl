#!/usr/bin/perl

require build_data;
require get_value;
require get_key;

$level = 0;
while ($line = <STDIN>) {
	if ($line =~ /{/) {
        $level++;
        if ($level == 1) {
            @keys = ();
            @values = ();
        }
    }

	if ($line =~/}/) {
        if ($level == 1) {
            &printInsertLine(@keys, @values);
        }
        $level--;
    }

    if ($line =~ /".*": / and $level == 1 and &build_data::get_value_type($line) ne "list") {
        push @keys, &get_key::get_key($line);
        push @values, &get_value::get_value($line);
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
