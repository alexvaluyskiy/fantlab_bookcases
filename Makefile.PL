use 5.010001;

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Fantlab Bookcases',
  VERSION_FROM => 'lib/FantlabBookcases.pm',
  ABSTRACT     => 'Fantlab Bookcases Service',
  AUTHOR       => 'Alex Valuyskiy <olval@ciklum.com>',
  LICENSE      => 'mit',
  PREREQ_PM => {
    'Mojolicious'    => '6.31',
    'common::sense'  => '3.74'
  },
  EXE_FILES => ['script/fantlab_bookcases'],
  test => {TESTS => 't/*.t t/*/*.t'}
);
