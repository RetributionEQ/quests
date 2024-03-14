sub GetUpgrades {
    my $base_id = shift;
    my $dbh = plugin::LoadMysql();
    
    # Prepare and execute the statement
    my $sth = $dbh->prepare("SELECT * FROM items WHERE id % 1000000 = ? ORDER BY id ASC");
    $sth->execute($base_id);

    # Initialize an array to hold the items. Start with undefined values.
    my @items = (undef, undef, undef); 

    while (my $row = $sth->fetchrow_hashref) {
        if ($row->{'id'} % 1000000 == $base_id) {
            # Base item
            $items[0] = $row;
        } elsif ($row->{'id'} % 1000000 == $base_id and $row->{'id'} >= 1000000 and $row->{'id'} < 2000000) {
            # First upgrade (1 million range)
            $items[1] = $row;
        } elsif ($row->{'id'} % 1000000 == $base_id and $row->{'id'} >= 2000000) {
            # Second upgrade (2 million range)
            $items[2] = $row;
        }
    }

    $sth->finish();
    $dbh->disconnect();

    return \@items; # Return a reference to the array of items
}

sub IsItemTier0 {
    my $item_id = shift;

    if ($item_id < 1000000) {
        return 1;
    } 
    
    return 0;
}

sub IsItemTier1 {
    my $item_id = shift;

    if ($item_id > 1000000 && $item_id < 2000000) {
        return 1;
    } 

    return 0;
}

sub IsItemTier2 {
    my $item_id = shift;

    if ($item_id > 2000000 && $item_id < 3000000) {
        return 1;
    }

    return 0;
}

sub GetBaseID {
	my $item_id = shift;
	$item_id = $item_id % 1000000;
	return $item_id
}