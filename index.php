<?php

$execute = 'powershell .\control.ps1';

if(isset($_GET["arg"])){
	$execute .= ' "'.$_GET["arg"].'"';
	$out = "";
	$out = exec ($execute, $out);
}

?>
<html>
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="logo.ico" rel="icon" />
    <link href="logo.png" rel="shortcut icon" />
    <link href="logo.png" rel="apple-touch-icon" />
	<title>Remote Control</title>
    <style>
		body{
			display:flex;
			align-items:center;
			justify-content:center;
		}
		a{
			display:block;
			width:120px;
			margin:5px auto;
			border-radius:7px;
			padding:15px 20px;
			background:#2c3e50;
			color:white;
			font-family: 'Segoe UI', Verdana, sans-serif;
			cursor:pointer;
			text-decoration:none;
			text-align:center;
			font-size:20px;
		}
		a:hover{
			text-decoration:underline;
		}
    </style>
</head>
<body>
    <center>
        <table>
            <tr>
                <td>
                    <a href="?arg=PlayPause">PlayPause</a>
                </td>
                <td>
                    <a href="?arg=VolumeUp">VolumeUp</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="?arg=Next">Next</a>
                </td>
                <td>
                    <a href="?arg=VolumeDown">VolumeDown</a>
                </td>
            </tr>
        </table>
        <br />
        <a href="?cancel" style="background:#c0392b;">Cancel</a>
    </center>
</body>
</html>