use strict;
use warnings;

use 5.008001;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "Declaratively generate fake structured data for testing",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Data-Fake",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.008001",
  "NAME" => "Data::Fake",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => "5.57",
    "Import::Into" => 0,
    "List::Util" => 0,
    "Text::Lorem" => 0,
    "Time::Piece" => "1.27",
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "Test::Deep" => 0,
    "Test::More" => "0.96"
  },
  "VERSION" => "0.005",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Exporter" => "5.57",
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "Import::Into" => 0,
  "List::Util" => 0,
  "Test::Deep" => 0,
  "Test::More" => "0.96",
  "Text::Lorem" => 0,
  "Time::Piece" => "1.27",
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
