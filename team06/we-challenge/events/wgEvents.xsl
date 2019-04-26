<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>


	<xsl:template match="/">
		<h1>Deine Teilnahmen</h1>
		<xsl:apply-templates select="/wgchallenge/events/event[members/member/name=$usernameGet]"/>
	</xsl:template>

	<xsl:template match="//event">
		<p>
			<ul>
				<li>Event: <xsl:value-of select='name'/></li>
				<ul>
					<li>Firma: <xsl:value-of select='owner'/></li>
					<li>Beschreibung: <xsl:value-of select="describtion"/> </li>
				</ul>
			</ul>
		</p>
	</xsl:template>
</xsl:stylesheet>
