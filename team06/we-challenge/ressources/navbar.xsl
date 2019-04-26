<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">

    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active">
              <a href="home.php">
                <xsl:attribute name="href">../home/home.php</xsl:attribute>
                Home
              </a>
            </li>
            <xsl:apply-templates select="/wgchallenge/users/user[username= $usernameGet and @type = $typeGet]"/>

          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="../index.php">Logout</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>

  </xsl:template>

  <xsl:template match="//user">
    <xsl:if test="@type = 'WG'">
      <li>
        <a href="./events.php?username='.$username.'">
          <xsl:attribute name="href">../events/events.php</xsl:attribute>
          Events
        </a>
      </li>
      <li>
        <a href="./events.php?username='.$username.'">
          <xsl:attribute name="href">../events/wgEvents.php</xsl:attribute>
          My Events
        </a>
      </li>
    </xsl:if>
    <xsl:if test="@type = 'Firma'">
      <li>
        <a>
          <xsl:attribute name="href">../events/myEvents.php</xsl:attribute>
          My Events
        </a>
      </li>
    </xsl:if>
    <xsl:if test="@type = 'Firma'">
      <li>
        <a>
          <xsl:attribute name="href">../events/createEvent.php</xsl:attribute>
          Create Event
        </a>
      </li>
    </xsl:if>
    <li>
        <a>
          <xsl:attribute name="href">../competitorTinder/competitorTinder.php</xsl:attribute>
          Vote
        </a>
      </li>
  </xsl:template>
</xsl:stylesheet>
