<?xml version='1.0' encoding='windows-1252'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:fo="http://www.w3.org/XSL/Format/1.0">
  <xsl:template match="/ReportInfo">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="hojaCarta" page-width="21.6cm"
                               page-height="27.9cm" margin-top="2cm" margin-bottom="1cm" margin-left="1.2cm" margin-right="1.4cm">
          <fo:region-body region-name="xsl-region-body" margin-top="2cm"/><!-- Este margen es con relacion a donde empieza el margen superior-->
          <fo:region-before extent="2cm" region-name="xsl-region-header"/>
          <fo:region-after extent="0.4cm" region-name="xsl-region-footer"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <xsl:for-each select="QueryInfo/RowInfo">      
        <fo:page-sequence master-reference="hojaCarta">
          <fo:static-content flow-name="xsl-region-header">
            <!-- initial-page-number="1"
            fo:block text-align-last="right" font-size="4pt"><fo:inline>Página <fo:page-number/></fo:inline></fo:block
            -->
            <fo:block space-before="0.4cm" text-align="left" font-weight="bold" font-size="5pt">NACIONAL FINANCIERA</fo:block>
            <fo:block margin-top="0.2cm" space-before="0.4cm" text-align="left" font-size="4pt">Dirección Fiduciaria</fo:block>
            <fo:block margin-top="0cm" text-align="right" font-size="4pt">NF-MPO-OF 10.5</fo:block>
            <fo:block margin-top="0.3cm">
              <fo:table>
                <fo:table-column column-width="12.5cm"/>
                <fo:table-column column-width="5cm"/>
                <fo:table-column column-width="1.6cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="3"><fo:block border="1pt solid black" background-color="silver" text-align="center">
                      <fo:inline font-size="7pt" font-style="italic" font-weight="bold">FICHA ÚNICA DE OPERACIÓN FIDUCIARIA</fo:inline>
                    </fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block>&#160;<fo:inline font-size="5pt">&#160;<xsl:value-of select="fecha"/></fo:inline></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block>&#160;<fo:inline font-size="5pt">&#160;<xsl:value-of select="hora"/></fo:inline></fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
          </fo:static-content>
          <fo:flow flow-name="xsl-region-body">
            <fo:block text-align="right" font-size="4pt" font-weight="bold">&#160;<xsl:value-of select="fecha"/><xsl:value-of select="hora"/></fo:block>
            <fo:block space-before="0.3cm" font-size="4pt" font-weight="bold">DATOS DEL FIDEICOMISO O MANDATO</fo:block>
            <fo:block space-before="0.3cm">
              <fo:table>
                <fo:table-column column-width="0.8cm"/>
                <fo:table-column column-width="1.7cm"/>
                <fo:table-column column-width="1.0cm"/>
                <fo:table-column column-width="15.3cm"/>         
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell><fo:block font-size="4pt" margin-left="0.2cm">NÚM.</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block font-size="6pt" margin-left="0.2cm" font-weight="bold">&#160;<xsl:value-of select="ctoNumContrato"/></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block  font-size="4pt">Nombre:</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block font-size="6pt" margin-left="0.2cm" font-weight="bold">&#160;<xsl:value-of select="ctoNomContrato"/></fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:block margin-top="0.2cm" font-size="4pt">
              <fo:table>
                <fo:table-column column-width="1cm"/>
                <fo:table-column column-width="0.9cm"/>
                <fo:table-column column-width="0.8cm"/>
                <fo:table-column column-width="1.4cm"/>
                <fo:table-column column-width="0.9cm"/>
                <fo:table-column column-width="0.4cm"/>
                <fo:table-column column-width="1.8cm"/>
                <fo:table-column column-width="0.9cm"/>
                <fo:table-column column-width="0.9cm"/>
                <fo:table-column column-width="1.4cm"/>
                <fo:table-column column-width="1.5cm"/>
                <fo:table-column column-width="0.3cm"/>
                <fo:table-column column-width="2.9cm"/>
                <fo:table-column column-width="0.5cm"/>
                <fo:table-column column-width="3.5cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="9">
                      <fo:block margin-top="0.2cm" font-size="4pt" font-weight="bold">OPERACIÓN SOLICITADA</fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block margin-top="0.2cm" font-size="4pt" font-weight="bold" text-align="center">ESTATUS DE INSTRUCCIÓN</fo:block>
                    </fo:table-cell>
                    <fo:table-cell><fo:block margin-top="0.4cm" font-size="4pt" font-weight="bold"></fo:block></fo:table-cell>
                    <fo:table-cell>
                      <fo:block margin-top="0.2cm" font-size="4pt" font-weight="bold" text-align="center">ESTATUS CONTABILIDAD</fo:block>
                    </fo:table-cell>
                    <fo:table-cell><fo:block margin-top="0.2cm" font-size="4pt" font-weight="bold"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block margin-top="0.2cm" font-size="4pt" font-weight="bold"></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block space-before="0.4cm" margin-top="0.4cm" font-size="4pt">RETIRO</fo:block>
                      
                      
                      <fo:block margin-top="0.4cm" font-size="4pt">
                        <fo:table>
                          <fo:table-column column-width="1cm"/>
                          <fo:table-column column-width="0.9cm"/>
                          <fo:table-column column-width="0.8cm"/>
                          <fo:table-column column-width="1.4cm"/>
                          <fo:table-column column-width="0.9cm"/>st
                          <fo:table-column column-width="0.4cm"/>
                          <fo:table-column column-width="1.8cm"/>
                          <fo:table-column column-width="0.9cm"/>
                          <fo:table-column column-width="0.9cm"/>
                          <fo:table-column column-width="1.4cm"/>
                          <fo:table-column column-width="1.5cm"/>
                          <fo:table-column column-width="0.3cm"/>
                          <fo:table-column column-width="2.9cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell number-columns-spanned="4">
                                <fo:block space-before="0.2cm" text-align="center" font-size="4pt">CONTRATO FEDERAL</fo:block>
                              </fo:table-cell>
                              <fo:table-cell><fo:block text-align="center" font-size="4pt"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="center" font-size="4pt"></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="4">
                                <fo:block space-before="0.2cm" text-align="center" font-size="4pt">CONTRATO ESTATAL</fo:block>
                              </fo:table-cell>
                              <fo:table-cell><fo:block text-align="center" font-size="4pt"></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="4">
                                <fo:block  space-before="0.2cm" text-align="center" font-size="4pt">CONTRATO RENDIMIENTOS</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell height="0.8cm" number-columns-spanned="4"><fo:block text-align="center" font-size="7pt" border="1pt solid black">
                                <fo:inline>&#160;<xsl:value-of select="ctoinverFed"></xsl:value-of></fo:inline>
                              </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell height="0.6cm" number-columns-spanned="4"><fo:block text-align="center" font-size="7pt" border="1pt solid black">
                                <fo:inline>&#160;<xsl:value-of select="ctoinverEst"></xsl:value-of></fo:inline>
                              </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell height="0.6cm" number-columns-spanned="4"><fo:block text-align="center" font-size="7pt" border="1pt solid black">
                                <fo:inline>&#160;<xsl:value-of select="ctoinverRend"></xsl:value-of></fo:inline>
                              </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell number-columns-spanned="4">
                                <fo:block space-before="0.2cm" text-align="center" font-size="4pt">IMPORTE</fo:block>
                              </fo:table-cell>
                              <fo:table-cell><fo:block text-align="center" font-size="4pt"></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="center" font-size="4pt"></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="4">
                                <fo:block space-before="0.2cm" text-align="center" font-size="4pt">IMPORTE</fo:block>
                              </fo:table-cell>
                              <fo:table-cell><fo:block text-align="center" font-size="4pt"></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="4">
                                <fo:block  space-before="0.2cm" text-align="center" font-size="4pt">IMPORTE</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell height="0.3cm" number-columns-spanned="4"><fo:block text-align="center" font-size="7pt" border="1pt solid black">&#160;
                                <fo:inline><xsl:value-of select="importeFed"></xsl:value-of></fo:inline>
                              </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell height="0.3cm" number-columns-spanned="4"><fo:block text-align="center" font-size="7pt" border="1pt solid black">&#160;
                                <fo:inline><xsl:value-of select="importeEst"></xsl:value-of></fo:inline>
                              </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell height="0.3cm" number-columns-spanned="4"><fo:block text-align="center" font-size="7pt" border="1pt solid black">&#160;
                                <fo:inline><xsl:value-of select="importeRend"></xsl:value-of></fo:inline>
                              </fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell height="0.3cm" number-columns-spanned="7">
                                <fo:block space-before="0.2cm" text-align="center" font-size="4pt">IMPORTE TOTAL</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell height="0.8cm" number-columns-spanned="7"><fo:block text-align="center" font-size="7pt" border="1pt solid black">&#160;
                                <fo:inline><xsl:value-of select="importeTot"></xsl:value-of></fo:inline>
                              </fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell height="0.5cm" number-columns-spanned="9">
                                <fo:block space-before="0.2cm" font-size="4pt">REGISTRO PRESUPUESTAL</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell height="0.8cm" number-columns-spanned="9"><fo:block text-align="center" font-size="7pt" border="1pt solid black">&#160;
                                <fo:inline><xsl:value-of select="regPresupuestal"></xsl:value-of></fo:inline>
                              </fo:block></fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell height="0.4cm"><fo:block text-align="center" font-size="8pt" border="1pt solid black" font-weight="bold">&#160;
                      <fo:inline><xsl:value-of select="retiro"/></fo:inline>
                    </fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left" font-size="4pt"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left" space-before="0.2cm" font-size="4pt">DEPOSITO</fo:block></fo:table-cell>
                    <fo:table-cell height="0.4cm"><fo:block text-align="center" font-size="8pt" border="1pt solid black" font-weight="bold">&#160;
                      <fo:inline><xsl:value-of select="deposito"/></fo:inline>
                    </fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left" font-size="4pt"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left" space-before="0.2cm" font-size="4pt">HONORARIOS</fo:block></fo:table-cell>
                    <fo:table-cell height="0.4cm"><fo:block text-align="center" font-size="8pt" border="1pt solid black" font-weight="bold">&#160;
                      <fo:inline><xsl:value-of select="traspaso"/></fo:inline>
                    </fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left" font-size="4pt"></fo:block></fo:table-cell>
                    <fo:table-cell height="0.4cm" number-columns-spanned="2">
                      <fo:block text-align="center" font-size="8pt" border="1pt solid black" font-weight="bold">&#160;
                        <fo:inline><xsl:value-of select="statusInstruc"/></fo:inline>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell><fo:block text-align="left" font-size="4pt"></fo:block></fo:table-cell>
                    <fo:table-cell height="0.4cm"><fo:block text-align="center" font-size="8pt" border="1pt solid black" font-weight="bold">&#160;
                      <fo:inline><xsl:value-of select="statusConta"/></fo:inline>
                    </fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left" font-size="4pt"></fo:block></fo:table-cell>
                    <fo:table-cell height="0.4cm">
                      <fo:block border="1pt solid black">
                        <fo:table>
                          <fo:table-column column-width="0.3cm"/>
                          <fo:table-column column-width="0.7cm"/>
                          <fo:table-column column-width="0.7cm"/>
                          <fo:table-column column-width="0.7cm"/>
                          <fo:table-column column-width="0.7cm"/>
                          <fo:table-column column-width="0.3cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="4">
                                <fo:block font-size="4pt" text-align="center" margin-top="0.3cm">Ejercicio Fiscal</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row><fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="4" height="0.4cm">
                                <fo:block text-align="center" border="1pt solid black" space-before="0.3cm" margin-top="0.3cm">&#160;
                                  <fo:inline font-size="6pt"><xsl:value-of select="aux2"/></fo:inline>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="3pt" text-align="center" space-before="0.3cm" margin-top="0.3cm"></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="4">
                                <fo:block font-size="4pt" text-align="center" margin-top="0.3cm">Acuerdo Comité Técnico ó Carta de Instrucciones</fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="4" height="1cm">
                                <fo:block text-align="center" border="1pt solid black" padding-left="0.2cm" padding-top="0.2cm" padding-right="0.2cm" padding-bottom="0.2cm">&#160;
                                  <fo:inline font-size="6pt"><xsl:value-of select="acuerdo"/></fo:inline>
                                </fo:block>                              
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="2">
                                <fo:block font-size="4pt" text-align="center" margin-top="0.1cm">Comprometido</fo:block>
                              </fo:table-cell>
                              <fo:table-cell number-columns-spanned="1" height="0.5cm">
                                <fo:block text-align="center" border="1pt solid black" margin-top="0.1cm">&#160;
                                  <fo:inline font-size="5pt"><xsl:value-of select="comprometido"/></fo:inline>
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell><fo:block></fo:block></fo:table-cell>
                              <fo:table-cell number-columns-spanned="2">
                                <fo:block font-size="4pt" text-align="center" margin-top="0.1cm">Disponible</fo:block>
                              </fo:table-cell>
                              <fo:table-cell number-columns-spanned="1" height="0.5cm">
                                <fo:block text-align="center" border="1pt solid black" margin-top="0.1cm">&#160;
                                  <fo:inline font-size="5pt"><xsl:value-of select="disponible"/></fo:inline>
                                </fo:block>
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
            <fo:block font-size="3pt" space-before="0.7cm">CONCEPTO / OBSERVACIONES / ANEXOS</fo:block>
            <fo:block border="1pt solid black" font-size="7pt">
              <fo:table>
                <fo:table-column column-width="19.1cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell height="1.8cm"><fo:block font-size="7pt" padding-before="0.2cm" padding-after="0.2cm" margin-left="0.2cm" margin-right="0.2cm">&#160;<xsl:value-of select="concepto"/></fo:block></fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:block font-size="4pt" space-before="0.3cm" font-weight="bold">DATOS ADICIONALES PARA LIQUIDACIÓN</fo:block>
            <fo:block space-before="0.3cm" font-size="4pt">
              <fo:table>
                <fo:table-column column-width="3.9cm"/>
                <fo:table-column column-width="1cm"/>
                <fo:table-column column-width="1.2cm"/>
                <fo:table-column column-width="3.9cm"/>
                <fo:table-column column-width="0.3cm"/>
                <fo:table-column column-width="2.9cm"/>
                <fo:table-column column-width="0.4cm"/>
                <fo:table-column column-width="5.3cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell><fo:block font-size="4pt" text-align="center">NUM. DE CUENTA</fo:block></fo:table-cell>
                    <fo:table-cell number-columns-spanned="3"><fo:block font-size="4pt" text-align="center">BANCO</fo:block></fo:table-cell>
                    <fo:table-cell number-columns-spanned="3"><fo:block font-size="4pt" text-align="center">SUCURSAL</fo:block></fo:table-cell>
                    <fo:table-cell>
                      <fo:block font-size="4pt" text-align="center">PLAZA</fo:block>
                      <fo:block font-size="4pt" text-align="center">(CIUDAD, ESTADO Y PAIS)</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell height="0.6cm"><fo:block padding-before="0.2cm" font-size="5pt" text-align="center" border="1pt solid black">&#160;<xsl:value-of select="cuenta"/></fo:block></fo:table-cell>
                    <fo:table-cell height="0.6cm" number-columns-spanned="3"><fo:block padding-before="0.2cm" font-size="5pt" text-align="center" border="1pt solid black">&#160;<xsl:value-of select="banco"/></fo:block></fo:table-cell>
                    <fo:table-cell height="0.6cm" number-columns-spanned="3"><fo:block padding-before="0.2cm" font-size="5pt" text-align="center" border="1pt solid black">&#160;<xsl:value-of select="sucursal"/></fo:block></fo:table-cell>
                    <fo:table-cell height="0.6cm"><fo:block padding-before="0.2cm" font-size="5pt" text-align="center" border="1pt solid black">&#160;<xsl:value-of select="plazaOpera"/></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2"><fo:block margin-top="0.1cm" font-size="4pt" text-align="center">NOMBRE DEL BENEFICIARIO</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block margin-top="0.1cm" font-size="4pt" text-align="center"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block margin-top="0.1cm" font-size="4pt" text-align="center"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block margin-top="0.1cm" font-size="4pt" text-align="center"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block margin-top="0.1cm" font-size="4pt" text-align="center"></fo:block></fo:table-cell>
                    <fo:table-cell number-columns-spanned="2"><fo:block margin-top="0.1cm" font-size="4pt" text-align="center">R.F.C.</fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell height="0.6cm" number-columns-spanned="6"><fo:block padding-before="0.2cm" font-size="5pt" border="1pt solid black">
                      <fo:inline padding-left="0.2cm">&#160;<xsl:value-of select="beneficiario"/></fo:inline>
                    </fo:block></fo:table-cell>
                    <fo:table-cell height="0.6cm" number-columns-spanned="2"><fo:block padding-before="0.2cm" font-size="5pt" text-align="center" border="1pt solid black">&#160;<xsl:value-of select="rfc"/></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="5"><fo:block margin-top="0.1cm" font-size="4pt" text-align="center">NOMBRE DE LA PERSONA QUE AUTORIZA POR EL FIDEICOMISO</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block margin-top="0.1cm" font-size="4pt" text-align="center"></fo:block></fo:table-cell>
                    <fo:table-cell number-columns-spanned="2"><fo:block margin-top="0.1cm" font-size="4pt" text-align="center">FOLIO INTERNET</fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell height="0.8cm" number-columns-spanned="6"><fo:block padding-before="0.2cm" font-size="5pt" border="1pt solid black">&#160;
                      <fo:inline padding-left="0.2cm"><xsl:value-of select="personaAutoriza"/></fo:inline></fo:block>
                    </fo:table-cell>
                    <fo:table-cell  height="0.8cm" number-columns-spanned="2"><fo:block padding-before="0.2cm" font-size="5pt" text-align="center" border="1pt solid black">&#160;<xsl:value-of select="folioOpera"/></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell  height="0.5cm" number-columns-spanned="8">
                      <fo:block margin-top="0.2cm" font-size="4pt" border="1pt solid black" font-weight="bold" text-align="center" background-color="silver" padding-top="0.2cm">
                        PARA USO EXCLUSIVO DE NACIONAL FINANCIERA S.N.C DIRECCION FIDUCIARIA
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="3"><fo:block margin-top="0.4cm" border="1pt solid black" padding-bottom="1.4cm">
                      <fo:inline padding-left="0.2cm" font-size="3pt">OBSERVACIONES DE CONTABILIDAD</fo:inline>
                    </fo:block></fo:table-cell>
                    <fo:table-cell number-columns-spanned="3"><fo:block margin-top="0.4cm" border="1pt solid black" padding-bottom="0.25cm">
                      <fo:block><fo:inline padding-left="0.2cm" font-size="3pt">OBSERVACIONES DE TESORERIA</fo:inline></fo:block>
                      <fo:block margin-top="0.4cm"><fo:inline padding-left="0.2cm" padding-bottom="1.4cm" font-size="5pt">&#160;<xsl:value-of select="detalleInstruc"/></fo:inline></fo:block>
                      <fo:block margin-top="0.4cm"><fo:inline padding-left="0.2cm" padding-bottom="1.4cm" font-size="5pt">&#160;<xsl:value-of select="formaHonorarios"/></fo:inline></fo:block>
                    </fo:block></fo:table-cell>
                    <fo:table-cell number-columns-spanned="2"><fo:block margin-top="0.4cm" border="1pt solid black" padding-bottom="1.4cm">
                      <fo:inline padding-left="0.2cm" padding-bottom="1.4cm" font-size="3pt">REGISTRO DE HONORARIOS</fo:inline>
                    </fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2"><fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.4cm" font-weight="bold">
                      <fo:inline padding-left="0.2cm" font-size="4pt">ADMINISTRACIÓN</fo:inline>
                    </fo:block></fo:table-cell>
                    <fo:table-cell number-columns-spanned="5"><fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.4cm" font-weight="bold">
                      <fo:inline padding-left="0.2cm" font-size="4pt">TESORERIA</fo:inline>
                    </fo:block></fo:table-cell>
                    <fo:table-cell number-columns-spanned="1"><fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.4cm" font-weight="bold">
                      <fo:inline padding-left="0.2cm" font-size="4pt">CONTROL Y GESTIÓN</fo:inline>
                    </fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="2.2cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">REVISO</fo:inline>
                      </fo:block>
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="2.6cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">AUTORIZO</fo:inline>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="3">
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.8cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">FOLIO DE CAJA</fo:inline>
                      </fo:block>
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="4cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">SELLO DE RECIBIDO</fo:inline>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2">
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.5cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">FECHA VALOR</fo:inline>
                      </fo:block>                      
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.8cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">REGISTRO</fo:inline>
                      </fo:block>
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.7cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">STAN</fo:inline>
                      </fo:block>                      
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.7cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">CONTAB. INSTIT.</fo:inline>
                      </fo:block>
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.8cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">INVERSIONES</fo:inline>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="1">
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="0.9cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">FOLIO(S) CONTABLE(S)</fo:inline>
                        <fo:block padding-top="0.2cm">
                          <fo:inline padding-left="0.2cm" padding-bottom="1.4cm" font-size="8pt" font-weight="bold">&#160;<xsl:value-of select="folioContable"/></fo:inline>
                        </fo:block>
                      </fo:block>
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="2cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">OPERACION CONTABLE</fo:inline>
                      </fo:block>
                      <fo:block border="1pt solid black" padding-top="0.2cm" padding-bottom="1cm">
                        <fo:inline padding-left="0.2cm" font-size="4pt">CONTROL</fo:inline>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block border="1pt solid black">
                        <fo:inline padding-left="0.2cm" font-size="8pt">r008nf-mpo-of</fo:inline>
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
