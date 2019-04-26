<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>


	<xsl:template match="/">
		<h1>Deine Events</h1>
		<p>
		<ul>
		<xsl:apply-templates select="/wgchallenge/events/event[owner=$usernameGet]"/>
		</ul>
		</p>
	</xsl:template>

	<xsl:template match="//event">
		<xsl:variable name="name" select="name"></xsl:variable>
				<li>Event:
					<xsl:value-of select='name'/>
				</li>
				<ul>
					<li>Beschreibung:
						<xsl:value-of select="description"/>
					</li>
					<li>Teilnehmer:
						<xsl:apply-templates select="/wgchallenge/events/event[name=$name]/members/member"/>
					</li>
					<li>
						<a class="btn btn-primary" href="../print/printEventAsPDF.php?event_id={@id}">PDF generieren</a>
					</li>
				</ul>
	</xsl:template>

	<xsl:template match="//member">
		<ul>
			<li>
				<xsl:value-of select="name"/>
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select='eventpic'/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="name" /> Profile Picture
					</xsl:attribute>
					<xsl:attribute name="style">
						max-height:30%; max-width:90%;
					</xsl:attribute>
				</img>
			</li>
		</ul>
	</xsl:template>
</xsl:stylesheet>
