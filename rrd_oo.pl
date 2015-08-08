#!/usr/bin/perl
use strict ;
use RRDTool::OO;
use Smart::Comments ;

&main(@ARGV) ;

sub main{
	my $rrd_file = shift or die "No rrd file";
	my $time_period = shift or die "No time period";




	my $rrd = RRDTool::OO->new( file => $rrd_file );

	my $time = $rrd->last() ;

	$rrd->fetch_start(  start => $time-(60*$time_period) , end => $time , cfunc => "AVERAGE" );
	$rrd->fetch_skip_undef() ;

	while(my($time, @value) = $rrd->fetch_next()) {
		### $time
		### @value
	}






#draw graph
	$rrd->graph(
			image          => "mygraph.png",
			vertical_label => 'Test',
			start          => ($time - (60*$time_period) ),
			draw           => {
				type   => "area",
				color  => '0000FF',
				legend => "Time",
			}
	);


	$rrd->dump() ;

}
