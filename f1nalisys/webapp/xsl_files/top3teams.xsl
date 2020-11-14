<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <xsl:for-each select="//ConstructorStanding">
            <div class="card">
                <div class="card-header">
                    <b style="color:rgb(255,0,0);">
                        <xsl:value-of select="@position"></xsl:value-of>º lugar
                    </b>
                </div>
                <div class="card-body">
                    <h5 class="card-title">
                        <xsl:value-of select="Constructor/Name"></xsl:value-of>
                    </h5>
                    <p class="card-text">
                        Points:
                        <b><xsl:value-of select="@points"></xsl:value-of></b>
                        |
                        Wins:
                        <b><xsl:value-of select="@wins"></xsl:value-of></b>
                    </p>
                </div>
            </div>
            &#160;
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>