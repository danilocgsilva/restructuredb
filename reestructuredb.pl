$inside_root_block = 0;
while ($line = <STDIN>) {
    if ($line =~ /{/) {
        $inside_root_block = 1;
        next;
    }
    if ($line =~ /}/) {
        $inside_root_block = 0;
        next;
    }
    next if ($inside_root_block == 0);
    @broken_parts_line = split(":", $line);
    $key = $broken_parts_line[0];
    $key =~ s/^\s*\"//;
    $key =~ s/"//;
    print($key . "\n");
}
