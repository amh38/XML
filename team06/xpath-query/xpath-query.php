<?php

/**
 * Run XPath queries on XML data
 * @author Roland Christen <roland.christen@hslu.ch>
 * API: http://php.net/manual/en/simplexmlelement.xpath.php
 */

// XPath query to find Bond girls between 2000 and 2009
$xPathQuery = '/bond_movies/movie[year > 2000 and year < 2010]/bond_girl/text()';

// load XML
$data = simplexml_load_file('bond_movies.xml');

// run XPATH query
$results = $data->xpath($xPathQuery);

// show Results
createPage($xPathQuery, $results);

function createPage($xPathQuery, $results) {
    echo 'Query:<br>';
    echo sprintf('<input type="text" class="form-control" value="%s" readonly="readonly" /><br><br>', htmlentities($xPathQuery));
    echo 'Results:<br>';
    $resultText = printXML($results);
    echo sprintf('<textarea class="form-control" readonly="readonly" rows="10" >%s</textarea>', $resultText);
}

function printXML($xml) {
    $ret = array();
    foreach ($xml as $item) {
        $ret[] = $item;
    }
    return implode("\n", $ret);
}
