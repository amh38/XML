<?php

/**
 * Simple read, write and modify operation on XML data
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/function.simplexml-load-file.php
 * API: http://php.net/manual/en/class.simplexmlelement.php
 */

// init config
$sourceFile = 'profs.xml';
$targetFile = '/tmp/profs_new.xml';

// read xml file and print content
$xml = simplexml_load_file($sourceFile);
$xmlBefore = printXML($xml);

// add new entry to xml
addEntryToXML($xml, 'Thomas Koller', 'SWE');
persistXML($targetFile, $xml);

// print new contents
$xmlAfter = printXML($xml);

// send output to client
createPage($xmlBefore, $xmlAfter);

function printXML($xml) {
    $lines = array();
    foreach ($xml->prof as $prof) {
        $lines[] = sprintf('%s teaches %s', $prof, $prof['teaches']);
    }
    return implode('<br/>', $lines);
}

function addEntryToXML($xml, $prof, $course) {
    $node = $xml->addChild('prof', $prof);
    $node->addAttribute('teaches', $course);
}

function persistXML($path, $xml) {
    file_put_contents($path, $xml->asXML());
}

function createPage($xmlBefore, $xmlAfter) {
    echo sprintf('<strong>XML Content (before inserting new Professor):</strong><br/>%s<br/><br/>', $xmlBefore);
    echo sprintf('<strong>XML Content (after inserting new Professor):</strong><br/>%s', $xmlAfter);
}
