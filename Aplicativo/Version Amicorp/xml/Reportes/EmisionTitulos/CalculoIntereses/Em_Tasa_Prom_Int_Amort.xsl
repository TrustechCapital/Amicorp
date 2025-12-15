<?xml version='1.0' encoding='windows-1252'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:fo="http://www.w3.org/XSL/Format/1.0">
  <xsl:template match="/ReportInfo">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="hojaCarta" page-width="216mm"
                               page-height="279mm" margin-top="10mm" margin-bottom="1cm" margin-left="2cm" margin-right="1.6cm">
          <fo:region-body region-name="xsl-region-body" margin-top="10mm"/>
          <fo:region-before extent="50mm" region-name="xsl-region-header"/>
          <fo:region-after extent="20mm" region-name="xsl-region-footer"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <xsl:for-each select="QueryInfo/RowInfo">      
        <fo:page-sequence master-reference="hojaCarta">
          <fo:static-content flow-name="xsl-region-header">
            <fo:block text-align="center">
              <fo:external-graphic content-height="35px" content-width="47px">
                <xsl:attribute name="src"><xsl:value-of select="../AditionalInfo/UrlLogo"/></xsl:attribute>
              </fo:external-graphic>
            </fo:block>
          </fo:static-content>
          
          <fo:static-content flow-name="xsl-region-footer">
            <fo:block text-align="center" font-weight="bold" font-size="7px">Copias</fo:block>
            <fo:block font-weight="bold" font-size="10px"> <fo:inline><xsl:value-of select="eaviNombre1Ccp"/> - <xsl:value-of select="eaviPuesto1Ccp"/></fo:inline> </fo:block>
            <fo:block font-weight="bold" font-size="10px"> <fo:inline><xsl:value-of select="eaviNombre2Ccp"/> - <xsl:value-of select="eaviPuesto2Ccp"/></fo:inline> </fo:block>
            <fo:block font-weight="bold" font-size="10px"> <fo:inline><xsl:value-of select="eaviNombre3Ccp"/> - <xsl:value-of select="eaviPuesto3Ccp"/></fo:inline> </fo:block>
          </fo:static-content>
          
          <fo:flow flow-name="xsl-region-body">
            <fo:block margin-top="1cm"/>
            <fo:block margin-top="5mm">
              <fo:table>
                <fo:table-column column-width="9cm"/>
                <fo:table-column column-width="9cm"/>
                <fo:table-body>
                  
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <fo:table>
                          <fo:table-column column-width="8cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"><xsl:value-of select="eaviNomAutoridad1"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"><xsl:value-of select="eaviDirAutoridad1"/></fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"></fo:block></fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell><fo:block text-align="left"></fo:block></fo:table-cell>
                  </fo:table-row>
                  
                  <fo:table-row>
                    <fo:table-cell><fo:block margin-top="6mm"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block margin-top="6mm"></fo:block></fo:table-cell>
                  </fo:table-row>
                  
                  <fo:table-row>
                    <fo:table-cell><fo:block text-align="left">
                        <fo:table>
                          <fo:table-column column-width="8cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"></fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"></fo:block></fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                      <fo:block text-align="left">
                        <fo:table>
                          <fo:table-column column-width="1cm"/>
                          <fo:table-column column-width="7cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold">AT'N: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"><xsl:value-of select="eaviNomResponsable1"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"><xsl:value-of select="eaviNomPuestRespo1"/></fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"></fo:block></fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            
            <fo:block margin-top="10mm" font-size="7pt" text-align="justify">
              De conformidad con lo establecido en el título que ampara la Emisión de los Certificados Bursátiles, emitidos por 
              <fo:inline font-weight="bold"><xsl:value-of select="eaviNomEmisor"/></fo:inline>, con clave de pizarra 
              <fo:inline font-weight="bold"><xsl:value-of select="eaviCvePizarra"/></fo:inline> 
              <fo:inline font-weight="bold"><xsl:value-of select="eaviNumSerie"/></fo:inline>, nos permitimos informarles la tasa de rendimiento 
              bruto anual que devengarán los Certificados sobre el valor nominal de los mismos, su 
              procedimiento de cálculo y el importe de los intereses devengados a pagar, liquidable el 
              <fo:inline font-weight="bold"><xsl:value-of select="eaviFecFinProx"/></fo:inline> Conforme al anexo I.
            </fo:block>
            
            <fo:block margin-top="3mm">
              <fo:table>
                <fo:table-column column-width="13cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell><fo:block margin-top="6mm" font-size="7pt" font-weight="bold">DATOS GENERALES DE LA EMISIÓN:</fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block border="1pt solid black" font-size="5.5pt">
                        <fo:table margin-top="2mm" margin-bottom="2mm" margin-left="2mm" margin-right="2mm">
                          <fo:table-column column-width="3cm"/>
                          <fo:table-column column-width="3cm"/>
                          <fo:table-column column-width="1cm"/>
                          <fo:table-column column-width="3cm"/>
                          <fo:table-column column-width="3cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block>CLAVE DE PIZARRA: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block><xsl:value-of select="eaviCvePizarra"/></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block margin-top="1mm">VALOR NOMINAL EMISIÓN: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviImpValNomTot"/></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm">VNA EMISIÓN ANTERIOR: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviImpValNominal"/></fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block margin-top="1mm">TOTAL DE TÍTULOS: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviImpNumTitulos"/></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm">TOTAL DE TÍTULOS: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviImpNumTitulos"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block margin-top="1mm">VALOR NOMINAL X TÍTULO: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviValNomTitulos"/></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm">VALOR NOMINAL X TÍTULO: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviValNomTitulos"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block margin-top="1mm">FECHA DE EMISIÓN: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviFecInicio"/></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm">FECHA EN VIGOR: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviFecPago"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block margin-top="1mm">FECHA DE VENCIMIENTO: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviFecVencimiento"/></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block margin-top="1mm">OFICIO CNBV: </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"><xsl:value-of select="eaviFecCnbv"/></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block margin-top="1mm"></fo:block></fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell><fo:block text-align="left"></fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            
            <fo:block margin-top="7mm" font-size="7pt" font-weight="bold">I. INTERESES DEVENGADOS A PAGAR </fo:block>
            <fo:block font-size="7pt">Periodo
              <fo:inline font-weight="bold"><xsl:value-of select="eaviIdSecCalc"/></fo:inline>: 
              <fo:inline font-weight="bold"><xsl:value-of select="eaviFecIniProx"/></fo:inline> al 
              <fo:inline font-weight="bold"><xsl:value-of select="eaviFecFinProx"/></fo:inline>
            </fo:block>
            
            <fo:block margin-top="4mm" font-size="7pt">
              <fo:table>
                <fo:table-column column-width="1.5cm"/>
                <fo:table-column column-width="4cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="1.5cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="2.5cm"/>
                <fo:table-column column-width="2.5cm"/>
                <fo:table-body>
                  <fo:table-row text-align="center" background-color="blue" color="white">
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">No. PERIODO</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">PERIODO</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">TIIE PROMEDIO</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">SOBRETASA</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">T.R.B.</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">PLAZO DIAS</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">IMPORTE A LIQUIDAR</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">FECHA DE PAGO</fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row text-align="center">
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviIdSecCalc"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviFecIniProx"/></fo:inline> al <fo:inline font-weight="bold"><xsl:value-of select="eaviFecFinProx"/></fo:inline></fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviTasaAplicada"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviTasaSobretasa"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviTasaBruta"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviPlazoProx"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviImpIntereses"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviFecPago"/></fo:inline> </fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            
            <fo:block margin-top="7mm" font-size="7pt" font-weight="bold">
              <fo:inline>II. MONTO A AMORTIZAR Y NUEVO VALOR NOMINAL AJUSTADO A PARTIR DEL <xsl:value-of select="eaviFecFinProx"/></fo:inline>
            </fo:block>
            
            <fo:block margin-top="4mm" font-size="7pt">
              <fo:table>
                <fo:table-column column-width="4cm"/>
                <fo:table-column column-width="1.5cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="3.5cm"/>
                <fo:table-column column-width="2.5cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="2.5cm"/>
                <fo:table-body>
                  <fo:table-row text-align="center" background-color="blue" color="white">
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">VALOR NOMINAL EMISION / ANTERIOR</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">No. AMORT</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">AMORTIZACION</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">NUEVO VALOR NOMINAL AJUSTADO EMISION</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">TOTAL DE TITULOS</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">VNA X TITULO</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">FECHA DE PAGO</fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row text-align="center">
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviImpValNominal"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviNumAmort"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviImpAmortizacion"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviNuevoVna"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviImpNumTitulos"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviValNomTitulos"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviFecPago"/></fo:inline> </fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            
            <fo:block text-align="center" margin-top="15mm" font-size="9pt">Atentamente</fo:block>
            <fo:block text-align="center" margin-top="1mm" font-size="12pt">REPRESENTANTE COMUN DE LOS TENEDORES</fo:block>
            <fo:block text-align="center" font-weight="bold" margin-top="1mm" font-size="14pt">nacional financiera</fo:block>
            <fo:block text-align="center" font-weight="bold" margin-top="1mm" font-size="10pt">Dirección Fiduciaria</fo:block>
            
            <fo:block margin-top="30mm" font-size="7pt">
              <fo:table>
                <fo:table-column column-width="7cm"/>
                <fo:table-column column-width="4cm"/>
                <fo:table-column column-width="7cm"/>
                <fo:table-body>
                  <fo:table-row text-align="center">
                    <fo:table-cell><fo:block><fo:leader leader-length="70mm" leader-pattern="rule" rule-style="solid" rule-thickness="0.3mm" color="#000000" alignment-baseline="central"/></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block><fo:leader leader-length="70mm" leader-pattern="rule" rule-style="solid" rule-thickness="0.3mm" color="#000000" alignment-baseline="central"/></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row text-align="center">
                    <fo:table-cell><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviElaboro"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviFirma"/></fo:inline> </fo:block></fo:table-cell>
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
