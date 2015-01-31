<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:wxsl="http://www.w3schools.com/w3style.xsl">

<xsl:namespace-alias stylesheet-prefix="wxsl" result-prefix="xsl"/>

<xsl:template match="/">
  <wxsl:stylesheet>
    <xsl:apply-templates/>
  </wxsl:stylesheet>
</xsl:template>

</xsl:stylesheet> 
