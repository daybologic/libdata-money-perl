#!/bin/sh

set -x

PERL5LIB=lib:../libtest-module-runnable-perl/lib t/basic.t

exit 0
