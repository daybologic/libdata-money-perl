#!/bin/sh

set -x

PERL5LIB=lib:../libtest-module-runnable-perl/lib t/basic.t
PERL5LIB=lib:../libtest-module-runnable-perl/lib t/config.t

exit 0
