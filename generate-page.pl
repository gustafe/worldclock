#!/usr/bin/perl

use strict;
use warnings;
use CGI qw/:standard/;

my @cities;
while (<DATA>) {
    chomp;
    my ($city, $id) = split(/\t/, $_);
    push @cities, {city => $city, id => $id };
}


#build the content
my @list = @cities;
my $rows;

# print the content
while (@list) {

#    printf("%s has ID %s\n", $el->{city}, $el->{id});
    my $row;
    foreach my $i (0,1,2,3) { # 3 columns
	my $el = shift @list;
	my $cell;
	if ( defined $el ) {
	    $cell = "<span class='citydisplay'>$el->{city}</span>".
		      br().
		      span({-id=>$el->{id}});
		     
	} else { $cell = 'n/a' }
	push @{$row}, $cell;
    }
    push @{$rows}, $row;
}

# print the table!
print table( {-cellpadding=>10, -cellspacing=>10}, 
	     Tr({-align=>'CENTER',-valign=>'BOTTOM'},
		[
		 map {
		     td([
			 @$_ ])
		 } @{$rows}
		 ])
	     );


# generate the script
print '<script src="https://widget.time.is/en.js"></script>',"\n";
print '<script>time_is_widget.init({';
foreach my $el (@cities) {
    print $el->{id}, ': { template: "<span class=\'timedisplay\'>TIME</span><br/><span class=\'datedisplay\'>DATE</span>", time_format:"hours:minutes", date_format: "year-monthnum-daynum"},',"\n";
}
print '}); </script>';



__END__
US Pacific	San_Francisco_z14e
US Mountain	Denver_z12b
US Central	Oklahoma_City_z123
US Eastern	New_York_z161
S&atilde;o Paulo	_z17b
<span style='color:#dc322f;'>UTC</span>	UTC_za00
London	London_z716
<span style='color:#dc322f;'>Stockholm</span>	Stockholm_z72a
Cairo	Cairo_z00c
Istanbul	Istanbul_z710
Moscow	Moscow_z71d
New Delhi	New_Delhi_z424
Yangon	Yangon_z438
Beijing &amp; KL	Beijing_z43d
Tokyo	Tokyo_z444
Sydney	Sydney_z60b
