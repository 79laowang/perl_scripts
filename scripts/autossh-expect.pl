#!/usr/bin/perl
use Expect;
use Net::FTP; 
use strict;
use warnings;

my $timeout = 20;
my $cmd = "ssh";
my $exp = Expect->spawn($cmd,"root\@192.168.103.186") or die "Can't spawn $cmd!";
$exp->expect($timeout,-re=>'[Pp]assword:');
$exp->debug(1);
$exp->send("Passw0rd!\r\n");
$exp->expect($timeout,-re=>'Last login');
$exp->send("ps -ef |grep java\r\n");
$exp->expect($timeout,-re=>'java');
print $exp->match_number();
$exp->soft_close();
