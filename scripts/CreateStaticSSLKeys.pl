#!/usr/bin/perl

use strict;
use warnings;

my $KeyFilename = "/tmp/SSH_Output";
my $Command = "openssl genrsa -out " . $KeyFilename . ".pem 1024";
my $output = qx/$Command/;

$Command = "openssl rsa -in " . $KeyFilename . ".pem -pubout -out " . $KeyFilename . ".pub";
$output = qx/$Command/;

my $PHPFileContent = "";

$PHPFileContent .= "<?php\n";
$PHPFileContent .= "// You need to create a private and public key with SSL\n\n";

# Here goes the code for the Private Key taken from /tmp/SSH_Output.pub but need to transform.
$PHPFileContent .= "\$PrivKey =\n";
open(my $fh, '<:encoding(UTF-8)', $KeyFilename . ".pem") or die "Could not open file '$KeyFilename' $!";
while (my $row = <$fh>) { chomp $row; $PHPFileContent .= "\t\"$row\\n\" . \n"; }
close ($fh);
$PHPFileContent .= "\t\"\";\n\n";

# Here goes the code for the Public Key taken from /tmp/SSH_Output.pub but need to transform.
$PHPFileContent .= "\$PubKey =\n";
open($fh, '<:encoding(UTF-8)', $KeyFilename . ".pub") or die "Could not open file '$KeyFilename' $!";
while (my $row = <$fh>) { chomp $row; $PHPFileContent .= "\t\"$row\\n\" . \n"; }
close ($fh);
$PHPFileContent .= "\t\"\";\n\n";
$PHPFileContent .= "?>\n";

my @Paths = qw|/home/usracct/statlib/pdf/SSLKeys /home/usracct/statlib/www/SSLKeys|;

foreach ( @Paths ) {
	my $filename = $_ . "/SSLInsideKey.php";
	open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
	print $fh $PHPFileContent
}

$Command = "rm " . $KeyFilename . ".*";
$output = qx/$Command/;

print "Done\n";