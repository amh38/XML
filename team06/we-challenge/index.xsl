<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">
    <html lang="en-CH">
      <head>
        <title>We-Challenge</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="../ressources/style.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      </head>
      <body>
        <div id="wrapper" class="container">
          <div id="innerwrapper">
          </div>
          <div class="panel panel-default">
            <div style="padding: 2em;"><h1>WE-Challenge</h1></div>
            <div class="panel-heading">Login or Register for We-Challenge</div>
            <div class="panel-body">
              <form action="login/loggedIn.php" method="post">
                <div class="form-group">
                  <label for="username-input">Username</label>
                  <input type="title" class="form-control" name="username" id="username-input" placeholder="Username" required="true" />
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="typeRadios" id="wgRadio" value="WG" checked="true" />
                  <label class="form-check-label" for="wgRadio">
                    WG
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="typeRadios" id="companyRadio" value="Firma" />
                  <label class="form-check-label" for="companyRadio">
                    Company
                  </label>
                </div>
                <button type="submit" class="btn btn-default">Login/Register</button>
              </form>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
