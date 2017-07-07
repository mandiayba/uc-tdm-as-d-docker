<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:a="xalan://org.bibliome.alvisnlp.modules.xml.XMLWriter2"
                xmlns:b="http://bilbiome.jouy.inra.fr/alvisnlp/XMLReader2"
                xmlns:inline="http://bibliome.jouy.inra.fr/alvisnlp/bibliome-module-factory/inline"
		extension-element-prefixes="a b inline"
>

  <xsl:output method="xml" omit-xml-declaration="yes" indent="no"/>



<xsl:template match="child::node()|@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="child::node()|@*|node()"/>
    </xsl:copy>
</xsl:template>

<!-- <xsl:template match="text()"> -->
    <!-- <xsl:value-of select="normalize-space(.)"/> -->
<!-- </xsl:template> -->
<xsl:template match="text()">
  <xsl:value-of select=
  "concat(substring(' ', 1 + not(substring(.,1,1)=' ')),
          normalize-space(),
          substring(' ', 1 + not(substring(., string-length(.)) = ' '))
          )
  "/>
  </xsl:template>

<xsl:template match="b:element">
  <xsl:choose>
    <xsl:when test="@type='ne'">
      <xsl:element name="{@ne-type}">
	<xsl:apply-templates select="child::node()"/>
      </xsl:element>
    </xsl:when>
  </xsl:choose>
</xsl:template>

  <xsl:template match="/">
    <xsl:for-each select="a:elements('documents')">
      <xsl:value-of select="@DI"/>
      <xsl:text>&#9;</xsl:text>
      <xsl:for-each select="a:elements('sections')">
	<!-- <xsl:copy-of select="a:inline('layer:genes|layer:markers|layer:taxa')"/> -->
	<xsl:for-each select="a:inline('layer:genes|layer:markers|layer:taxa|layer:phenotypes|layer:accessions')">
	  <xsl:apply-templates select="child::node()"/>
	</xsl:for-each>
	<xsl:text> </xsl:text>
      </xsl:for-each>
      <!-- <xsl:for-each select="a:elements('sections.layer:genes')"> -->
      <!-- 	<xsl:value-of select="@canonical-form"/> -->
      <!-- 	<xsl:text> </xsl:text> -->
      <!-- </xsl:for-each> -->
      <xsl:text>&#10;</xsl:text>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
