<?xml version='1.0'?> 
<!--
Alterar fonte para helvetica (padrao serif hoje)
-->

<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0"> 

<xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl/xhtml/profile-chunk.xsl"/> 
<!--
<xsl:param name="html.stylesheet" select="'corpstyle.css'"/> 
-->

<xsl:template match="lineannotation">
  <fo:inline font-style="italic">
    <xsl:call-template name="inline.charseq"/>
  </fo:inline>
</xsl:template>

<xsl:template name="user.footer.content">
  <HR/>
  <xsl:apply-templates select="//copyright[1]" mode="titlepage.mode"/>
</xsl:template>

<xsl:param name="local.l10n.xml" select="document('')" />
<l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
 <l:l10n language="pt">
  <l:gentext key="nav-home" text="Voltar ao Índice"/>
 </l:l10n>
</l:i18n>

<!--
<xsl:template name="body.attributes">
  <xsl:attribute name="onLoad">alert('Thanks for visiting')</xsl:attribute>
</xsl:template>
-->

<xsl:template name="body.attributes">
  <xsl:attribute name="bgcolor">#e7cac9</xsl:attribute>
  <xsl:attribute name="text">black</xsl:attribute>
  <xsl:attribute name="link">#0000FF</xsl:attribute>
  <!-- <xsl:attribute name="vlink">#840084</xsl:attribute> -->
  <xsl:attribute name="alink">#0000FF</xsl:attribute>
</xsl:template>

<xsl:template name="breadcrumbs">
  <xsl:param name="this.node" select="."/>
  <div class="breadcrumbs">
    <xsl:for-each select="$this.node/ancestor::*">
      <span class="breadcrumb-link">
        <a>
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="."/>
              <xsl:with-param name="context" select="$this.node"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:apply-templates select="." mode="title.markup"/>
        </a>
      </span>
      <xsl:text> &gt; </xsl:text>
    </xsl:for-each>
    <!-- And display the current node, but not as a link -->
    <span class="breadcrumb-node">
      <xsl:apply-templates select="$this.node" mode="title.markup"/>
    </span>
  </div>
</xsl:template>

<xsl:template name="user.header.content">
  <xsl:call-template name="breadcrumbs"/>
</xsl:template>



</xsl:stylesheet>
  