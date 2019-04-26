<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>James Bond Movie Catalogue</title>
			</head>
			<body>
			
				<!-- Titel and subtitle -->
			
				<h1>James Bond Movie Catalogue</h1>
				<div>
					<b>This is a list of all James Bond movies between 1962 and <xsl:value-of select="bond_movies/@year"/>.</b>
					<br/><br/>
				</div>
				
				<table border="1" cellpadding="10'">
					<tr style="background-color:#9acd32">
						<th>Title</th>
						<th>Bond Actor</th>
						<th>Bond Girl</th>
						<th>Producer</th>
						<th>Year</th>
						<th>Length</th>
					</tr>
					<xsl:apply-templates />
				</table>
			</body>
		</html>
	</xsl:template>
	
	<!-- Add rows to table -->
	
	<xsl:template match="movie">
		<tr>
			<td>
				<xsl:value-of select="title"/>
			</td>
			<td align="left">
				<xsl:value-of select="bond"/>
			</td>
			<td align="left">
				<xsl:value-of select="bond_girl"/>
			</td>
			<td align="left">
				<xsl:value-of select="regie"/>
			</td>
			<td align="left">
				<xsl:value-of select="year"/>
			</td>
			<td align="center">
				<xsl:choose>
					<xsl:when test="duration">
						<xsl:value-of select="duration"/> min
								</xsl:when>
					<xsl:otherwise>
						<i>unknown</i>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
