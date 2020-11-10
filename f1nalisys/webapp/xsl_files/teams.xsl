<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="teams">
        <h2>
            Teams &#160;
            <xsl:attribute name="ConstructorTable">
                <xsl:value-of select="season"></xsl:value-of>
            </xsl:attribute>
        </h2>

        <div class="row row-cols-1 row-cols-md-2">
            <xsl:for-each select="Constructor">
                <div class="col mb-4">
                    <div class="card">

                      <div class="card-body">
                        <h5 class="card-title">
                            <xsl:value-of select="Name"></xsl:value-of>
                        </h5>
                        <p class="card-text"> <xsl:value-of select="Nationality"></xsl:value-of> </p>
                      </div>
                    </div>
                    </div>
            </xsl:for-each>
        </div>
    </xsl:template>
</xsl:stylesheet>






