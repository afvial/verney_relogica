<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
      
   <xsl:template match="/">
      
      <header>
         <link rel="stylesheet" type="text/css" href="format.css"/>
      </header> 
      
      <html>
         <body>
            <xsl:apply-templates select="@*|node()"/>
         </body>
      </html>
      
   </xsl:template>
   
   <xsl:template match="p">
      <p><xsl:apply-templates /></p>        
   </xsl:template>
      
   <xsl:template match="s">
      <sentence>
         <xsl:apply-templates select="@*|node()"/>
      </sentence>
   </xsl:template>

   
   <xsl:template match="@lemma | @pos">
     <xsl:attribute name="title">
       <xsl:for-each select="../@*">
	 <xsl:value-of select="name()"/>
	 <xsl:text>:  </xsl:text>
	 <xsl:value-of select="."/>
	 <xsl:text>; </xsl:text>
       </xsl:for-each>
     </xsl:attribute>
   </xsl:template>
   
   <xsl:template match="div[@type='section']/head">
      <h3><xsl:apply-templates select="@*|node()"/></h3>
   </xsl:template>
   
   <xsl:template match="div[@type='subsection']/head">
      <h4><xsl:apply-templates select="@*|node()"/></h4>
   </xsl:template>

   <xsl:template match="@*|node()">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
   </xsl:template>
   
   <xsl:template match="teiHeader|front|sic|note|expan|back "/>
   
   <xsl:template match="pc[@type='hyphenation']"/>
   
</xsl:stylesheet>
