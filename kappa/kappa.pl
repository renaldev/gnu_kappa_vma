#! /usr/bin/perl

use 5.010;
use strict;

my $max;
my $line; my $teta; my $intens;
my @teta; my @intens;

sub max{
	my $i; 
	$max=0;
	foreach $i (@intens) {
		if ($max<$i) { $max=$i; };
	};	
};

my @txt_files = glob "*e.txt" or die "No files: $! \n";
my $txt_file; 
foreach $txt_file (@txt_files) {
		open DIF, "$txt_file" or warn "No file: $! \n";
		@teta=(); @intens=();
		while (defined($line=<DIF>)) {
				my ($teta, $intens)=($line=~/(\d+\.*\d*)\s+(\d+\.*\d*)/);
				push(@teta, $teta);
				push(@intens, $intens);
		};
		&max;
		open DIF, ">$txt_file";
		#my $i; $i=0;
		#foreach (@teta) {$intens[$i]=1000*$intens[$i]/$max;	say DIF "$teta[$i]   $intens[$i]"; $i++; }; say "$i"; 	
};

say "OK !- ";
