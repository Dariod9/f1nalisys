<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <h2>
            Drivers
            <xsl:value-of select="/DriverTable/@season"></xsl:value-of>
        </h2>

        &#160;

        <div class="row row-cols-1 row-cols-md-2">
            <xsl:for-each select="//Driver">
                <div class="col mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">
                                <a target="_blank" style="color:rgb(255,0,0);">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="@url"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="@code"></xsl:value-of>
                                </a>
                            </h5>
                            <h6 class="card-subtitle mb-2 text-muted">
                                <xsl:value-of select="GivenName"></xsl:value-of>
                                <xsl:value-of select="FamilyName"></xsl:value-of>
                                -
                                <xsl:value-of select="PermanentNumber"></xsl:value-of>
                            </h6>
                            <p class="card-text">
                                <xsl:value-of select="DateOfBirth"></xsl:value-of>
                                ,
                                <xsl:value-of select="Nationality"></xsl:value-of>
                            </p>
                      </div>
                    </div>
                </div>
            </xsl:for-each>
        </div>

    </xsl:template>
</xsl:stylesheet>