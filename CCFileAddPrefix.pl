#!/usr/bin/perl

#//
#//  Created by CC on 03/06/2017.
#//  Copyright © 2017 CC | ccworld1000@gmail.com . All rights reserved.
#//

use v5.10;
use POSIX;
use File::Copy;

say "add prefix ...";
print "[Enter something, Set your Prefix]:";
chomp (my $prefix = <STDIN>);

say "The prfix is : $prefix";

if (defined ($prefix)) {
    
    my @files = glob "*.pdf";
    
    #say @files;
    
    my $year_month_day=strftime("%Y%m%d%M%S",localtime());
    
    my $handleDir = "${prefix}_${year_month_day}";
    say "mkdir $handleDir";
    mkdir $handleDir;
    
    foreach my $f (@files) {
        copy ("$f", "${handleDir}/${prefix}_${f}");
    }
}
