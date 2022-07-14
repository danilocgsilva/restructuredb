# %keypool is the object that will be assembled

require "./get_key.pl";

sub build_data {

	$level = 0;
	while ($line = <STDIN>) {

		$level++ if ($line =~ /{/);
		$level-- if ($line =~/}/);

		# Collect keys occurrences
		if ($line =~ /".*": / and $level == 1 and &get_value_type($line) ne "list") {
			$key = &get_key($line);
			$keypool{$key} += 1;
		}
	}
	%keypool
}

sub get_value_type {
	my ($value) = @_;
	$value =~ s/^(.*?)"//;
	$value =~ s/^(.*?)"//;
	$value =~ s/^: //;
	$value =~ s/,$//;
	if ($value =~ /"/) {
		return ("string");
	} elsif ($value =~ /[\]\[]/) {
		return ("list");
	} else {
		return ("boolean");
	}
}

1