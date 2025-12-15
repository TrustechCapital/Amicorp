<?xml version='1.0' encoding='windows-1252'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:fo="http://www.w3.org/XSL/Format/1.0">
  <xsl:template match="/ReportInfo">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="hojaCarta" page-width="216mm"
                               page-height="279mm" margin-top="10mm" margin-bottom="1cm" margin-left="2cm" margin-right="2cm">
          <fo:region-body region-name="xsl-region-body" margin-top="20mm"/>
          <fo:region-before extent="50mm" region-name="xsl-region-header"/>
          <fo:region-after extent="62mm" region-name="xsl-region-footer"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <xsl:for-each select="QueryInfo/RowInfo">      
        <fo:page-sequence master-reference="hojaCarta">
          <fo:static-content flow-name="xsl-region-header">
            <fo:block space-before="5mm" text-align="center" font-weight="bold" font-size="10px">SUBDIRECCIÓN FIDUCIARIA DE</fo:block>
            <fo:block text-align="center" font-weight="bold" font-size="10px">NUEVOS NEGOCIOS Y TESORERIA</fo:block>
            <fo:block text-align="center" font-weight="bold" font-size="10px">GBC - <xsl:value-of select="ravSecuencial"/></fo:block>
            <fo:block margin-top="2mm" text-align="center" font-size="10px" ><xsl:value-of select="ravFechaHoy"/></fo:block>
          </fo:static-content>      
          <fo:flow flow-name="xsl-region-body">
            <fo:block text-align="right" font-weight="bold" font-size="10px" text-decoration="underline"><xsl:value-of select="../AditionalInfo/RavTipoAviso"/></fo:block>
            <fo:block margin-top="5mm">
              <fo:table>
                <fo:table-column column-width="11.5cm"/>
                <fo:table-column column-width="6cm"/>         
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell><fo:block text-align="left"></fo:block></fo:table-cell>
                    <fo:table-cell>
                      <fo:block font-size="5pt" font-weight="bold">
                        <fo:table>
                          <fo:table-column column-width="2.5cm"/>
                          <fo:table-column column-width="3.5cm"/>                               
                          <fo:table-body>
                            <fo:table-row>
                              <fo:table-cell><fo:block text-align="left">Fecha de clasificación:</fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left"><xsl:value-of select="ravFechaHoy"/></fo:block></fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                              <fo:table-cell><fo:block text-align="left">Unidad Administrativa:</fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left">Subdirección Fiduciaria de Nuevos Negocios y Tesoreria</fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block text-align="left">Reservada:</fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left">1 Hoja</fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block text-align="left">Periodo de Reserva:</fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left">12 años</fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block text-align="left">Fundamento Legal:</fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left">
                                Articulo 14 fraccion II Ley federal de Transparencia y Acceso a Información Publica Gubernamental en relacion con el articulo 117 de la Ley de Instituciones de Credito
                              </fo:block></fo:table-cell>
                            </fo:table-row>                        
                            <fo:table-row>
                              <fo:table-cell><fo:block text-align="left">Rubrica y Cargo:</fo:block></fo:table-cell>
                              <fo:table-cell><fo:block text-align="left"><xsl:value-of select="ravCargo"/></fo:block></fo:table-cell>
                            </fo:table-row>                        
                          </fo:table-body>
                        </fo:table>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:block>
            <fo:block margin-top="5mm" font-size="7pt" font-weight="bold"><xsl:value-of select="ravDirigidoA"/></fo:block>
            <fo:block font-size="7pt" font-weight="bold"><xsl:value-of select="ravCargo"/></fo:block>
            <fo:block margin-top="5mm" font-size="7pt"><xsl:value-of select="ravCalleNum"/></fo:block>
            <fo:block font-size="7pt">Col. <xsl:value-of select="ravColonia"/> C.P. <xsl:value-of select="ravCp"/></fo:block>
            <fo:block margin-top="5mm" font-size="7pt">Presente</fo:block>
            <fo:block margin-top="5mm" font-size="7pt">Estimado Cliente</fo:block>
            <fo:block margin-top="5mm" font-size="7pt">
              En relación a los honorarios por la administración del Fideicomiso <fo:inline font-weight="bold"><xsl:value-of select="ravNumContrato"/></fo:inline> <fo:inline font-weight="bold"><xsl:value-of select="ravNomContrato"/></fo:inline>, le informamos que el próximo <fo:inline font-weight="bold"><xsl:value-of select="ravFechaAviso"/></fo:inline> vencen los correspondientes al período <fo:inline font-weight="bold"><xsl:value-of select="ravPeriodo"/></fo:inline> por la cantidad de $
              <fo:inline font-weight="bold">$<xsl:value-of select="ravImportePer"/></fo:inline> IVA incluido.
            </fo:block>
            <fo:block margin-top="5mm" font-size="7pt">Por lo anterior, agradeceremos se sirvan cubrirnos la citada cantidad antes de la fecha de vencimiento mediante deposito en la cuenta cuyos datos a continuación se citan.</fo:block>
            <fo:block margin-top="5mm" font-size="7pt" text-align="center">
              <fo:table>
                <fo:table-column column-width="6cm"/>
                <fo:table-column column-width="3.5cm"/>
                <fo:table-column column-width="3.5cm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell><fo:block text-align="left"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left">Banco:</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left">Bancomer</fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell><fo:block text-align="left"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left">Convenio CIE:</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left">73538</fo:block></fo:table-cell>
                  </fo:table-row>                
                  <fo:table-row>
                    <fo:table-cell><fo:block text-align="left"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left">Referencia:</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left"><xsl:value-of select="ravReferenciaCie"/></fo:block></fo:table-cell>
                  </fo:table-row>                
                  <fo:table-row>
                    <fo:table-cell><fo:block text-align="left"></fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left">Adeudo Total:</fo:block></fo:table-cell>
                    <fo:table-cell><fo:block text-align="left">$<xsl:value-of select="ravImportePer"/></fo:block></fo:table-cell>
                  </fo:table-row>                
                </fo:table-body>              
              </fo:table>
            </fo:block>
            <fo:block margin-top="5mm" font-size="7pt">En caso de que a la fecha de recepción de la presente, ya hayan cubierto el citado importe, favor de hacer caso omiso de este aviso.</fo:block>
            <fo:block text-align="center" margin-top="5mm" font-size="7pt">Atentamente</fo:block>
            <fo:block text-align="center" margin-top="15mm" font-size="7pt" font-weight="bold">Lic. Rafael Gil Guerrero Herrera</fo:block>
            <fo:block text-align="center" font-size="7pt">Subdirector</fo:block>
          </fo:flow>
        </fo:page-sequence>
      
      </xsl:for-each>
      
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
