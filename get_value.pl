sub get_value {
    my ($line) = @_;
    chomp($line);

    if ($line =~ /: true,/ or $line =~ /: false,/) {
        $line =~ s/^.* //;
        $line =~ s/,$//;
        # $line = $line;
    } else {
        $line =~ s/^(.*?)"//;
        $line =~ s/^(.*?)"//;
        $line =~ s/^(.*?)"//;
        $line =~ s/".*$//;
        $line;
    }

    $line;
}

1