<?xml version='1.0' encoding='windows-1252'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:fo="http://www.w3.org/XSL/Format/1.0">
  <xsl:template match="/ReportInfo">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="hojaCarta" page-width="21.6cm"
                               page-height="27.9cm" margin-top="6cm"
                               margin-bottom="2cm" margin-left="2.5cm"
                               margin-right="2.5cm">
          <fo:region-body region-name="xsl-region-body" margin-top="1cm"/>
          <fo:region-before extent="0cm" region-name="xsl-region-header"/>
          <fo:region-after extent="0cm" region-name="xsl-region-footer"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <xsl:for-each select="QueryInfo/RowInfo">
        <fo:page-sequence master-reference="hojaCarta">
          <fo:static-content flow-name="xsl-region-header">
            <fo:block text-align="center" font-weight="bold" font-size="7px">DIRECCIÓN FIDUCIARIA</fo:block>
            <fo:block text-align="center" font-weight="bold" font-size="7px">GERENCIA DE TESORERIA</fo:block>
            <fo:block text-align="center" font-weight="bold" font-size="7px">Insurgentes sur 1971</fo:block>
            <fo:block text-align="center" font-weight="bold" font-size="7px">Edificio Anexo Nivel Jardin</fo:block>
            <fo:block text-align="center" font-weight="bold" font-size="7px">Del. Alvaro Obregon, México D.F.</fo:block>
            <fo:block text-align="center" font-weight="bold" font-size="7px">Col. Guadalupe Inn C.P. 01020</fo:block>
          </fo:static-content>
          <fo:flow flow-name="xsl-region-body">
            <fo:block margin-top="1cm" font-weight="bold" font-size="6px">
              <fo:table>
                <fo:table-column column-width="10.8cm"/>
                <fo:table-column column-width="4cm"/>
                <fo:table-column column-width="1.6cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell><fo:block text-align="left"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left">No. de Fideicomiso</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left"><fo:inline><xsl:value-of select="facNumContrato"/></fo:inline></fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:block margin-top="1cm" font-size="7pt">
              <fo:table>
                <fo:table-column column-width="5.8cm"/>
                <fo:table-column column-width="3.7cm"/>
                <fo:table-column column-width="1.9cm"/>
                <fo:table-column column-width="4cm"/>
                <fo:table-column column-width="1.2cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell><fo:block text-align="left"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left">México D.F.</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left"><fo:inline><xsl:value-of select="facDia"/></fo:inline></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left"><fo:inline><xsl:value-of select="facMes"/></fo:inline></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="right"><fo:inline><xsl:value-of select="facAno"/></fo:inline></fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:block margin-top="0.4cm" font-size="6pt" margin-left="8.8cm">
              <fo:inline><xsl:value-of select="facNombre"/></fo:inline>
            </fo:block>
            <fo:block margin-top="0.7cm" font-size="6pt" text-align="center">
              <fo:inline><xsl:value-of select="facDomicilio"/></fo:inline>
            </fo:block>
            <fo:block margin-top="0.7cm" font-size="6pt" text-align="center">
              <fo:inline><xsl:value-of select="facRfc"/></fo:inline>
            </fo:block>
            <fo:block margin-top="1.5cm" font-size="7pt" font-weight="bold" margin-left="1.8cm">SERVICIOS FIDUCIARIOS POR:</fo:block>
            <fo:block margin-top="1.0cm" font-size="9pt" margin-left="0.9cm">
              <fo:table>
                <fo:table-column column-width="7.5cm"/>
                <fo:table-column column-width="8.3cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell><fo:block><fo:inline><xsl:value-of select="facConcepto"/></fo:inline></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="right"><fo:inline text-align="right"><xsl:value-of select="facImpConcepto"/></fo:inline></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block margin-top="2.4cm" text-align="left" font-size="6pt"><fo:inline><xsl:value-of select="facObservaciones"/></fo:inline></fo:block>
                    </fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:block margin-top="1.9cm" margin-left="2.2cm" font-size="6pt" font-weight="bold">MANEJO DEL FIDEICOMISO</fo:block>
            <fo:block margin-top="0.7cm" margin-left="2.2cm" font-size="6pt" font-weight="bold">POR EL PERIODO</fo:block>
            <fo:block margin-top="0.5cm" margin-left="1.1cm" font-size="6pt">
              <fo:table>
                <fo:table-column column-width="0.7cm"/>
                <fo:table-column column-width="3cm"/>
                <fo:table-column column-width="0.5cm"/>                  
                <fo:table-column column-width="10cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell><fo:block><fo:inline>Del</fo:inline></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block><fo:inline><xsl:value-of select="facDel"/></fo:inline></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block>Al</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block><fo:inline><xsl:value-of select="facAl"/></fo:inline></fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:block margin-top="1.2cm" text-align="right" font-size="9pt">
              <fo:inline><xsl:value-of select="subtotal"/></fo:inline>
            </fo:block>
            <fo:block margin-top="0.6cm" text-align="right" font-size="9pt">
              <fo:inline><xsl:value-of select="iva"/></fo:inline>
            </fo:block>
            <fo:block margin-top="0.4cm" text-align="right" font-size="9pt">
              <fo:inline><xsl:value-of select="total"/></fo:inline>
            </fo:block>
          </fo:flow>
        </fo:page-sequence>
      </xsl:for-each>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
