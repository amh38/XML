<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="participant_list" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="2.5cm" margin-right="2.5cm">
                    <fo:region-body margin-top="1cm" />
                    <fo:region-before extent="2cm" />
                    <fo:region-after extent="3cm" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="participant_list">
                <xsl:apply-templates select="wgchallenge/events/event[@id= $event_id]" />
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="wgchallenge/events/event">
        <fo:static-content flow-name="xsl-region-before">
            <fo:block text-align="center" font-size="8pt">
                Event:  <xsl:apply-templates select="name" /> / Seite:
                <fo:page-number     />
            </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
            <fo:block font-size="20">Event Titel: <xsl:apply-templates select="name" /></fo:block>
            <fo:block font-size="19pt" font-family="sans-serif" line-height="24pt" space-after.optimum="20pt" color="white" text-align="center" padding-top="5pt" padding-bottom="5pt">
                <xsl:apply-templates select="members/member">
                    <xsl:sort select="positiveVotes" order="ascending" />
                </xsl:apply-templates>
            </fo:block>
        </fo:flow>

    </xsl:template>

    <xsl:template match="event/name">
        <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="members/member">
        <fo:table space-after.optimum="20pt" width="13cm" font-size="11pt" margin-top="2cm" background-color="#BDBDBD">
            <fo:table-column column-number="1"/>
            <fo:table-column column-number="2"/>
            <fo:table-body>
                <xsl:apply-templates select="name" />
                <xsl:apply-templates select="totalVotes" />
                <xsl:apply-templates select="positiveVotes" />
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="member/name">
        <fo:table-row>
            <fo:table-cell number-columns-spanned="2">
                <fo:block>
                    Namen der WG: <xsl:value-of select="." />
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="member/totalVotes">
        <fo:table-row>
            <fo:table-cell>
                <fo:block>
                    Totale Anzahl Bewertungen
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="." />
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="member/positiveVotes">
        <fo:table-row>
            <fo:table-cell>
                <fo:block>
                    Positive Bewertungen
                </fo:block>
            </fo:table-cell>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="." />
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

<!--
                    <xsl:apply-templates select="/member">
                        <xsl:sort select="member/positiveVotes" data-type="number" order="descending"/>
                    </xsl:apply-templates>

    <xsl:template match="res:reservations/res:reservation">
        <xsl:variable name="field-id" select="res:fieldId" />
        <fo:table space-after.optimum="20pt" width="13cm" font-size="11pt">
            <fo:table-column column-number="1"/>
            <fo:table-column column-number="2"/>
            <fo:table-column column-number="3"/>
            <fo:table-body >
                <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                        <fo:block font-size="16pt" color="blue" font-weight="900" text-align="left">
                            <xsl:value-of select="title"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-rows-spanned="5">
                        <fo:block>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="3" padding-bottom="10pt">
                        <fo:block>
                            Wir bestätigen Ihre Reservierung auf Rollyreservation. Gerne bestätigen wir folgende Daten von Ihnen:
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="14pt" number-columns-spanned="1" padding-bottom="10pt">
                        <fo:block>
                            Feld:
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt" font-size="12pt">
                        <fo:block>
                            <xsl:value-of select="$infrastructure//inf:field[@id=$field-id]/inf:name" /> - <xsl:value-of select="$infrastructure//inf:field[@id=$field-id]/inf:sport" />
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt">
                        <fo:block>
                            Datum:
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt"  font-size="12pt">
                        <fo:block>
                            <xsl:value-of select="res:date"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt">
                        <fo:block>
                            Preis:
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt"  font-size="12pt">
                        <fo:block>
                            <xsl:value-of select="res:price"/> Fr.
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt" >
                        <fo:block>
                            Teilnehmer:
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt" font-size="12pt">
                        <fo:block>
                            <xsl:value-of select="res:participants"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt">
                        <fo:block>
                            Material:
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt"  font-size="12pt">
                        <fo:block>
                            <xsl:apply-templates  select="res:equipment" />
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt">
                        <fo:block>
                            Ihre Kontaktdaten:
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="1" padding-bottom="10pt" font-size="12pt"  >
                        <fo:block>
                            <xsl:value-of select="res:contact/res:firstName"/><xsl:text> </xsl:text><xsl:value-of select="res:contact/res:lastName"/><fo:block />
                            <xsl:value-of select="res:contact/res:phone"/><fo:block />
                            <xsl:value-of select="res:contact/res:street"/><fo:block />
                            <xsl:value-of select="res:contact/res:zip"/><xsl:text> </xsl:text><xsl:value-of select="res:contact/res:city"/><fo:block />
                            <xsl:value-of select="res:contact/res:mail"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="36pt" number-columns-spanned="3" padding-bottom="10pt">
                        <fo:block>
                            Wir danken Ihnen für Ihr Vertrauen!
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="8pt" number-columns-spanned="3" padding-bottom="10pt">
                        <fo:block>
                            Bei Fragen können Sie sich gerne mit Rollyreservation Kontakt aufnehmen. Wir stehen Ihnen rund um die Uhr zur Verfügung.
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="16pt" number-columns-spanned="3" padding-bottom="10pt">
                        <fo:block>
                            Freundliche Grüsse
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell padding-top="14pt" number-columns-spanned="3" padding-bottom="10pt" font-size="18pt">
                        <fo:block>
                            Rollyreservation
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="res:equipment/res:material">
        <xsl:variable name="material-id" select="res:materialId" />
        <xsl:value-of select="$equipment//mat:material[@id=$material-id]/mat:model" /> (<xsl:value-of select="res:amount" />)<fo:block />
    </xsl:template>
    -->
</xsl:stylesheet>
