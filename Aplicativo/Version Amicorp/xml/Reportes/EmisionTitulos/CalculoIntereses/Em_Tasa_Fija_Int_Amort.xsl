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
              <fo:external-graphic content-height="0px" content-width="47px">
                <xsl:attribute name="src"><xsl:value-of select="../AditionalInfo/UrlLogo"/></xsl:attribute>
              </fo:external-graphic>
            </fo:block>
          </fo:static-content>
          
          <fo:flow flow-name="xsl-region-body">
          <fo:block margin-top="0cm">
                                 <fo:external-graphic  src="http://localhost:8990/Fiduciario/imagenes/logo_bn.jpg"  content-height="scale-to-fit" height="0.70in" scaling="non-uniform"/>
            </fo:block>
            <fo:block margin-top="5mm">
              <fo:table>
                <fo:table-column column-width="9cm"/>
                <fo:table-column column-width="9cm"/>
                <fo:table-body>
                  
                  <fo:table-row>
                    <fo:table-cell>
                    <fo:block text-align="right">
                        <fo:table>
                          <fo:table-column column-width="17cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt"><xsl:value-of select="eaviFecha"/></fo:block></fo:table-cell>
                            </fo:table-row>         
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt">&nbsp;</fo:block></fo:table-cell>
                            </fo:table-row>      
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt">&nbsp;</fo:block></fo:table-cell>
                            </fo:table-row>      
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                      
                      <fo:block text-align="left">
                        <fo:table>
                          <fo:table-column column-width="15cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt"><xsl:value-of select="eaviNomAutoridad1"/></fo:block></fo:table-cell>
                            </fo:table-row>    
                          </fo:table-body>
                        </fo:table>
                        
                        <fo:table>
                          <fo:table-column column-width="5cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt"><xsl:value-of select="eaviDirAutoridad1"/></fo:block></fo:table-cell>
                            </fo:table-row>         
                          </fo:table-body>
                        </fo:table>
                        
                        <fo:table>
                          <fo:table-column column-width="8cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold">Attn. <xsl:value-of select="eaviNomResponsable1"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"><!--xsl:value-of select="eaviNomPuestRespo1"/--></fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold"></fo:block></fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                        
                        <!-- Emision-->
                        <fo:table>
                          <fo:table-column column-width="18cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold">&nbsp;</fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold" text-align="right">Re: Notificación de la emisión</fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="7pt" font-weight="bold" text-align="right"><xsl:value-of select="eaviCvePizarra"/>&nbsp;<xsl:value-of select="eaviNumSerie"/></fo:block></fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                        <!--Emision-->
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell><fo:block text-align="right"></fo:block></fo:table-cell>
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
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            
            <fo:block margin-top="10mm" font-size="7pt" text-align="justify">
               De conformidad con lo establecido en el Título que ampara la Emisión de Certificados Bursátiles Fiduciarios <fo:inline font-weight="bold"><xsl:value-of select="eaviCvePizarra"/>&nbsp;<xsl:value-of select="eaviNumSerie"/></fo:inline> emitidos por 
               <fo:inline font-weight="bold"><xsl:value-of select="eaviNomEmisor"/></fo:inline>, como Fiduciario en el <fo:inline font-weight="bold"><xsl:value-of select="eaviNomFideicomiso"/></fo:inline>, en nuestro carácter de Representante Común de los Tenedores nos permitimos informarles lo siguiente:
            </fo:block>
            
            
            <!--TASA DE INTERES-->
            <fo:block margin-top="10mm" font-size="7pt" font-weight="bold">Tasa de Interés</fo:block>
            <fo:block margin-top="5mm" font-size="7pt">
              <fo:table>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="5cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="1.5cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="1.5cm"/>
                <fo:table-body>
                  <fo:table-row text-align="center" background-color="#2a7587" color="white">
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Cupón</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Periodo</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Días Periodo </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Tasa</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Plazo Tasa</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">C A P</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Sobretasa</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">T R B</fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row text-align="center">
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviNumAmortMasUno"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviFecIniProx"/></fo:inline> al <fo:inline font-weight="bold"><xsl:value-of select="eaviFecFinProx"/></fo:inline></fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviPlazoProx"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviTasaTiie"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviPlazoProx"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviTasaTiie"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviTasaSobretasa"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviTasaActual"/></fo:inline> </fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <!--FIN TASA DE INTERES-->
            
            <!--PAGO DE INTERESES-->
            <fo:block margin-top="10mm" font-size="7pt" font-weight="bold">Pago de Intereses</fo:block>
            <fo:block margin-top="5mm" font-size="7pt">
              <fo:table>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="5cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="3cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-column column-width="2cm"/>
                <fo:table-body>
                  <fo:table-row text-align="center" background-color="#2a7587" color="white">
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Cupón</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Periodo</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Días Periodo </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">T R B</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">V N Inicio</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Intereses</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Fecha de Pago</fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row text-align="center">
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviNumAmort"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviFecIniPeriodo"/></fo:inline> al <fo:inline font-weight="bold"><xsl:value-of select="eaviFecFinPeriodo"/></fo:inline></fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviPeriodicidadDias"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviTasaBruta"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviImpValNomTot"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviImpIntereses"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviFecPago"/></fo:inline> </fo:block></fo:table-cell>
                  
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <!--FIN PAGO DE INTERESES-->
            
            <!--AMORTIZACION-->
            <fo:block margin-top="10mm" font-size="7pt" font-weight="bold">Amortización</fo:block>
            <fo:block margin-top="5mm" font-size="7pt">
              <fo:table>
                <fo:table-column column-width="5cm"/>
                <fo:table-column column-width="4.5cm"/>
                <fo:table-column column-width="4.5cm"/>
                <fo:table-column column-width="4cm"/>
                <fo:table-body>
                  <fo:table-row text-align="center" background-color="#2a7587" color="white">
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Amortización</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">V N Final</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">V N Ajustado por Título</fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block margin-top="1.5mm">Fecha de Pago</fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row text-align="center">
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviImpAmortizacion"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviVnaConv"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviValNomTitulos"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell border="1pt solid black"><fo:block><fo:inline font-weight="bold"><xsl:value-of select="eaviFecPago"/></fo:inline> </fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <!--FIN PAGO DE AMORTIZACION-->
            
            
            <fo:block text-align="center" margin-top="15mm" font-size="7pt">Dichos pagos serán liquidados en las oficinas de la <xsl:value-of select="eaviNomAutoridad1"/> en <xsl:value-of select="eaviDirAutoridad1"/></fo:block>

            
            <fo:block text-align="center" margin-top="10mm" font-size="8pt">Atentamente</fo:block>
            <fo:block text-align="center" margin-top="1mm" font-size="6pt"><xsl:value-of select="eaviNomInstitucion"/></fo:block>
            <fo:block text-align="center" margin-top="1mm" font-size="6pt">en calidad de Representante Común de los Tenedores</fo:block>
            
            <fo:block text-align="center" margin-top="1cm" font-size="6pt">&nbsp;</fo:block>
            
            <fo:block margin-top="15mm" font-size="7pt">
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
                  <fo:table-row text-align="center">
                    <fo:table-cell><fo:block>Delegado Fiduciario </fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block>Delegado Fiduciario</fo:block></fo:table-cell>
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