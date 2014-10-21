#!/usr/bin/perl -w

# ThreatNet::Message basic functionality tests

use strict;
use lib ();
use UNIVERSAL 'isa';
use File::Spec::Functions ':ALL';
BEGIN {
	$| = 1;
	unless ( $ENV{HARNESS_ACTIVE} ) {
		require FindBin;
		chdir ($FindBin::Bin = $FindBin::Bin); # Avoid a warning
		lib->import( catdir( updir(), updir(), 'modules') );
	}
}





# Does everything load?
use Test::More 'tests' => 24;
use ThreatNet::Message ();

# Create the test data
my @good = (
	'',
	'a',
	' ',
	'foo',
	'this is a multipart thing',
	);
my @bad = (
	undef,
	[],
	\"stringref",
	{},
	);

# Create a basic object
foreach my $string ( @good ) {
	my $Message = ThreatNet::Message->new($string);
	isa_ok( $Message, 'ThreatNet::Message' );
	ok( $Message, 'bool overload returns true' );
	is( $Message->message, $string, '->message returns original string' );
	is( "$Message", $string, 'Stringify overload returns string' );
}
foreach my $something ( @bad ) {
	my $Message = ThreatNet::Message->new($something);
	is( $Message, undef, 'Bad message returns undef' );
}

