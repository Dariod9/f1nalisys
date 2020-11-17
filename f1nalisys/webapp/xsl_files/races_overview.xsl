<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <h2> Races </h2>
        <h5>
            <xsl:value-of select="//Race[last()]/@round"></xsl:value-of>
            Rounds
        </h5>

        <div class="row row-cols-1 row-cols-md-2">
            <xsl:apply-templates></xsl:apply-templates>
        </div>


    </xsl:template>


    <xsl:template match="/Races/Race">
                <div class="col mb-4">
                    <div class="card">
                        <div class="card-header">
                            <b class="card-title">
                                <a target="_blank" style="color:rgb(255,0,0);">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="@url"/>
                                </xsl:attribute>
                                    <xsl:value-of select="RaceName"></xsl:value-of>
                                </a>
                            </b>
                            -
                            round
                            <xsl:value-of select="@round"></xsl:value-of>
                        </div>

                        <div class="card-body">
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
                            <p class="card-text">
                                <xsl:value-of select="Date"></xsl:value-of>
                            </p>

                            <xsl:variable name="season" select="@season"></xsl:variable>
                            <xsl:variable name="round" select="@round"></xsl:variable>


                            <a class="btn btn-info btn-sm">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="'/season/'"></xsl:value-of>
                                    <xsl:value-of select="$season"></xsl:value-of>
                                    <xsl:value-of select="'/round/'"></xsl:value-of>
                                    <xsl:value-of select="$round"></xsl:value-of>
                                </xsl:attribute>
                                Standings
                            </a>
                        </div>
                    </div>
                </div>

    </xsl:template>

</xsl:stylesheet>