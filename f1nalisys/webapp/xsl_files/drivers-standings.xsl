<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <h2>
            Drivers Standings
            <xsl:value-of select="StandingsTable/@season"></xsl:value-of>
        </h2>
        &#160;
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Code</th>
                    <th scope="col">Name</th>
                    <th scope="col">Constructor</th>
                    <th scope="col">Wins</th>
                    <th scope="col">Points</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates match="DriverStanding"></xsl:apply-templates>
            </tbody>
            </table>

    </xsl:template>

    <xsl:template match="DriverStanding">
        <tr>
            <th scope="row">
                <xsl:value-of select="@position"></xsl:value-of>
            </th>
            <td>
                <xsl:value-of select="Driver/@code"></xsl:value-of>
            </td>
            <td>
                <xsl:value-of select="Driver/GivenName"></xsl:value-of>
                &#160;
                <xsl:value-of select="Driver/FamilyName"></xsl:value-of>
            </td>
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
    </xsl:template>

</xsl:stylesheet>