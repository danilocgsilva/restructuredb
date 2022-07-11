require "./build_data.pl";

$count = %data;

&create_table(%data);

sub create_table {
    my (%data) = @_;
    print "CREATE TABLE amis (\n";
    &print_field_entries(%data);
    print ");\n";
}

sub print_field_entries {
    my (%data) = @_;
    $index = 0;
    foreach my $key (keys %data) {
        print "    $key TEXT";
        if ($index < $count - 1) {
            print ",";
        }
        print "\n";
        $index++;
    }
}

