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
                <h1>XPATH (modify)</h1>
                <p class="lead">Select XML nodes with XPATH and modify content.<br>
                    <a href="../" class="btn btn-primary">&laquo; Back</a>
                </p>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">Demo</div>
                <div class="panel-body">
                    <?php
                    require 'xpath-modify.php';
                    ?>
                </div>
            </div>
        </div>
    </body>
</html>