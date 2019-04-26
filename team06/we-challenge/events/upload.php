<?php
$sourceFile = '../ressources/data.xml';
$data = simplexml_load_file($sourceFile);

$membersNode= $data->xpath('//event[@id="'.$_POST['eventID'].'"]/members')[0];

//Picture upload
if($_FILES["eventPic"]["name"] != null) {

    //rename and upload file
    $temp = explode(".", $_FILES["eventPic"]["name"]);
    $newfilename = $_POST["eventID"] . '_' . $_POST["member"] . '.' . end($temp);
    move_uploaded_file($_FILES["eventPic"]["tmp_name"], '../ressources/participant_pictures/' . $newfilename);
    //replace value in xml
    $member = $membersNode->addChild("member");
    $member->addChild("name", $_POST["member"]);
    $member->addChild("eventpic", '../ressources/participant_pictures/' . $newfilename);
    $member->addCHild("totalVotes", 0);
    $member->addCHild("positiveVotes", 0);

    include_once '../ressources/validation/SaveValidate.php';
    persistXML($sourceFile, $data);

}
echo '<script>document.location = "../events/wgEvents.php"</script>';


//    createNew();
//    $xPath = new DOMXPATH($document);
//    $nodes = $xPath->query($xPathQuery."/profilePicture");
//    addOrReplace($nodes, "profilePicture", '../ressources/participant_pictures/'.$newfilename);
//    save();

?>
