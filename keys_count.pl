# %keypool is the object that will be assembled

require "./build_data.pl";

foreach my $key (keys %data) {
	print "$key: $data{$key}\n";
}
