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
          
              <!-- INICIO CABECERA -->
              <fo:table>
                  <fo:table-column column-width="10cm"/>
                  <fo:table-column column-width="8cm"/>
                  <fo:table-body>
                    <fo:table-row>
                      <fo:table-cell>
                        <fo:block font-size="8pt">
                          <fo:external-graphic  src="http://localhost:8990/Fiduciario/imagenes/logo_bn.jpg"  content-height="scale-to-fit" height="0.90in" scaling="non-uniform"/>
                        </fo:block>
                      </fo:table-cell>
                      <fo:table-cell>
                      
                        <fo:block font-size="10pt" text-align="right">
                          <fo:inline font-weight="bold"><xsl:value-of select="flibNomEmpresa"/></fo:inline> 
                        </fo:block>
                        <fo:block font-size="10pt" text-align="right">
                          <fo:inline font-weight="bold"><xsl:value-of select="flibNomArea"/></fo:inline> 
                        </fo:block>
                        
                        <fo:block font-size="6pt" text-align="right" margin-top="5mm">
                          <fo:inline font-weight="bold"><xsl:value-of select="flibDireccion"/></fo:inline> 
                        </fo:block>
                        
                        <fo:block font-size="6pt" text-align="right" margin-top="5mm">
                          <fo:inline font-weight="bold"><xsl:value-of select="flibSitio"/></fo:inline> 
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>    
                  </fo:table-body>
                </fo:table>
                <!-- FIN CABECERA -->            
            
            </fo:block>
            <fo:block margin-top="5mm">
            
            
              <fo:table>
                <fo:table-column column-width="9cm"/>
                <fo:table-column column-width="9cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell>
                    <fo:block text-align="right">
                    
                        <!-- INICIO FECHA -->
                        <fo:table>
                          <fo:table-column column-width="18cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="8pt"> </fo:block></fo:table-cell>
                            </fo:table-row>         
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="8pt"> </fo:block></fo:table-cell>
                            </fo:table-row>      
                            <fo:table-row>
                              <fo:table-cell>
                                <fo:block font-size="8pt" text-align="right">
                                  México, D.F. a <fo:inline font-weight="bold"><xsl:value-of select="flibFecha"/></fo:inline> 
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>      
                          </fo:table-body>
                        </fo:table>
                        <!-- FIN FECHA -->
                        
                      </fo:block>
                      
                      <fo:block text-align="left">
                        
                        <!-- INICIO DESTINATARIO -->
                        <fo:table>
                          <fo:table-column column-width="15cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell>
                              
                                <fo:block font-size="8pt" text-align="left" margin-top="2mm">
                                  <fo:inline font-weight="bold"><xsl:value-of select="flibNomNotario"/></fo:inline>
                                </fo:block>
                                
                                <fo:block font-size="8pt" text-align="left" margin-top="2mm">
                                  <fo:inline font-weight="bold"><xsl:value-of select="flibNomPuesto"/></fo:inline>
                                </fo:block>
                                
                                <fo:block font-size="8pt" text-align="left" margin-top="2mm">
                                  <fo:inline>PRESENTE</fo:inline>
                                </fo:block>
                                
                              </fo:table-cell>
                            </fo:table-row>    
                          </fo:table-body>
                        </fo:table>
                        <!-- FIN DESTINATARIO -->
              
                        
                        <!-- INICIO REF-->
                        <fo:table>
                          <fo:table-column column-width="18cm"/>
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="8pt" font-weight="bold"> </fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell>
                                <fo:block font-size="8pt" text-align="right">
                                  Ref.- Contrato de Fideicomiso <fo:inline font-weight="bold"><xsl:value-of select="flibIdFideicomiso"/></fo:inline>
                                </fo:block>
                                
                                <fo:block font-size="8pt" text-align="left" margin-top="8mm">
                                  Estimado <fo:inline font-weight="bold"><xsl:value-of select="flibNomNotario"/></fo:inline>,
                                </fo:block>
                              </fo:table-cell>
                            </fo:table-row>      
                          </fo:table-body>
                        </fo:table>
                        <!--FIN REF-->
                        
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
                              <fo:table-cell><fo:block font-size="8pt" font-weight="bold"></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="8pt" font-weight="bold"></fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block font-size="8pt" font-weight="bold"></fo:block></fo:table-cell>
                            </fo:table-row>
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            
            <fo:block margin-top="10mm" font-size="8pt" text-align="justify">
            
              En cumplimiento a las instrucciones de <fo:inline font-weight="bold"><xsl:value-of select="flibDescFidBen"/></fo:inline> 
              , así como en cumplimiento a los fines del Fideicomiso, le solicito otorgar en el protocolo a su 
              digno cargo la escritura que contenga los siguientes actos jurídicos:
              
            </fo:block>
            <fo:block margin-top="10mm" font-size="8pt" text-align="justify">
            
              a.- La <fo:inline font-weight="bold"><xsl:value-of select="flibTransmisionReversion"/></fo:inline> de propiedad en ejecución 
              <fo:inline font-weight="bold"><xsl:value-of select="flibParcialTotal"/></fo:inline> del Fideicomiso, respecto de 
              <fo:inline font-weight="bold"><xsl:value-of select="flibDescripcionInmueble"/></fo:inline> 
              <fo:inline font-weight="bold"><xsl:value-of select="flibDescripcionRegimen1"/></fo:inline>
              marcado con el número oficial 
              <fo:inline font-weight="bold"><xsl:value-of select="flibIdDepto"/></fo:inline>
              de la calle <fo:inline font-weight="bold"><xsl:value-of select="flibNomCalle"/></fo:inline>
              , en la Colonia <fo:inline font-weight="bold"><xsl:value-of select="flibNomColonia"/></fo:inline>, 
              <fo:inline font-weight="bold"><xsl:value-of select="flibDelegacionMunicipio"/></fo:inline> de
              <fo:inline font-weight="bold"><xsl:value-of select="flibNomPoblacion"/></fo:inline>
              del <fo:inline font-weight="bold"><xsl:value-of select="flibNomEstado"/></fo:inline>
              <fo:inline font-weight="bold"><xsl:value-of select="flibDescripcionRegimen2"/></fo:inline>
              a <fo:inline font-weight="bold"><xsl:value-of select="flibNomAdquirente"/></fo:inline>.
            
            </fo:block>
            <fo:block margin-top="10mm" font-size="8pt" text-align="justify">
              b.- La extinción <fo:inline font-weight="bold"><xsl:value-of select="flibParcialTotal"/></fo:inline> 
              del fideicomiso, únicamente del 
              <fo:inline font-weight="bold"><xsl:value-of select="flibDescripcionInmueble"/></fo:inline>
              <fo:inline font-weight="bold"><xsl:value-of select="flibDescripcionRegimen3"/></fo:inline>.
            </fo:block>
            <fo:block margin-top="10mm" font-size="8pt" text-align="justify">
                El proyecto de escritura, junto con el certificado de libertad de gravámenes, deberán de enviarse por correo electrónico a
                 <fo:inline font-weight="bold"><xsl:value-of select="flibNomEnvio"/></fo:inline> 
                al correo electrónico <fo:inline font-weight="bold"><xsl:value-of select="flibEmailEnvio"/></fo:inline> para su revisión, 
                por lo menos con 5 días hábiles previos a la fecha de firma que se tenga programada.
            </fo:block>
            
            <!---->
            
            
            <fo:block margin-top="10mm" font-size="8pt" text-align="justify">
              La escritura deberá de contener las siguientes cláusulas:
            </fo:block>
            
            <fo:block margin-top="10mm" font-size="8pt" text-align="justify">
              “Clausula de Saneamiento para el caso de evicción:

              El <fo:inline font-weight="bold"><xsl:value-of select="flibDescSaneamiento"/></fo:inline> se obliga(n) en este acto a 
              responder del saneamiento para el caso de evicción, en los términos de Ley, respecto del inmueble que en este acto 
              se transmite, obligación que asume ante el adquirente, por lo que ambas partes liberan al Fiduciario de cualquier 
              responsabilidad por tal concepto.
            </fo:block>
            <fo:block margin-top="10mm" font-size="8pt" text-align="justify">
              “Clausula liberación de responsabilidad.

              El <fo:inline font-weight="bold"><xsl:value-of select="flibDescResponsabilidad"/></fo:inline> 
              se obliga(n) solidariamente e ilimitadamente a indemnizar y a sacar en paz 
              y a salvo a “<fo:inline font-weight="bold">AMICORP SOLUCIONES FIDUCIARIAS</fo:inline>”, 
              <fo:inline font-weight="bold">SOCIEDAD ANÓNIMA DE CAPITAL VARIABLE, SOCIEDAD FINANCIERA DE OBJETO MÚLTIPLE, 
              ENTIDAD NO REGULADA</fo:inline>, a sus Delegados Fiduciarios, Apoderados y Funcionarios, de todos los daños y perjuicios 
              que les cause o pudiera causar la ejecución del acto jurídico consignado en esta escritura o el cumplimiento de sus 
              fines y demás obligaciones previstas en éste, o que resulten de cualquier operación derivada del mismo, incluyendo sin 
              limitar, la reversión de propiedad y extinción parcial del fideicomiso a que se refiere la presente escritura, así como 
              por los daños y perjuicios que llegaran a causarse en caso de que se presente alguna reclamación procedimiento, juicio o 
              demanda en contra de “<fo:inline font-weight="bold">AMICORP SOLUCIONES FIDUCIARIAS</fo:inline>”, 
              <fo:inline font-weight="bold">SOCIEDAD ANÓNIMA DE CAPITAL VARIABLE, SOCIEDAD FINANCIERA DE OBJETO MÚLTIPLE, 
              ENTIDAD NO REGULADA</fo:inline>, sus Delegados Fiduciarios, Apoderados y Funcionarios; igualmente se obliga(n) a 
              rembolsar a “<fo:inline font-weight="bold">AMICORP SOLUCIONES FIDUCIARIAS</fo:inline>”, 
              <fo:inline font-weight="bold">SOCIEDAD ANÓNIMA DE CAPITAL VARIABLE, SOCIEDAD FINANCIERA DE OBJETO MÚLTIPLE, 
              ENTIDAD NO REGULADA</fo:inline>, a sus Delegados Fiduciarios, Apoderados y Funcionarios cualquier erogación que realicen 
              al respecto y en su propia defensa, o bien por el pago de sanciones o multas por alguna autoridad, otorgándole a 
              “<fo:inline font-weight="bold">AMICORP SOLUCIONES FIDUCIARIAS</fo:inline>”, 
              <fo:inline font-weight="bold">SOCIEDAD ANÓNIMA DE CAPITAL VARIABLE, SOCIEDAD FINANCIERA DE OBJETO MÚLTIPLE, 
              ENTIDAD NO REGULADA</fo:inline>, en este acto el finiquito más amplio que en derecho proceda, por su actuación, como 
              institución fiduciaria, liberándolo de cualquier responsabilidad presente o futura por su desempeño, toda vez 
              que el mismo lo ha efectuado de conformidad al contrato de fideicomiso y en atención a las instrucciones recibidas.”
              
              
            </fo:block>
            
            <!---->
            
            
            <fo:block margin-top="10mm" font-size="8pt" text-align="justify">
              Al otorgamiento de dicha escritura comparecerá(n) el 
              <fo:inline font-weight="bold"><xsl:value-of select="flibDescOtorgamiento"/></fo:inline>
              a ratificar sus instrucciones al Fiduciario y otorgar su conformidad con los actos jurídicos otorgados. 
              Por parte de esta Institución comparecerá el Delegado Fiduciario Licenciado 
              <fo:inline font-weight="bold"><xsl:value-of select="flibNomDelegado"/></fo:inline>.
            </fo:block>
            
            <fo:block margin-top="10mm" font-size="8pt" text-align="justify">
              Por último le solicitamos entregar al Fiduciario, el día de la firma una copia simple de la escritura con número y fecha 
              de escritura, así como una copia del certificado de libertad de gravámenes correspondiente.

              Sin más por el momento quedamos a sus atentas órdenes
            </fo:block>
            
            
            <fo:block text-align="center" margin-top="2cm" font-size="6pt"> </fo:block>
            
            <fo:block margin-top="15mm" font-size="8pt">
              <fo:table>
                <fo:table-column column-width="7cm"/>
                <fo:table-column column-width="4cm"/>
                <fo:table-column column-width="7cm"/>
                <fo:table-body>
                  <fo:table-row text-align="center">
                    <fo:table-cell><fo:block><fo:leader leader-length="70mm" leader-pattern="rule" rule-style="solid" rule-thickness="0.3mm" color="#000000" alignment-baseline="central"/></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row text-align="center">
                    <fo:table-cell><fo:block><fo:inline font-weight="bold"><xsl:value-of select="flibNomFirma"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row text-align="center">
                    <fo:table-cell><fo:block><fo:inline font-weight="bold"><xsl:value-of select="flibNomEmpresa"/></fo:inline> </fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row text-align="center">
                    <fo:table-cell><fo:block><fo:inline font-weight="bold"><xsl:value-of select="flibNomArea"/></fo:inline> </fo:block> </fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
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