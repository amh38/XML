<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">
	  <h1><xsl:value-of select="$usernameGet" /></h1>
		<xsl:apply-templates select="/wgchallenge/users/user[username= $usernameGet and @type = $typeGet]/profilePicture"/>
		<xsl:apply-templates select="/wgchallenge/users/user[username= $usernameGet and @type = $typeGet]"/>
		<a class="btn btn-primary" role="button">
			<xsl:attribute name="href">
				update.php
			</xsl:attribute>
			Update
		</a>
  </xsl:template>

	<xsl:template match="//profilePicture">
		<xsl:if test="text() != 'undefined'">
			<p style="float:left; width:50%;">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select='text()'/>
				  </xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="$usernameGet" /> Profile Picture
				  </xsl:attribute>
					<xsl:attribute name="style">
						max-height:30%; max-width:90%;
				  </xsl:attribute>
				</img>
			</p>
		</xsl:if>
	</xsl:template>

	<xsl:template match="//user">
		<p>
			<ul>
				<li>Username: <xsl:value-of select='username/text()'/></li>
				<xsl:if test="countResidents > 0">
					<li>Residents: <xsl:value-of select='countResidents/text()'/></li>
				</xsl:if>
				<xsl:if test="clothesWasher != 'undefined'">
					<li>has clotheswasher: <xsl:value-of select='clothesWasher/text()'/></li>
				</xsl:if>
				<xsl:if test="dishwasher != 'undefined'">
					<li>has dishwasher: <xsl:value-of select='dishwasher/text()'/></li>
				</xsl:if>
				<xsl:if test="location != 'undefined'">
					<li>Location: <xsl:value-of select='location/text()'/></li>
				</xsl:if>
			</ul>
		</p>
	</xsl:template>
</xsl:stylesheet>
