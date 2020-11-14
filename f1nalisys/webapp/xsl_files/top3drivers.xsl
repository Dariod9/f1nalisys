<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <xsl:for-each select="//DriverStanding">
            <div class="card">
                <div class="card-header">
                    <b style="color:rgb(255,0,0);">
                        <xsl:value-of select="@position"></xsl:value-of>º lugar
                        -
                        <xsl:value-of select="Driver/@code"></xsl:value-of>
                    </b>
                </div>
                <div class="card-body">
                    <h5 class="card-title">
                        <xsl:value-of select="Driver/PermanentNumber"></xsl:value-of>
                        -
                        <xsl:value-of select="Driver/GivenName"></xsl:value-of>
                        <xsl:value-of select="Driver/FamilyName"></xsl:value-of>
                    </h5>
                    <h6 class="card-subtitle mb-2 text-muted">
                        Driving for: <xsl:value-of select="Constructor/Name"></xsl:value-of>
                    </h6>
                    <p class="card-text">
                        Points:
                        <b><xsl:value-of select="@points"></xsl:value-of></b>
                        |
                        Wins:
                        <b><xsl:value-of select="@wins"></xsl:value-of></b>
                    </p>
                    <p class="card-text">
                        <xsl:value-of select="Driver/DateOfBirth"></xsl:value-of>
                        ,
                        <xsl:value-of select="Driver/Nationality"></xsl:value-of>
                    </p>
                </div>
            </div>
            &#160;
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>