<?php
    $teamName = file_get_contents('team.txt');
?>

<!doctype html>
<html lang="en-CH">
<head>
    <title>XML Technologies</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">

    <!-- Title -->
    <div class="jumbotron">
        <h1>XML Technologies</h1>
        <p class="lead"><?php echo $teamName; ?> - XML Project</p>
        <small><a href="mailto:roland.christen@hslu.ch">roland.christen@hslu.ch</a></small>
    </div>

    <!-- Examples List -->
    <div class="row">
        <div class="col-lg-4">
            <h2>XML I/O</h2>
            <p>Read and write XML Files.</p>
            <p>simplexml_load_file(), addChild(), addAttribute(), file_put_contents()... </p>
            <p><a class="btn btn-primary" href="xml-io/" role="button">Demo &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <h2>XSLT server-side</h2>
            <p>Perform XSL-Transformation on server side.</p>
            <p>file_get_contents(), DOMDocument, XSLTProcessor, importStylesheet(), transformToDoc(), saveXML()...</p>
            <p><a class="btn btn-primary" href="xslt/" role="button">Demo &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <h2>Postback</h2>
            <p>Gather user input, send to server and process.</p>
            <p>http post, php arrays, conditional branching, for loop...</p>
            <p><a class="btn btn-primary" href="postback/" role="button">Demo &raquo;</a></p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <h2>XPATH (query)</h2>
            <p>Run XPATH Queries against XML file.</p>
            <p>simplexml_load_file(), xpath(), simplexmlelement.xpath....</p>
            <p><a class="btn btn-primary" href="xpath-query/" role="button">Demo &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <h2>XPATH (modify)</h2>
            <p>Select XML nodes with XPATH and modify content.</p>
            <p>file_get_contents(), DOMDocument, loadXML(), DOMXPath(), query(), nodeValue, saveXML()...</p>
            <p><a class="btn btn-primary" href="xpath-modify/" role="button">Demo &raquo;</a></p>
        </div>
        <div class="col-lg-4">
            <h2>Schema Validation</h2>
            <p>Validate XML file against XML Schema.</p>
            <p>simplexml_load_file(), xpath(), simplexmlelement.xpath....</p>
            <p><a class="btn btn-primary" href="schema/" role="button">Demo &raquo;</a></p>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-4">
            <h2>FOP</h2>
            <p>Invoke FOP web service to create PDF documents.</p>
            <p>HTTPClient, fopen(), fgets(), header(), ...</p>
            <p><a class="btn btn-primary" href="fop-service/" role="button">Demo &raquo;</a></p>
        </div>
        <div class="col-lg-4"></div>
        <div class="col-lg-4"></div>
    </div>

</div>
</body>
</html>
