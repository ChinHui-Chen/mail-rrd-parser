#!/usr/bin/perl
# change log
# 	3/9 first version
#
#
use strict ;
use RRD::Simple ;
use RRD::Query ;
use Smart::Comments ;

&main(@ARGV) ;


sub main{
	my $rrd_file = shift ;
	
	# Create an interface object
	my $rrd = RRD::Simple->new( file => $rrd_file );

	my $info = $rrd->info;
	require Data::Dumper;
	print Data::Dumper::Dumper($info);

=c
	my %rtn = $rrd->graph( destination => "/home/chinhui/public_html/tmp",
						   basename => "graph_basename",
						   timestamp => "both", # graph, rrd, both or none
						   line_thickness => 2,
						   extended_legend => 1
						   ) ;
=cut

=c
	my $rq = new RRD::Query( $rrd_file );
	my @datasources = $rq->list();

	### @datasources 

	my $timestamp = $rq->get_last() ;
	
	
	my ($value) = $rq->fetch( "bytesIn" , offset => 19) ;

	### $value
=cut
}
