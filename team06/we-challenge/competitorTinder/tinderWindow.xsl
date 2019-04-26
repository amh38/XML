<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <xsl:apply-templates select="wgchallenge/events" />
    </xsl:template>

    <xsl:template match="wgchallenge/events">
        <xsl:apply-templates select="event[@id= $event_id]" />
    </xsl:template>

    <xsl:template match="event">
        <h2>Event: <xsl:value-of select="name" /></h2>
        <p>Von der Firma <xsl:value-of select="owner" /></p>
        <xsl:apply-templates select="members/member[name= $group_name]" />
    </xsl:template>

    <xsl:template match="members/member">
        <div class="card wg-upload" style="width: 18rem;">
           <xsl:apply-templates select="eventpic" />
            <div class="card-body">
                <h5>
                    <xsl:apply-templates select="name" />
                </h5>
                <p class="card-text">
                    Rating dieser WG:: <xsl:value-of select="$positive_votes div $total_votes * 100" />%
                    <form action="saveTinderDecision.php" method="post">
                        <input class="btn btn-success" type="submit" name="decision" value="Like" />
                        <input class="btn btn-danger" type="submit" name="decision" value="Dislike" />
                        <input type="hidden" name="event_id" value="{$event_id}" />
                        <input type="hidden" name="group_name" value="{$group_name}" />
                    </form>
                </p>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="name">
        Name: <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="eventpic">
        <img class="card-img-top wg-upload-image" alt="WG Picture">
            <xsl:attribute name="src" value="eventpic"><xsl:value-of select="." /></xsl:attribute>
        </img>
    </xsl:template>

</xsl:stylesheet>