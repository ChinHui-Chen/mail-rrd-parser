#!/usr/bin/perl

use strict ;
use RRD::Simple ;

&main(@ARGV) ;



sub main{
	my $file = shift ;

	my $rrd = RRD::Simple->new( file => "myfile.rrd" );

	$rrd->create(
			bytesIn => "GAUGE",
			bytesOut => "GAUGE",
			faultsPerSec => "COUNTER"
			);


	$rrd->update(
			bytesIn => 10039,
			bytesOut => 389,
			faultsPerSec => 0.4
			);

	my %rtn = $rrd->graph(
			destination => "/var/tmp",
			title => "Network Interface eth0",
			vertical_label => "Bytes/Faults",
			interlaced => ""
			);
	printf("Created %s\n",join(", ",map { $rtn{$_}->[0] } keys %rtn));





}
