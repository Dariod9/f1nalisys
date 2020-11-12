<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <div class="col-7">
            <h2> Races </h2>
            <div class="row row-cols-1 row-cols-md-2">
                <xsl:for-each select="/Races/Race">
                <div class="col mb-4">
                    <div class="card">

                      <div class="card-body">
                          <h5 class="card-title" style="color:rgb(255,0,0);">
                              <xsl:value-of select="RaceName"></xsl:value-of>
                          </h5>
                          <p class="card-text">
                              <a target="_blank">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="Circuit/@url"/>
                                </xsl:attribute>
                                  <xsl:value-of select="Circuit/CircuitName"></xsl:value-of>
                              </a>
                          </p>
                          <p class="card-text">
                              <xsl:value-of select="Circuit/Location/Locality"></xsl:value-of>
                              ,
                              <xsl:value-of select="Circuit/Location/Country"></xsl:value-of>
                          </p>
                      </div>
                    </div>
                </div>
            </xsl:for-each>
            </div>
        </div>

    </xsl:template>
</xsl:stylesheet>