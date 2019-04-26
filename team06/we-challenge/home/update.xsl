<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">
	  <h1>Update <xsl:value-of select="$usernameGet" /></h1>
		<xsl:apply-templates select="/wgchallenge/users/user[username= $usernameGet and @type= $typeGet]"/>
	</xsl:template>

	<xsl:template match="//user">
		<form enctype="multipart/form-data" action="formUpdated.php" method="POST">
			<!-- hidden input for former username -->
			<input type="hidden" id="formerUsername" name="formerUsername">
				<xsl:attribute name="value"><xsl:value-of select="$usernameGet" /></xsl:attribute>
			</input>

			<!-- hidden input for former type -->
			<input type="hidden" id="formerType" name="formerType">
				<xsl:attribute name="value"><xsl:value-of select="/wgchallenge/users/user[username= $usernameGet]/@type" /></xsl:attribute>
			</input>

			<!-- hidden input for former profilePicture -->
			<input type="hidden" id="formerProfilePicture" name="formerProfilePicture">
				<xsl:attribute name="value"><xsl:value-of select="/wgchallenge/users/user[username= $usernameGet]/profilePicture" /></xsl:attribute>
			</input>

			<!--type radioboxes -->
			<label for="typeRadiosDiv">Choose your Accounttype</label>
			<div id="typeRadiosDiv">
				<label class="form-check-label radio-inline" for="wgRadio">
					<xsl:if test="@type='WG'">
						<input class="form-check-input" type="radio" name="typeRadios" id="wgRadio" value="WG" checked="true"/>
					</xsl:if>
					<xsl:if test="@type='Firma'">
						<input class="form-check-input" type="radio" name="typeRadios" id="wgRadio" value="WG" />
					</xsl:if>
					<b>WG</b>
				</label>
				<label class="form-check-label radio-inline" for="companyRadio">
					<xsl:if test="@type='WG'">
						<input class="form-check-input" type="radio" name="typeRadios" id="companyRadio" value="Firma"/>
					</xsl:if>
					<xsl:if test="@type='Firma'">
						<input class="form-check-input" type="radio" name="typeRadios" id="companyRadio" value="Firma" checked="true"/>
					</xsl:if>
					<b>Company</b>
				</label>
			</div>
			<br />

			<!-- username -->
			<div class="form-group">
				<label for="username-input">Username</label>
				<input type="title" class="form-control" name="username" id="username-input" required="true">
					<xsl:attribute name="value"><xsl:value-of select="username" /></xsl:attribute>
				</input>
			</div>

			<!-- countResidents -->
			<div class="form-group">
				<label for="residents-input">Residents</label>
				<input type="number" class="form-control" name="residents" id="residents-input" placeholder="Number of Residents">
					<xsl:if test="countResidents != 0">
						<xsl:attribute name="value"><xsl:value-of select="countResidents" /></xsl:attribute>
					</xsl:if>
				</input>
			</div>

			<!--clothesWasher radioboxes -->
			<label for="clothesRadiosDiv">Do you have a Clotheswasher?</label>
			<div id="clothesRadiosDiv">
				<label class="form-check-label radio-inline" for="yesClotheswasherRadio">
					<xsl:if test="clothesWasher='true'">
						<input class="form-check-input" type="radio" name="clotheswasherRadios" id="yesClotheswasherRadio" value="true" checked="true"/>
					</xsl:if>
					<xsl:if test="clothesWasher='false'">
						<input class="form-check-input" type="radio" name="clotheswasherRadios" id="yesClotheswasherRadio" value="true"/>
					</xsl:if>
					<xsl:if test="clothesWasher = 'undefined'">
						<input class="form-check-input" type="radio" name="clotheswasherRadios" id="yesClotheswasherRadio" value="true"/>
					</xsl:if>
					<b>Yes</b>
				</label>
				<label class="form-check-label radio-inline" for="noClotheswasherRadio">
					<xsl:if test="clothesWasher='true'">
						<input class="form-check-input" type="radio" name="clotheswasherRadios" id="noClotheswasherRadio" value="false"/>
					</xsl:if>
					<xsl:if test="clothesWasher='false'">
						<input class="form-check-input" type="radio" name="clotheswasherRadios" id="noClotheswasherRadio" value="false" checked="true"/>
					</xsl:if>
					<xsl:if test="clothesWasher = 'undefined'">
						<input class="form-check-input" type="radio" name="clotheswasherRadios" id="noClotheswasherRadio" value="false" />
					</xsl:if>
					<b>No</b>
				</label>
			</div>
			<br />

			<!--dishWasher radioboxes -->
			<label for="dishRadiosDiv">Do you have a Dishwasher?</label>
			<div id="dishRadiosDiv">
				<label class="form-check-label radio-inline" for="yesDishwasherRadio">
					<xsl:if test="dishwasher='true'">
						<input class="form-check-input" type="radio" name="dishwasherRadios" id="yesDishwasherRadio" value="true" checked="true"/>
					</xsl:if>
					<xsl:if test="dishwasher='false'">
						<input class="form-check-input" type="radio" name="dishwasherRadios" id="yesDishwasherRadio" value="true"/>
					</xsl:if>
					<xsl:if test="dishwasher = 'undefined'">
						<input class="form-check-input" type="radio" name="dishwasherRadios" id="yesDishwasherRadio" value="true"/>
					</xsl:if>
					<b>Yes</b>
				</label>
				<label class="form-check-label radio-inline" for="noDishwasherRadio">
					<xsl:if test="dishwasher='true'">
						<input class="form-check-input" type="radio" name="dishwasherRadios" id="noDishwasherRadio" value="false"/>
					</xsl:if>
					<xsl:if test="dishwasher='false'">
						<input class="form-check-input" type="radio" name="dishwasherRadios" id="noDishwasherRadio" value="false" checked="true"/>
					</xsl:if>
					<xsl:if test="dishwasher = 'undefined'">
						<input class="form-check-input" type="radio" name="dishwasherRadios" id="noDishwasherRadio" value="false"/>
					</xsl:if>
					<b>No</b>
				</label>
			</div>
			<br />

			<!-- Location Input -->
			<div class="form-group">
				<label for="location-input">Location</label>
				<input type="title" class="form-control" name="location" id="location-input" placeholder="Enter your Location">
					<xsl:if test="location != 'undefined'">
						<xsl:attribute name="value"><xsl:value-of select="location" /></xsl:attribute>
					</xsl:if>
				</input>
			</div>

			<!-- profile Picture upload -->
			<div class="form-group">
				<label for="uploadPicture">Upload a (new) profile picture</label>
				<input type="file" name="profilePictureUpload" class="form-control-file" id="uploadPicture" accept=".jpg" />
			</div>

			<button type="submit" class="btn btn-default">Update</button>
		</form>
	</xsl:template>
</xsl:stylesheet>
