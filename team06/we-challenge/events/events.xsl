<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>


	<xsl:template match="/">
		<xsl:variable name="resi" select="//wgchallenge/users/user[username=$usernameGet]/countResidents"/>
		<xsl:variable name="clothes" select="//wgchallenge/users/user[username=$usernameGet]/clothesWasher"/>
		<xsl:variable name="dish" select="//wgchallenge/users/user[username=$usernameGet]/dishwasher"/>
		<h1>Mögliche Teilnahmen</h1>
		<xsl:apply-templates select="/wgchallenge/events/event[minResidents &lt;= $resi and reqCW = $clothes and reqDW = $dish]"/>
	</xsl:template>

	<xsl:template match="//event">
		<p>
			<ul>
				<li>Event: <xsl:value-of select='name'/></li>
				<ul>
					<li>Firma: <xsl:value-of select='owner'/></li>
					<li>Beschreibung: <xsl:value-of select="description"/> </li>
				</ul>
				<form action="upload.php" method="post" enctype="multipart/form-data">
					Select image to upload:
					<input type="file" name="eventPic" id="eventPic"/>
					<input type="submit" value="Upload Image" name="submit"/>
					<input type="hidden" id="eventID" name="eventID">
						<xsl:attribute name="value"><xsl:value-of select="@id" /></xsl:attribute>
					</input>
					<input type="hidden" id="member" name="member">
						<xsl:attribute name="value"><xsl:value-of select="$usernameGet" /></xsl:attribute>
					</input>
				</form>
			</ul>
		</p>
	</xsl:template>
</xsl:stylesheet>
