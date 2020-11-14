<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <h2>
            Constructors Standings
            <xsl:value-of select="StandingsTable/@season"></xsl:value-of>
        </h2>
        &#160;
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Constructor</th>
                    <th scope="col">Wins</th>
                    <th scope="col">Points</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="//ConstructorStanding">
                    <tr>
                        <th scope="row">
                            <xsl:value-of select="@position"></xsl:value-of>
                        </th>
                        <td>
                            <xsl:value-of select="Constructor/Name"></xsl:value-of>
                        </td>
                        <td>
                            <xsl:value-of select="@wins"></xsl:value-of>
                        </td>
                        <td>
                            <xsl:value-of select="@points"></xsl:value-of>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
            </table>

    </xsl:template>
</xsl:stylesheet>