use strict;
use warnings;
package WWW::curlmyip;

use HTTP::Tiny;
use 5.008;

# ABSTRACT: Returns your ip address using L<http://curlmyip.com>

=head1 SYNOPSIS

    use WWW::curlmyip;

    my $ip = get_ip(); # 54.123.84.6

=head1 EXPORTS

Exports the C<get_ip> function.

=cut

BEGIN {
    require Exporter;
    use base 'Exporter';
    our @EXPORT = 'get_ip';
    our @EXPORT_OK = ();
}

=head1 FUNCTIONS

=head2 get_ip

Returns your ip address, using L<http://curlmyip.com>.

    use WWW::curlmyip;
    my $ip = get_ip();

=cut

sub get_ip {
    my $response = HTTP::Tiny->new->get('http://curlmyip.com');
    die join(' ', 'Error fetching ip: ',
                  ($response->{status} or ''),
                  ($response->{reason} or '')) unless $response->{success};
    my $ip = $response->{content};
    chomp $ip;
    $ip;
}

1;
