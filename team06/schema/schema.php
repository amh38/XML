<?php

/**
 * perform XML validation agaist XML schema with PHP
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/domdocument.schemavalidate.php
 */

// load XML
$data = file_get_contents('bond_movie_faulty.xml');
$xml = new DOMDocument();
$xml->loadXML($data);

// disable error output to client
libxml_use_internal_errors(true);

// validate against Schema
$xsd = 'bond_movie.xsd';
$result = $xml->schemaValidate($xsd);

// create error description
$errors = printErrors();

// send output to client
createPage($result, $errors, $data);

function printErrors() {
    $ret = array();
    $errors = libxml_get_errors();
    foreach ($errors as $error) {
        $ret[] = sprintf('Line [%d]: %s', $error->line, $error->message);
    }
    libxml_clear_errors();
    return implode($ret, '</br>');
}

function createPage($result, $errors, $data) {
    $text = $result ? 'Document is valid.' : 'Document contains errors!';
    echo sprintf('<p><strong>%s</p></strong>', $text);
    echo sprintf('<p>%s</p>', $errors);
    echo sprintf('<textarea class="form-control" readonly="readonly" rows="10" >%s</textarea>', $data);
}
