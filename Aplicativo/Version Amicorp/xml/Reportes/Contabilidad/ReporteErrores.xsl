<?xml version='1.0' encoding='windows-1252'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:fo="http://www.w3.org/XSL/Format/1.0">
  <xsl:template match="/ReportInfo">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="hojaCarta" page-width="216mm"
                               page-height="279mm" margin-top="1.2cm" margin-bottom="5mm" margin-left="1.7cm" margin-right="1.2cm">
          <fo:region-body region-name="xsl-region-body" margin-top="5mm"/>
          <fo:region-before extent="2.7cm" region-name="xsl-region-header"/>
          <fo:region-after extent="5mm" region-name="xsl-region-footer"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      
      <!--xsl:for-each select="QueryInfo/RowInfo"-->
        <fo:page-sequence master-reference="hojaCarta">
          <fo:static-content flow-name="xsl-region-header">
            <fo:block text-align="center" font-weight="bold" font-size="10px">Dirección Fiduciaria</fo:block>
            <fo:block text-align="center" font-weight="bold" font-size="10px">Archivo de Errores Sif.</fo:block>
            <fo:block margin-left="14cm" font-size="7px">Fecha
              <xsl:value-of select="../AditionalInfo/RavFechaProceso"/>
            </fo:block>
            <fo:block margin-top="5mm" font-size="5pt" border="1pt solid black" background-color="silver">
              <fo:table>
                <fo:table-column column-width="18.6cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block margin-left="15.5cm">IMPORTE MONEDA</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block>
                        <fo:table>
                          <fo:table-column column-width="9mm"/>
                          <fo:table-column column-width="1.4cm"/>
                          <fo:table-column column-width="1.8cm"/>
                          <fo:table-column column-width="5.9cm"/>
                          <fo:table-column column-width="8mm"/>
                          <fo:table-column column-width="3mm"/>
                          <fo:table-column column-width="3mm"/>
                          <fo:table-column column-width="3mm"/>
                          <fo:table-column column-width="3mm"/>
                          <fo:table-column column-width="3mm"/>
                          <fo:table-column column-width="1.2cm"/>
                          <fo:table-column column-width="1.1cm"/>
                          <fo:table-column column-width="1.8cm"/>
                          <fo:table-column column-width="2.2cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell>
                                <fo:block text-align="center">SEC.</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">FECHA</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">CONTRATO</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="left">CONCEPTO</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="left">CTAM</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="left">1S</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="left">2S</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="left">3S</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="left">4S</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="left">5S</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">CARGO</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">ABONO</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">NACIONAL</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">EXTRANJERA</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
          </fo:static-content>
          
          <fo:flow flow-name="xsl-region-body" font-size="5pt">
            <fo:block margin-top="1.8cm" margin-left="0.1cm">
              <fo:table>
                <fo:table-column column-width="9mm"/>
                <fo:table-column column-width="3mm"/>
                <fo:table-column column-width="2.5mm"/>
                <fo:table-column column-width="11mm"/>
                <fo:table-column column-width="1.3cm"/>
                <fo:table-column column-width="6cm"/>
                <fo:table-column column-width="8mm"/>
                <fo:table-column column-width="3mm"/>
                <fo:table-column column-width="3mm"/>
                <fo:table-column column-width="3mm"/>
                <fo:table-column column-width="3mm"/>
                <fo:table-column column-width="6mm"/>
                <fo:table-column column-width="1.1cm"/>
                <fo:table-column column-width="1.3cm"/>
                <fo:table-column column-width="1.9cm"/>
                <fo:table-column column-width="2.2cm"/>
                <fo:table-body>
                <xsl:for-each select="QueryInfo/RowInfo">
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeSecuencial"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeDia"/>/</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeMes"/>/</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeAno"/></fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeNumContrato"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeConcepto"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeNumCta"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeNumScta"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeNumSscta"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeNumSsscta"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeNumSssscta"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeNumSsssscta"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeEnteCargo"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeEnteAbono"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeImpMn"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeImpMe"/>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:for-each>
                </fo:table-body>
              </fo:table>
            </fo:block>
          </fo:flow>
        </fo:page-sequence>
        
      <!--/xsl:for-each-->
      
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
