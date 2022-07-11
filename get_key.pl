sub get_key {
	my ($raw) = @_;
	$key = $raw =~ s/^\s+"//r;
	$key =~ s/".*$//;
	chomp($key);
	return ($key);
}

1