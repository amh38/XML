<?php
// send header to set encoding
$encoding = 'utf-8';
$contentType = sprintf('Content-Type: text/html; charset=%s', $encoding);
header($contentType);
?>

<!doctype html>
<html lang="en-CH">
  <head>
    <title>We-Challenge</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../ressources/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <div id="wrapper" class="container">
        <div id="innerwrapper">
            <div class="col-sd-12 hidden-xs">
                <img src="../ressources/banner.jpg", class="bannerimg" alt="page_banner">
            </div>
      <?php
        // load XML
        $data = file_get_contents('../ressources/data.xml');
        $xml = new DOMDocument();
        $xml->loadXML($data);

        // load XSL
        $xsl = new DOMDocument();
        $xsl->load('../ressources/navbar.xsl');

        // transform
        $processor = new XSLTProcessor();
        $processor->importStylesheet($xsl);
        $processor->setParameter('', 'usernameGet', $_COOKIE['username']);
        $processor->setParameter('', 'typeGet', $_COOKIE['type']);
        $dom = $processor->transformToDoc($xml);

        // send result to client
        echo $dom->saveXML();
      ?>
    </div>

    <div class="container" >
      <?php
        // load XML
        $data = file_get_contents('../ressources/data.xml');
        $xml = new DOMDocument();
        $xml->loadXML($data);

        // load XSL
        $xsl = new DOMDocument();
        $xsl->load('createEvent.xsl');

        // transform
        $processor = new XSLTProcessor();
        $processor->importStylesheet($xsl);
        $processor->setParameter('', 'usernameGet', $_COOKIE['username']);
        $processor->setParameter('', 'typeGet', $_COOKIE['type']);
        $dom = $processor->transformToDoc($xml);

        // send result to client
        echo $dom->saveXML();
      ?>
      <div class="spacer"></div>
    </div>
        </div>
    </div>
  </body>
</html>
