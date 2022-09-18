#!/bin/bash

cp create_table.pl /usr/local/bin/ree_ct
cp insert_script.pl /usr/local/bin/ree_is
cp build_data.pm /etc/perl
cp get_key.pm /etc/perl
cp get_value.pm /etc/perl

chmod +x /usr/local/bin/ree_ct
chmod +x /usr/local/bin/ree_is
