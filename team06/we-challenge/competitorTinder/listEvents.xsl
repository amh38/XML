<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

    <xsl:template match="/">
        <xsl:apply-templates select="wgchallenge/events" />
    </xsl:template>

    <!-- do nothing with user tags
    <xsl:template match="users" /> -->

    <xsl:template match="events">
        <h1>Verfügbare Events</h1>
        <div class="container-fluid">
            <div class="row">
                <xsl:apply-templates select="event" />
            </div>
        </div>
    </xsl:template>


    <xsl:template match="event">
        <div>
            <div class="card w-65 event-container">
                <div>
                    <div>

                    <xsl:apply-templates select="name" /><br />
                    <xsl:apply-templates select="owner" /><br />
                    <xsl:apply-templates select="description" /><br />
                    <xsl:apply-templates select="startdate" /><br />
                    <xsl:apply-templates select="enddate" /><br />
                    </div>
                    <div>
                       <a class="btn btn-primary" href="competitorTinder.php?event_id={@id}">Für dieses Event abstimmen!</a>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="name">
        <h6><xsl:value-of select="." /></h6>
    </xsl:template>
    <xsl:template match="owner">
        Organisiert von:<xsl:value-of select="." />
    </xsl:template>
    <xsl:template match="description">
        Beschreibung: <xsl:value-of select="." />
    </xsl:template>
    <xsl:template match="startdate">
        Start am: <xsl:value-of select="." />
    </xsl:template>
    <xsl:template match="enddate">
        Endet am: <xsl:value-of select="." />
    </xsl:template>

</xsl:stylesheet>
