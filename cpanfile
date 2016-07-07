on 'runtime' => sub {
    requires 'perl' => '5.008001';
    requires 'strict';
    requires 'warnings';
    requires 'base';
    requires 'Carp';
    requires 'Exporter';
    requires 'HTML::Entities';
    requires 'IO::Socket::SSL';
    requires 'Try::Tiny';
    requires 'WWW::Shorten' => '3.09';
};

on 'test' => sub {
    requires 'Test::More' => '0.88';
    requires 'Try::Tiny'  => '0.24';
};

on 'develop' => sub {
    requires 'Test::CheckManifest' => '1.29';
    requires 'Test::CPAN::Changes' => '0.4';
    requires 'Test::Kwalitee'      => '1.22';
    requires 'Test::Pod::Spelling::CommonMistakes' => '1.000';
};
