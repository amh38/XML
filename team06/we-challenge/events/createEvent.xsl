<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

	<xsl:template match="/">
	  <h1>Create Event</h1>
		<xsl:apply-templates select="/wgchallenge/users/user[username= $usernameGet and @type= $typeGet]"/>
	</xsl:template>

	<xsl:template match="//user">
		<form enctype="multipart/form-data" action="createEventUpdate.php" method="POST">
			<!-- hidden input for username -->
			<input type="hidden" id="username" name="username">
				<xsl:attribute name="value"><xsl:value-of select="$usernameGet" /></xsl:attribute>
			</input>

			<!-- username -->
			<div class="form-group">
				<label for="eventname-input">Eventname</label>
				<input type="title" class="form-control" name="eventname" id="eventname-input" required="true" placeholder="Name of the Events">
				</input>
			</div>

			<div class="form-group">
				<label for="startdate-input">Startdate</label>
				<input type="date" class="form-control" name="startdate" id="startdate-input" required="true">
				</input>
			</div>
			<div class="form-group">
			<label for="enddate-input">Startdate</label>
			<input type="date" class="form-control" name="enddate" id="enddate-input" required="true">
			</input>
		</div>
			<!-- countResidents -->
			<div class="form-group">
				<label for="residents-input">Residents</label>
				<input type="number" class="form-control" name="residents" id="residents-input" placeholder="Number of min. Residents">
					<xsl:if test="countResidents != 0">
					</xsl:if>
				</input>
			</div>

			<!--clothesWasher radioboxes -->
			<label for="clothesRadiosDiv">Is a Clotheswasher required?</label>
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
			<label for="dishRadiosDiv">Is a Dishwasher required?</label>
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
			<div class="form-group">
				<label for="description-input">Discription</label>
				<input type="title" class="form-control" name="description" id="description-input" placeholder="Description">
				</input>
			</div>

			<button type="submit" class="btn btn-default">Create</button>
		</form>
	</xsl:template>
</xsl:stylesheet>
