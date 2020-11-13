<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <h2>
            Teams
            <xsl:value-of select="/ConstructorTable/@season"></xsl:value-of>
        </h2>

        <div class="row row-cols-1 row-cols-md-2">
            <xsl:for-each select="/ConstructorTable/Constructor">
                <div class="col mb-4">
                    <div class="card">

                      <div class="card-body">
                        <h5 class="card-title">
                                <a target="_blank" style="color:rgb(255,0,0);">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@url"/>
                                </xsl:attribute>
                                <xsl:value-of select="Name"></xsl:value-of>
                            </a>
                        </h5>
                        <p class="card-text"> <xsl:value-of select="Nationality"></xsl:value-of> </p>
                      </div>
                    </div>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
</xsl:stylesheet>






