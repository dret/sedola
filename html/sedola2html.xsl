<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <xsl:apply-templates select="." mode="include"/>
    </xsl:template>
    <xsl:template match="@* | node()" mode="include">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="include"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="include" mode="include">
        <xsl:variable name="include" select="doc(@href)"/>
        <xsl:apply-templates select="$include" mode="include"/>
    </xsl:template>
</xsl:stylesheet>