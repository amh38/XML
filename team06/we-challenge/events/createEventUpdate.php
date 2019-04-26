<?php
$sourceFile = '../ressources/data.xml';
$data = simplexml_load_file($sourceFile);

addEventToXML($data);
//validate before save
include_once '../ressources/validation/SaveValidate.php';
persistXML($sourceFile, $data);

echo '<script>document.location = "../events/myEvents.php"</script>';


function addEventToXML($data)
{
    $idArray = $data->xpath("//event/@id");
    $id = end($idArray)+1;
    $eventsNode = $data->events[0];

    $node = $eventsNode->addChild("event");
    $node->addAttribute("id", $id);
    $node->addChild("name", $_POST["eventname"]);
    $node->addChild("startdate", $_POST["startdate"]);
    $node->addChild("enddate", $_POST["enddate"]);
    $node->addChild("minResidents", $_POST["residents"]);
    $node->addChild("reqCW", $_POST["clotheswasherRadios"]);
    $node->addChild("reqDW", $_POST["dishwasherRadios"]);
    $node->addChild("description", $_POST['description']);
    $node->addChild("owner", $_POST["username"]);
    $node->addChild("members");
}
?>
