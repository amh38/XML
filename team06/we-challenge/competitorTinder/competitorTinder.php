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
        // Check if an event is selected
        // If an event_id is set, the "tinder window" will be displayed. Otherwise, the events will be listed
        $event_id = $_GET["event_id"];
        if(isset($event_id))
        {
            // Create XPath to query the XML
            $xpath = new DOMXPath($xml);

            // Check over xpath if this event exists
            $event_elements = $xpath->evaluate("//events/event[@id = $event_id]");
            if($event_elements->length > 0)
            {
                // Try to select a random participant
                $member_elements = $xpath->evaluate("//events/event[@id = $event_id]/members/member");
                $number_of_members = $member_elements->length;

                if($number_of_members > 0) {
                    // Select "random"
                    $rand_member_index = rand(0, $number_of_members-1);
                    $rand_member_element = $member_elements[$rand_member_index];

                    // Get member data from XML
                    $name = $rand_member_element->getElementsByTagName('name')[0]->nodeValue;
                    $total_votes = $rand_member_element->getElementsByTagName('totalVotes')[0]->nodeValue;
                    $positive_votes = $rand_member_element->getElementsByTagName('positiveVotes')[0]->nodeValue;

                    // load XSL
                    $xsl = new DOMDocument();
                    $xsl->load('tinderWindow.xsl');

                    // transform
                    $processor = new XSLTProcessor();
                    $processor->importStylesheet($xsl);
                    $processor->setParameter('', 'event_id', $event_id);
                    $processor->setParameter('', 'group_name', $name);
                    $processor->setParameter('', 'total_votes', $total_votes);
                    $processor->setParameter('', 'positive_votes', $positive_votes);
                    $dom = $processor->transformToDoc($xml);

                    // send result to client
                    echo $dom->saveXML();
                }
                else {
                    echo "This event has no members...";
                }
            }
            else
            {
                // Print error if an event_id is set, but the event does not exist
                echo "Invalid input. Event with ID $event_id does not exist";
            }
        }
        // This part is executed, if the event_id is not set. This means, that all events are displayed to select one
        else
        {
            // load XSL
            $xsl = new DOMDocument();
            $xsl->load('listEvents.xsl');

            // transform
            $processor = new XSLTProcessor();
            $processor->importStylesheet($xsl);
            $dom = $processor->transformToDoc($xml);

            // send result to client
            echo $dom->saveXML();
        }

    ?>
      <div class="spacer"></div>
    </div>
        </div>
    </div>
</body>
</html>
