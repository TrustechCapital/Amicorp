<?xml version='1.0' encoding='windows-1252'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:fo="http://www.w3.org/XSL/Format/1.0">
  <xsl:template match="/ReportInfo">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="hojaCarta" page-width="279mm"
                               page-height="216mm" margin-top="8mm" margin-bottom="1.45cm" margin-left="1.1cm" margin-right="1.1cm">
          <fo:region-body region-name="xsl-region-body" margin-top="4mm"/>
          <fo:region-before extent="2.9cm" region-name="xsl-region-header"/>
          <fo:region-after extent="2.5mm" region-name="xsl-region-footer"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <xsl:for-each select="QueryInfo/RowInfo">
        <fo:page-sequence master-reference="hojaCarta">
          <fo:static-content flow-name="xsl-region-header">
            <fo:block>
              <fo:table>
                <fo:table-column column-width="25.6cm"/>
                <fo:table-body>
                  
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block>
                        <fo:table>
                          <fo:table-column column-width="10.5cm"/>
                          <fo:table-column column-width="11.4cm"/>
                          <fo:table-column column-width="3.8cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left" font-size="7px">Hoja No.   1<xsl:value-of select="ravNoHoja"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block text-align="left" font-weight="bold" font-size="9px">NACIONAL FINANCIERA S.N.C.</fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left" font-size="7px">No. Póliza  D 234098<xsl:value-of select="ravNoPoliza"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block text-align="left" font-size="7px">Programa:  fiducia32/ficha.rpt<xsl:value-of select="ravNomPrograma"/></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left" font-weight="bold" font-size="14px">FICHA UNICA</fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left" font-size="7px">Fecha   <xsl:value-of select="../AditionalInfo/RavFechaProceso"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block text-align="left" font-size="7px">Area:    60 - 61<xsl:value-of select="ravArea"/></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left" font-weight="bold" font-size="12px">Dirección Fiduciaria</fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left" font-size="7px">Hora:  03:28:04p.m.<xsl:value-of select="ravHora"/></fo:block></fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block margin-top="4mm" font-size="8pt" border="1pt solid black">
                        <fo:table>
                          <fo:table-column column-width="4cm"/>
                          <fo:table-column column-width="1.5cm"/>
                          <fo:table-column column-width="1.6cm"/>
                          <fo:table-column column-width="2cm"/>
                          <fo:table-column column-width="3cm"/>
                          <fo:table-column column-width="3.2cm"/>
                          <fo:table-column column-width="2.8cm"/>
                          <fo:table-column column-width="2.4cm"/>
                          <fo:table-column column-width="1cm"/>
                          <fo:table-column column-width="1.2cm"/>
                          <fo:table-column column-width="1cm"/>
                          <fo:table-column column-width="2cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell>
                                <fo:block text-align="left">Moneda</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">Folio</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">No. Cpto.</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">No. Ope</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">Ente Cargo</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">Ente Abono</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">Importe</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">Deud-Acre</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">T. Ini</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">No. inic</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">Sucursal</fo:block>
                              </fo:table-cell>
                              <fo:table-cell>
                                <fo:block text-align="center">Depend.</fo:block>
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
            <fo:block margin-top="2.4cm" margin-left="0.1cm">
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
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeSecuencial"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeDia"/></fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <xsl:value-of select="apeMes"/></fo:block>
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
                </fo:table-body>
              </fo:table>
            </fo:block>
          </fo:flow>
        </fo:page-sequence>
      
      </xsl:for-each>
      
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
