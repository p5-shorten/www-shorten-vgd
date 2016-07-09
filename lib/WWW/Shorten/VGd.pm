package WWW::Shorten::VGd;

use strict;
use warnings;

use base qw( WWW::Shorten::generic Exporter );
our @EXPORT = qw( makeashorterlink makealongerlink );

use Carp ();
use HTML::Entities qw(decode_entities);

# VERSION
$VERSION = eval $VERSION;

sub makeashorterlink {
    my $url = shift or Carp::croak('No URL passed to makeashorterlink');
    my $ua = __PACKAGE__->ua();
    my $response = $ua->post('https://v.gd/create.php', {
        url => $url,
        format => 'simple',
    });

    return unless $response->is_success;
    my $shorturl = $response->decoded_content();
    return undef unless $shorturl;
    return undef if $shorturl =~ m/^\s*Error/;
    return $shorturl;
}

sub makealongerlink {
    my $url = shift or Carp::croak('No v.gd key/URL passed to makealongerlink');
    my $ua = __PACKAGE__->ua();

    $url =~ s{\Qhttps?://v.gd/\E}{}i;
    my $res = $ua->post('https://v.gd/forward.php', {
        shorturl => $url,
        format   => 'simple',
    });

    return undef unless $res->is_success;
    my $longurl = $res->decoded_content;
    return undef unless $longurl;
    return undef if $longurl =~ m/^\s*Error/;
    return decode_entities($longurl);
}

1;

__END__

=head1 NAME

WWW::Shorten::VGd - Shorten URLs using L<https://v.gd/>

=head1 SYNOPSIS

  use strict;
  use warnings;

  use WWW::Shorten::VGd;
  # use WWW::Shorten 'VGd';  # or, this way

  my $short_url = makeashorterlink('http://www.foo.com/some/long/url');
  my $long_url  = makealongerlink($short_url);

=head1 DESCRIPTION

A Perl interface to the web site L<https://v.gd/>.  The service simply maintains
a database of long URLs, each of which has a unique identifier.

By default, this URL shortening service will show you a preview page before redirecting
you. This can be turned off by setting a cookie at L<https://v.gd/previews.php>.

=head1 FUNCTIONS

=head2 makeashorterlink

The function C<makeashorterlink> will call the L<https://v.gd/> web site passing
it your long URL and will return the shorter version.

=head2 makealongerlink

The function C<makealongerlink> does the reverse. C<makealongerlink>
will accept as an argument either the full URL or just the identifier.

If anything goes wrong, then either function will return C<undef>.

=head1 AUTHOR

Mike Doherty <F<doherty@cpan.org>>

=head1 CONTRIBUTORS

=over

=item *

Chase Whitener <F<capoeirab@cpan.org>>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2011 by Mike Doherty <F<doherty@cpan.org>>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
