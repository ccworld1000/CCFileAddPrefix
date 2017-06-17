#!/usr/bin/perl

#//
#//  Created by CC on 2017/6/17.
#//  Copyright © 2017 CC | ccworld1000@gmail.com . All rights reserved.
#//

use v5.10;
use POSIX;
use File::Copy;

say "add prefix ...";
print "[Enter something, Keep your Prefix]:";
chomp (my $prefix = <STDIN>);

say "The prfix is : $prefix";
say "rename HSRefreshIcon_0001*.png HSRefreshIcon_0001\@2x.png"

if (defined ($prefix)) {

    my @files = glob "*.png";
    my $year_month_day=strftime("%Y%m%d",localtime());
    
    my $handleDir = "${prefix}_${year_month_day}";
    say "mkdir $handleDir";
    mkdir $handleDir;
    
    foreach my $f (@files) {
        my $old_name = $f;
        $old_name  =~ s/(.*_(\d){4})/<$1>/g; 
        my $new_name = $1;
        say "$new_name";
        say $f;
            copy ("$f", "${handleDir}/${new_name}\@2x.png");
        }
}
