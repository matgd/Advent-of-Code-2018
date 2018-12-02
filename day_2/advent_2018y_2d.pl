use strict;
use warnings;

my $_2char_words = 0;
my $_3char_words = 0;

open(DATA, "<input.txt") or die "Couldn't open the file, $!";

while(<DATA>) {
    chomp $_;
    my @line_chars = split //, $_;
    my %chars_hash = map { $_ => 0} @line_chars;

    foreach my $char (@line_chars) {
	$chars_hash{$char}++;
    }	
    
    my %counts = map { $_ => 1 } values %chars_hash;
    
    foreach my $count (keys %counts) {
	if($count == 2) {
	    $_2char_words++;
	} elsif($count == 3) {
	    $_3char_words++;
	}
    }
}

print "2-char words: ", $_2char_words, "\n";
print "3-char words: ", $_3char_words, "\n";
print "Checksum: ", $_2char_words * $_3char_words, "\n";
