# NAME

WWW::Shorten::VGd - Shorten URLs using [https://v.gd/](https://v.gd/)

# SYNOPSIS

    use strict;
    use warnings;

    use WWW::Shorten::VGd;
    # use WWW::Shorten 'VGd';  # or, this way

    my $short_url = makeashorterlink('http://www.foo.com/some/long/url');
    my $long_url  = makealongerlink($short_url);

# DESCRIPTION

A Perl interface to the web site [https://v.gd/](https://v.gd/).  The service simply maintains
a database of long URLs, each of which has a unique identifier.

By default, this URL shortening service will show you a preview page before redirecting
you. This can be turned off by setting a cookie at [https://v.gd/previews.php](https://v.gd/previews.php).

# FUNCTIONS

## makeashorterlink

The function `makeashorterlink` will call the [https://v.gd/](https://v.gd/) web site passing
it your long URL and will return the shorter version.

## makealongerlink

The function `makealongerlink` does the reverse. `makealongerlink`
will accept as an argument either the full URL or just the identifier.

If anything goes wrong, then either function will return `undef`.

# AUTHOR

Mike Doherty <`doherty@cpan.org`>

# CONTRIBUTORS

- Chase Whitener <`capoeirab@cpan.org`>

# LICENSE AND COPYRIGHT

Copyright 2011 by Mike Doherty <`doherty@cpan.org`>.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
