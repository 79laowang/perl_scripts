#!/usr/bin/perl
#use module Net::FTP  
use Net::FTP;  
#create FTP new connect
$ftp = Net::FTP->new  
(  
"192.168.84.26",  #ftp address
Timeout => 30  
) or die "Could not connect./n";  
#username and password for login
$username = 'wanke05';  
$password = '*******';  
#login to FTP server
$ftp->login($username) or die "Could not login./n";  
#change path  
$ftp->cwd('/dev_setup/Windows/BAB16SP1/');  
#specify the remote file and directory
$remotefile = "LIB_Build6822.1.zip";  
$localfile = "/tmp/tmp.zip";  
#use get/put method to upload/download file
#$ftp->put($localfile,$remotefile) or die "Could not put remotefile:$remotefile/n";  
$ftp->get($remotefile,$localfile) or die "Could not put localfile:$localfile/n";  
#quit FTP Server
$ftp->quit;
