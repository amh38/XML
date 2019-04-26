<?php
  function validate($domdoc, $relativePathToHead, $validationFile){
    // disable error output to client
    libxml_use_internal_errors(true);
    $result = $domdoc->schemaValidate($relativePathToHead."/ressources/validation/".$validationFile);
    $errors = printErrors();
    $text = $result ? 'Valid' : 'Invalid';
    return [$text, $errors];
  }

  function printErrors() {
    $ret = array();
    $errors = libxml_get_errors();
    foreach ($errors as $error) {
        $ret[] = sprintf('Line [%d]: %s', $error->line, $error->message);
    }
    libxml_clear_errors();
    return implode($ret, '</br>');
  }
function persistXML($path, $data){
    //validate before save
//    include_once '../ressources/validation/SaveValidate.php';
    $dom = new DOMDocument;
    $dom->loadXML($data->asXML());
    $returnedValues = validate($dom, "..", "data.xsd");
    if($returnedValues[0] == "Valid"){
        file_put_contents($path, $data->asXML());
    }else{
        if (strpos($returnedValues[1], 'username') !== false && strpos($returnedValues[1], 'Duplicate') !== false) {
            echo '
        <script>
          promptDuplicatename();
          function promptDuplicatename() {
            if(!alert("Username already taken, pls choose another name.")) document.location = "../index.php";
          }
        </script>
        ';
        }else{
            echo '
        <script>
          promptDuplicatename();
          function promptDuplicatename() {
            if(!alert("Es ist ein Fehler aufgetreten. Bitte versuche es erneut oder wende dich an die Entwickler.")) document.location = "../index.php";
          }
        </script>
        ';
        }
    }
}
?>
