package ThreatNet::Message;

=pod

=head1 NAME

ThreatNet::Message - An object representation of a ThreatNet channel message

=head1 DESCRIPTION

ThreatNet is an evolving idea. A proposal generally defining what it
B<might> become is available at:

L<http://ali.as/devel/threatnetwork.html>

This module is an abstract base class for a ThreatNet channel message,
and allows you to create objects representing threat messages in a channel.

ThreatNet itself is not yet available and this module has been uploaded
seperately so people working on ThreatNet can play with the various
compenents in different ways before we come to a decision about what
collection of modules will be included in a core ThreatNet.pm package.

=head1 METHODS

=cut

use strict;
use overload 'bool' => sub () { 1 },
             '""'   => 'message';

use vars qw{$VERSION};
BEGIN {
	$VERSION = '0.01';
}





#####################################################################
# Base Constructor

=pod

=head2 new $message

The C<new> constructor takes a string containing the actual channel message
and creates a new object. Please be aware that this method is likely to be
heavily overloaded, so there may be additional requirements.

This base class is extremely flexible and makes absolutely no requirements
on the content of the message, even that is has length.

For an example of a potentially more useful Message class, see
L<ThreatNet::Message::GenericIPv4

Returns a ThreatNet::Message object on success, false if the message is not
a valid message for a particular message class, or C<undef> on error, such
as being passed a non-string.

=cut

sub new {
	my $class   = ref $_[0] ? ref shift : shift;
	my $message = (defined $_[0] and ! ref $_[0]) ? shift : return undef;

	# Create the object
	my $self = bless {
		message => $message,
		}, $class;

	$self;
}

=pod

=head2 message

For any ThreatNet::Messsage class, the C<message> accessor will always
return the message in string form, although it may have been canonicalised
and might not be identical to the original string.

=cut

sub message { $_[0]->{message} }

1;

=pod

=head1 SUPPORT

All bugs should be filed via the bug tracker at

L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=ThreatNet%3A%3AMessage>

For other issues, or commercial enhancement and support, contact the author

=head1 AUTHORS

Adam Kennedy (Maintainer), L<http://ali.as/>, cpan@ali.as

=head1 SEE ALSO

L<http://ali.as/devel/threatnetwork.html>, L<ThreatNet::Topic>,
L<ThreatNet::M

=head1 COPYRIGHT

Copyright (c) 2004 Adam Kennedy. All rights reserved.
This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=cut
