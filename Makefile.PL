use strict;
use ExtUtils::MakeMaker;

my %attr = (
	NAME              => 'Crypt::SHAVS',
	VERSION_FROM      => 'lib/Crypt/SHAVS.pm',
	PREREQ_FATAL      => 1,
	PREREQ_PM         => {'Digest::SHA' => '5.00'},
	($] >= 5.005 ?
		(ABSTRACT_FROM => 'lib/Crypt/SHAVS.pm',
		AUTHOR         => 'Mark Shelor <mshelor@cpan.org>') : ()),
);

my $MMversion = $ExtUtils::MakeMaker::VERSION || 0;
$attr{NO_META} = 1 unless $MMversion < 6.10_03;

WriteMakefile(%attr);
