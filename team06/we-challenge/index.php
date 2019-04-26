<?php
  //remove cookies(since logout redirects to this page)
  if (isset($_COOKIE['username'])){
    unset($_COOKIE['username']);
    setcookie('username', null, -1, '/');
  }
  if (isset($_COOKIE['type'])){
    unset($_COOKIE['type']);
    setcookie('type', null, -1, '/');
  }

  // send header to set encoding
  $encoding = 'utf-8';
  $contentType = sprintf('Content-Type: text/html; charset=%s', $encoding);
  header($contentType);
?>
<?php
  // load XML
  $data = file_get_contents('ressources/data.xml');
  $xml = new DOMDocument();
  $xml->loadXML($data);

  // load XSL
  $xsl = new DOMDocument();
  $xsl->load('index.xsl');

  // transform
  $processor = new XSLTProcessor();
  $processor->importStylesheet($xsl);
  $dom = $processor->transformToDoc($xml);

  // send result to client
  echo $dom->saveXML();
?>