<?php

/**
 * Modifing XML data with XPath
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/class.domdocument.php
 * API: http://php.net/manual/en/class.domxpath.php
 */

// define XPath Query
$xPathQuery = '/bond_movies/movie[@number="_22"]/bond';

// load XML
$fileContents = file_get_contents('bond_movies.xml');
$document = new DOMDocument();
$document->loadXML($fileContents);

// run xpath query 
$xPath = new DOMXPath($document);
$nodes = $xPath->query($xPathQuery);

// change value of node
$nodes->item(0)->nodeValue = 'That was me!';

// show modified xml
echo $document->saveXML();