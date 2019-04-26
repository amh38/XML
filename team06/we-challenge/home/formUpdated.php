<?php

  //config
  $sourceFile = '../ressources/data.xml';
  $xPathQuery;
  $document;
  $username = htmlspecialchars($_POST["formerUsername"]);
  $type = htmlspecialchars($_POST["formerType"]);
  createNew();

  if($_POST["residents"] == ""){
	  $_POST["residents"] = 0;
  };
  
  if(!isset($_POST['clotheswasherRadios'])) {
	  $_POST["clotheswasherRadios"] = 'undefined';
  }
  
  if(!isset($_POST['dishwasherRadios'])) {
	  $_POST["dishwasherRadios"] = 'undefined';
  }
  
  if($_POST["location"] == ""){
	  $_POST["location"] = 'undefined';
  };
  
  if(!isset($_POST['profilePictureUpload'])) {
	  $_POST["profilePictureUpload"] = 'undefined';
  };

  //change type if new value
  if($_POST["formerType"] != $_POST["typeRadios"]){
    $xPath = new DOMXPATH($document);
    $nodes = $xPath->query($xPathQuery."/@type");
    $nodes->item(0)->nodeValue = $_POST["typeRadios"];
    global $type;
    $type = htmlspecialchars($_POST["typeRadios"]);
    //overwrite old cookie
    setcookie("type", htmlspecialchars($_POST["typeRadios"]), time() + (10 * 365 * 24 * 60 * 60), '/');
    save();
  }


  //change username if new value
  if($_POST["formerUsername"] != $_POST["username"]){
    createNew();
    $xPath = new DOMXPATH($document);
    $nodes = $xPath->query($xPathQuery."/username");
    $nodes->item(0)->nodeValue = $_POST["username"];
    global $username;
    $username = htmlspecialchars($_POST["username"]);
    //overwrite old cookie
    setcookie("username", htmlspecialchars($_POST["username"]), time() + (10 * 365 * 24 * 60 * 60), '/');
    save();
  }

  //Picture upload
  if($_FILES["profilePictureUpload"]["name"] != null){
    //delete former picture (be kind and save some space...)
    if($_POST["formerProfilePicture"] != null){
      unlink($_POST["formerProfilePicture"]);
    }
    //rename and upload file
    $temp = explode(".", $_FILES["profilePictureUpload"]["name"]);
    $newfilename = $_POST["username"] . '_'.rand(0, 10000).'.' . end($temp);
    move_uploaded_file($_FILES["profilePictureUpload"]["tmp_name"], '../ressources/profile_pictures/' . $newfilename);
    //replace value in xml
    createNew();
    $xPath = new DOMXPATH($document);
    $nodes = $xPath->query($xPathQuery."/profilePicture");
    addOrReplace($nodes, "profilePicture", '../ressources/profile_pictures/'.$newfilename);
    save();
  }

  //residents
  createNew();
  $xPath = new DOMXPATH($document);
  $nodes = $xPath->query($xPathQuery."/countResidents");
  addOrReplace($nodes, "countResidents", $_POST["residents"]);
  save();

  //clothesWasher
  createNew();
  $xPath = new DOMXPATH($document);
  $nodes = $xPath->query($xPathQuery."/clothesWasher");
  addOrReplace($nodes, "clothesWasher", $_POST["clotheswasherRadios"]);
  save();

  //dishWasher
  createNew();
  $xPath = new DOMXPATH($document);
  $nodes = $xPath->query($xPathQuery."/dishwasher");
  addOrReplace($nodes, "dishwasher", $_POST["dishwasherRadios"]);
  save();

  //location
  createNew();
  $xPath = new DOMXPATH($document);
  $nodes = $xPath->query($xPathQuery."/location");
  addOrReplace($nodes, "location", $_POST["location"]);
  save();

  echo '
  <script>
    document.location = "../home/home.php";
  </script>
  ';

  function createNew(){
    // XPath query to find accountname with this username and type
    global $type;
    global $username;
    global $xPathQuery;
    $xPathQuery = '/wgchallenge/users/user[username/text() = "'.$username.'" and @type="'.$type.'"]';

    // load XML
    global $sourceFile;
    $data = file_get_contents($sourceFile);
    global $document;
    $document = new DOMDocument();
    $document->loadXML($data);
  }

  function save(){
    // save the updated document
    global $document;
    global $username;
    global $type;
    //validate before save
    include_once '../ressources/validation/SaveValidate.php';
    $returnedValues = validate($document, "..", "data.xsd");
    if($returnedValues[0] == "Valid"){
      $document->save('../ressources/data.xml');
    }else{
      $returnedValues[1] = str_replace("\n", ' ', $returnedValues[1]);
      $returnedValues[1] = str_replace("</br>", ' ', $returnedValues[1]);
      echo '
      <script>
        promptError();
        function promptError() {
          if(!alert("Something went wrong. Try again with other values \n Error(s): \n'.$returnedValues[1].'"));
          document.location = "update.php";
        }
      </script>
      ';
    }
  }

  function addOrReplace($nodes, $elementName, $elementValue){
    if($nodes->item(0) == null){
      createNew();
      global $document;
      global $xPathQuery;
      $xPath = new DOMXPATH($document);
      $nodes1 = $xPath->query($xPathQuery);
      foreach ($nodes1 as $tree) {
        $nodex = $document->createElement($elementName, $elementValue);
        $newnode = $tree->appendChild($nodex);
      }
    }else{
      $nodes->item(0)->nodeValue = $elementValue;
    }
  }
?>
