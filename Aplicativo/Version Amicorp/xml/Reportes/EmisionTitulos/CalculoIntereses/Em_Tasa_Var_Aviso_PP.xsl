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
          
          <fo:flow flow-name="xsl-region-body">
            <fo:block margin-top="1cm" text-align="center" font-weight="bold" font-size="10px">
              <fo:inline font-weight="bold">AVISO A LOS TENEDORES DE CERTIFICADOS BURSÁTILES DE <xsl:value-of select="eaviNomEmisor"/></fo:inline>
            </fo:block>
            
            <fo:block text-align="center" margin-top="10mm" font-size="13pt">
              <fo:inline font-weight="bold">EMISIÓN: <xsl:value-of select="eaviCvePizarra"/> <xsl:value-of select="eaviNumSerie"/></fo:inline>
            </fo:block>
            
            <fo:block margin-top="25mm" font-size="13pt" text-align="justify">En cumplimiento a lo establecido en el Título de Emisión correspondiente, 
            hacemos de su conocimiento que la tasa de interés bruta que devengarán los Certificados Bursátiles de 
            <fo:inline font-weight="bold"><xsl:value-of select="eaviNomEmisor"/></fo:inline>, con clave de pizarra 
            (<fo:inline font-weight="bold"><xsl:value-of select="eaviCvePizarra"/> <xsl:value-of select="eaviNumSerie"/></fo:inline>), por el periodo 
            correspondiente del 
            <fo:inline font-weight="bold"><xsl:value-of select="eaviFecIniPeriodo"/> al <xsl:value-of select="eaviFecFinPeriodo"/></fo:inline>
            será del <fo:inline font-weight="bold"><xsl:value-of select="eaviTasaBruta"/></fo:inline> anual 
            sobre el valor nominal de los mismos, de acuerdo con las disposiciones fiscales vigentes. Adicionalmente informamos que el monto de los 
            intereses correspondientes a dicho periodo es de MXN <fo:inline font-weight="bold"><xsl:value-of select="eaviImpIntereses"/></fo:inline>
            </fo:block>
            
            <fo:block margin-top="25mm" font-size="13pt" text-align="justify">Asimismo, a partir del 
            <fo:inline font-weight="bold"><xsl:value-of select="eaviFecPagoSig"/></fo:inline>, en las oficinas de la S.D. INDEVAL S.A. DE C.V., Institución 
            para el depósito de Valores ubicada en Av. Paseo de la Reforma No. 255, piso tres, Colonia Cuauhtémoc, C.P. 06500, México D.F., se 
            pagarán los intereses por un monto de MXN 
            <fo:inline font-weight="bold"><xsl:value-of select="eaviImporteAnterior"/></fo:inline>
            correspondientes al periodo número 
            <fo:inline font-weight="bold"><xsl:value-of select="eaviNumSecCalc"/></fo:inline> comprendido del 
            <fo:inline font-weight="bold"><xsl:value-of select="eaviFecIniPeriodo"/> al <xsl:value-of select="eaviFecFinPeriodo"/></fo:inline>, 
            a razón de una tasa bruta anual del <fo:inline font-weight="bold"><xsl:value-of select="eaviTasaAnterior"/></fo:inline>.
            </fo:block>
            
            <fo:block text-align="center" margin-top="30mm" font-size="9pt">Atentamente</fo:block>
            <fo:block text-align="center" margin-top="1mm" font-size="12pt">REPRESENTANTE COMUN DE LOS TENEDORES</fo:block>
            <fo:block text-align="center" font-weight="bold" margin-top="1mm" font-size="12pt">nacional financiera</fo:block>
            <fo:block text-align="center" font-weight="bold" margin-top="1mm" font-size="10pt">Dirección Fiduciaria</fo:block>
            
          </fo:flow>
        </fo:page-sequence>
      
      </xsl:for-each>
      
    </fo:root>
  </xsl:template>
</xsl:stylesheet>