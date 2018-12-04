use strict;
use warnings;

my %filled_coordinates;

open(DATA, "<input.txt") or die "Couldn't open the file, $!";
while(<DATA>) {
    chomp $_;
    my @input = split /@ /, $_;
    @input = split /: /, $input[1];
    my @start_coordinates = split /,/, $input[0];
    my $start_x = $start_coordinates[0];
    my $start_y = $start_coordinates[1];
    my @area = split /x/, $input[1];
    my $area_x = $area[0];
    my $area_y = $area[1];

    for(my $x = $start_x + 1; $x <= $start_x + $area_x; $x++) {
        for(my $y = $start_y + 1; $y <= $start_y + $area_y; $y++) {
            if (exists $filled_coordinates{$x}{$y}) {
                $filled_coordinates{$x}{$y}++;
            } else {
                $filled_coordinates{$x}{$y} = 1;
            }
        }
    }
} 

my $filled_area = 0;
foreach my $key (keys %filled_coordinates) {
    foreach my $key2 (keys %{$filled_coordinates{$key}}) {
        if($filled_coordinates{$key}{$key2} > 1) {
            $filled_area++;
        }
    }
}

print "Area: ", $filled_area, "\n";

open(DATA, "<input.txt") or die "Couldn't open the file, $!";
while(<DATA>) {
    chomp $_;
    my @input = split /@ /, $_;
    my $current_id = $input[0];
    @input = split /: /, $input[1];
    my @start_coordinates = split /,/, $input[0];
    my $start_x = $start_coordinates[0];
    my $start_y = $start_coordinates[1];
    my @area = split /x/, $input[1];
    my $area_x = $area[0];
    my $area_y = $area[1];

    my $no_overlap = 1;
    for(my $x = $start_x + 1; $x <= $start_x + $area_x and $no_overlap; $x++) {
        for(my $y = $start_y + 1; $y <= $start_y + $area_y and $no_overlap; $y++) {
            if ($filled_coordinates{$x}{$y} > 1) {
                $no_overlap = 0;
            }
        }
    }

    if($no_overlap) {
        print "Unique square ID: ", $current_id, "\n";
    }
} 
