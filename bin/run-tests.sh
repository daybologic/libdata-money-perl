#!/bin/sh

set -xe

PERL5LIB=lib:../libtest-module-runnable-perl/lib t/basic.t
PERL5LIB=lib:../libtest-module-runnable-perl/lib t/config.t
PERL5LIB=lib:../libtest-module-runnable-perl/lib t/converter.t
PERL5LIB=lib:../libtest-module-runnable-perl/lib t/version.t

exit 0
