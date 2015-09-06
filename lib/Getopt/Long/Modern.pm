package Getopt::Long::Modern;

use strict;
use warnings;
use Getopt::Long 'GetOptions';
require Exporter;

our $VERSION = '0.001';

our @ISA = 'Exporter';
our @EXPORT = qw(GetOptions);

my @config = qw(gnu_getopt no_auto_abbrev no_ignore_case);

sub import {
	my $class = shift;
	local $Exporter::ExportLevel = 1;
	$class->SUPER::import;
	Getopt::Long::Configure(@config);
	Getopt::Long::Configure(@_) if @_;
}

1;

=head1 NAME

Getopt::Long::Modern - Use Getopt::Long with modern defaults

=head1 SYNOPSIS

 use Getopt::Long::Modern;
 GetOptions(
   "f|foo=i" => \my $foo,
   "b|bar"   => \my $bar,
   "Z|baz=s" => \my @baz,
 );

=head1 DESCRIPTION

L<Getopt::Long::Modern> is a simple wrapper of L<Getopt::Long> to reduce the
amount of typing needed to get modern defaults, and to avoid having to remember
the correct incantations.

Only the C<GetOptions> function from L<Getopt::Long> is exported. Additional
L<Getopt::Long> configuration may be passed as import options.

 use Getopt::Long::Modern 'auto_help', 'auto_version', 'passthrough';

For any more advanced usage, you should probably use L<Getopt::Long> directly.

=head1 DEFAULTS

L<Getopt::Long::Modern> currently sets the following configuration options by
default.

=head2 gnu_getopt

This sets C<gnu_compat> to allow C<--opt=> for setting an empty option,
C<bundling> to allow short options to be bundled together, C<permute> to allow
specifying options before or after other arguments, and C<no_getopt_compat> to
disallow C<+> for specifying options.

=head2 no_auto_abbrev

This disables the functionality that automatically allows abbreviated versions
of any option, because no one is ever going to specify C<--foo> as C<--fo>, and
it is not useful when you have multiple options that abbreviate to the same
single-letter option. When is desired to have a single-letter short option
versions available, this can be specified explicitly with the normal C<|>
syntax.

=head2 no_ignore_case

This makes all options case-sensitive, which is expected and required when
explicitly specifying short options of the same character but different case.

=head1 BUGS

Report any issues on the public bugtracker.

=head1 AUTHOR

Dan Book <dbook@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2015 by Dan Book.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=head1 SEE ALSO

L<Getopt::Long::Descriptive>, L<Getopt::Again>, L<Opt::Imistic>
