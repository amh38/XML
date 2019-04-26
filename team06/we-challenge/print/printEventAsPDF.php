<!doctype html>
<html lang="en-CH">
<head>
    <title>We-Challenge - <?php echo $_COOKIE['username']; ?></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../ressources/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<div id="wrapper" class="container">
    <div id="innerwrapper">
        <div class="col-sd-12 hidden-xs">
            <img src="../ressources/banner.jpg", class="bannerimg" alt="page_banner">
        </div>
        <?php
        // load XML
        $data = file_get_contents('../ressources/data.xml');
        $xml = new DOMDocument();
        $xml->loadXML($data);

        // load XSL
        $xsl = new DOMDocument();
        $xsl->load('../ressources/navbar.xsl');

        // transform
        $processor = new XSLTProcessor();
        $processor->importStylesheet($xsl);
        $processor->setParameter('', 'usernameGet', $_COOKIE["username"]);
        $processor->setParameter('', 'typeGet', $_COOKIE["type"]);
        $dom = $processor->transformToDoc($xml);

        // send result to client
        echo $dom->saveXML();

        ?>
    </div>

    <div class="container" >
        <?php
        try {
            $event_id = $_GET["event_id"];
            $sourceFile = "output/print_$event_id.fo";
            $targetPath = "output/print_$event_id.pdf";


            $xml = new DOMDocument();
            $xml->load('../ressources/data.xml');

            $xsl = new DOMDocument();
            $xsl->load('pdfCreator.xsl');

            // first phase: XSLT
            $proc = new XSLTProcessor();
            $proc->importStylesheet($xsl);
            $proc->setParameter('', 'event_id', $event_id);
            $newdom = $proc->transformToDoc($xml);

            $newdom->save($sourceFile);
            require_once 'fop_service_client.php';

            // locate the source FO file.
            $foFile = $sourceFile;

            // second phase: create an instance of the FOP client and perform service request.
            $serviceClient = new FOPServiceClient();
            $pdfFile = $serviceClient->processFile($foFile);

            // print to Screen
            echo '<h2>Ihr Ausdruck ist fertiggestelt:<br><br><a href="' . $targetPath . '" target="_blank">Klicken Sie hier zum Downloaden</a></h2>';
        }
        catch(Exception $e)
        {
            echo "Ein Fehler ist aufgetreten: " . $e->getMessage();
        }
        ?>
        <div class="spacer"></div>
    </div>
</div>
</div>
</body>
</html>