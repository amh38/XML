<?php
include_once '../ressources/validation/SaveValidate.php';
  ini_set('display_startup_errors',1);
  ini_set('display_errors',1);
  error_reporting(-1);
  
  // XPath query to find accountname with this username and type
  $xPathQuery = '/wgchallenge/users/user[username/text() = "'.htmlspecialchars($_POST["username"]).'" and @type="'.htmlspecialchars($_POST["typeRadios"]).'"]/username';

  //config
  $sourceFile = '../ressources/data.xml';

  // load XML
  $data = simplexml_load_file($sourceFile);

  // run XPATH query
  $results = $data->xpath($xPathQuery);

  if($results == null){
    //make account
    addEntryToXML($data, htmlspecialchars($_POST["username"]), htmlspecialchars($_POST["typeRadios"]));
    persistXML($sourceFile, $data);
  }
  //set cookie
  setcookie("username", htmlspecialchars($_POST["username"]), time() + (10 * 365 * 24 * 60 * 60), '/');
  setcookie("type", htmlspecialchars($_POST["typeRadios"]), time() + (10 * 365 * 24 * 60 * 60), '/');

  //open accountHome
  echo '<script>document.location = "../home/home.php"</script>';

  function addEntryToXML($data, $username, $type){
    $usersNode = $data->users[0];
    $node = $usersNode->addChild('user');
    $node->addAttribute('type', $type);
    $node->addChild('username',$username);
    $node->addChild('countResidents', 0);
    $node->addChild('clothesWasher', "undefined");
    $node->addChild('dishwasher', "undefined");
    $node->addChild('location', "undefined");
    $node->addChild('profilePicture', "undefined");
  }

?>
