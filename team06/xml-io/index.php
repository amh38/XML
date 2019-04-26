<?php

// send header to set encoding
$encoding = 'utf-8';
$contentType = sprintf('Content-Type: text/html; charset=%s', $encoding);
header($contentType);

?>

<!doctype html>
<html lang="en-CH">
<head>
    <title>PHP XML Snippets</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">

    <div>
        <h1>XML I/O</h1>
        <p class="lead">Read and write XML Files.<br>
            <a href="../" class="btn btn-primary">&laquo; Back</a>
        </p>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Demo</div>
        <div class="panel-body">

            <?php
            require 'xml-io.php';
            ?>

        </div>

    </div>
</div>
</body>
</html>