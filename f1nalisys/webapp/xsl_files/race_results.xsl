<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <h2>Race Results</h2>
        <h3 style="color:rgb(255,0,0);">
            <xsl:value-of select="//RaceName"></xsl:value-of>
        </h3>

        &#160;
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">#Grid</th>
                    <th scope="col">Code</th>
                    <th scope="col">Name</th>
                    <th scope="col">Constructor</th>
                    <th scope="col">Points</th>
                    <th scope="col">Laps</th>
                    <th scope="col">Time/Status</th>
                    <th scope="col">Fastest Lap (Lap)</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="//Result">
                    <tr>
                        <th scope="row">
                            <xsl:value-of select="@position"></xsl:value-of>
                        </th>
                        <td>
                            <xsl:value-of select="Grid"></xsl:value-of>
                        </td>
                        <td>
                            <xsl:value-of select="Driver/@code"></xsl:value-of>
                        </td>
                        <td>
                            <xsl:value-of select="Driver/GivenName"></xsl:value-of>
                            <xsl:value-of select="Driver/FamilyName"></xsl:value-of>
                        </td>
                        <td>
                            <xsl:value-of select="Constructor/Name"></xsl:value-of>
                        </td>
                        <td>
                            <xsl:value-of select="@points"></xsl:value-of>
                        </td>
                        <td>
                            <xsl:value-of select="Laps"></xsl:value-of>
                        </td>

                        <td>
                            <xsl:choose>
                                <xsl:when test="Time">
                                    <xsl:value-of select="Time"></xsl:value-of>
                                </xsl:when>

                                <xsl:when test="Status">
                                    <xsl:value-of select="Status"></xsl:value-of>
                                </xsl:when>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:value-of select="FastestLap/Time"></xsl:value-of>
                            (<xsl:value-of select="FastestLap/@lap"></xsl:value-of>)
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
            </table>

    </xsl:template>
</xsl:stylesheet>