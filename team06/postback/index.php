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
        <h1>Postback Example</h1>
        <p class="lead">Gather user input, send to server and process.<br>
            <a href="../" class="btn btn-primary">&laquo; Back</a>
        </p>
    </div>

    <?php
    // determine if postback
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        require 'postback.php';
    } else {
        require 'form.php';
    }
    ?>

</div>
</body>
</html>