# %keypool is the object that will be assembled

%data = &build_data;

foreach my $key (keys %data) {
	print "$key: $data{$key}\n";
}

sub build_data {
	while ($line = <STDIN>) {
		# Collect keys occurrences
		if ($line =~ /".*": /) {
			$key = &get_key($line);
			$keypool{$key} += 1;
		}
	}
	%keypool
}

sub get_key {
	my ($raw) = @_;
	$key = $raw =~ s/^\s+"//r;
	$key =~ s/".*$//;
	chomp($key);
	$key; 
}
