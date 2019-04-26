<?php

// Get posted parameters
$event_id = $_POST['event_id'];
$group_name = $_POST['group_name'];

// Load XML
$xml = simplexml_load_file('../ressources/data.xml');

// Load selected member over XPATH
$member = $xml->xpath("/wgchallenge/events/event[@id=$event_id]/members/member[./name=\"$group_name\"]");

// Increment votes
$member[0]->totalVotes += 1;
if($_POST['decision'] == 'Like') $member[0]->positiveVotes += 1;

// Validate new XML before saving
$dom = new DOMDocument();
$dom->loadXML($xml->asXML());
include_once '../ressources/validation/SaveValidate.php';
$returnedValues = validate($dom, "..", "data.xsd");

// Check if XML passed XSD validation
if($returnedValues[0] == "Valid")
{
    // Save XML
    $dom->save('../ressources/data.xml');
    echo '<script>document.location = "competitorTinder.php?event_id='.htmlspecialchars($_POST["event_id"]).'"</script>';
}
else
{
    // Print error if XML was invalid
    echo "Invalid XML. <a href='competitorTinder.php?event_id=$event_id'>Click</a>here to return to the page: ";
}

