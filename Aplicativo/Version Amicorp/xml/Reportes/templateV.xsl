<?xml version='1.0' encoding='windows-1252'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:fo="http://www.w3.org/XSL/Format/1.0">
  <xsl:template match="/ReportInfo">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="hojaCartaVertical" page-width="216mm"
                               page-height="279mm" margin-top="10mm" margin-bottom="1cm" margin-left="2cm" margin-right="2cm">
          <fo:region-body region-name="xsl-region-body" margin-top="20mm"/>
          <fo:region-before extent="50mm" region-name="xsl-region-header"/>
          <fo:region-after extent="62mm" region-name="xsl-region-footer"/>
        </fo:simple-page-master>
        <fo:simple-page-master master-name="hojaCartaHorizontal" page-width="279mm"
                               page-height="216mm" margin-top="10mm" margin-bottom="5mm" margin-left="1cm" margin-right="1cm">
          <fo:region-body region-name="xsl-region-body" margin-top="23mm"/>
          <fo:region-before extent="50mm" region-name="xsl-region-header"/>
          <fo:region-after extent="10mm" region-name="xsl-region-footer"/>
        </fo:simple-page-master>        
      </fo:layout-master-set>

      <xsl:for-each select="QueryInfo/RowInfo">      
        <fo:page-sequence master-reference="hojaCartaHorizontal">
          <fo:static-content flow-name="xsl-region-header">
          
            <fo:block border="0.5mm solid black" border-bottom="0.5mm solid black"
                      border-left="0.5mm solid black" border-right="0.5mm solid black" padding="1mm">
          
              <fo:table>
                <fo:table-column column-width="50mm" />
                <fo:table-column column-width="169mm" />
                <fo:table-column column-width="50mm" />
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell text-align="center" number-rows-spanned="3">
                      <fo:block text-align="center">
                        <fo:external-graphic content-height="35px" content-width="47px">
                          <xsl:attribute name="src"><xsl:text>url('</xsl:text><xsl:value-of select="ReportInfo/QueryInfo/AditionalInfo/UrlLogo"/><xsl:text>')</xsl:text></xsl:attribute>
                        </fo:external-graphic>                    
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center">
                      <fo:block text-align="center" font-weight="bold" font-size="10px">NACIONAL FINANCIERA, S.N.C.</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center"><fo:block text-align="left"></fo:block></fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell text-align="center">
                      <fo:block padding-top="1mm" text-align="center" font-weight="bold" font-size="8px">Dirección Fiduciaria</fo:block>
                    </fo:table-cell>                  
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell text-align="center">
                      <fo:block padding-top="3mm" text-align="center" font-weight="bold" font-size="9px"><xsl:value-of select="ReportInfo/QueryInfo/AditionalInfo/TituloReporte"/></fo:block>
                    </fo:table-cell>                                    
                  </fo:table-row>                
                  <fo:table-row>
                    <fo:table-cell text-align="center" number-columns-spanned="2">
                      <fo:block text-align="left" font-weight="bold" font-size="9px"><xsl:value-of select="ReportInfo/QueryInfo/AditionalInfo/Fideicomiso"/></fo:block>
                    </fo:table-cell>                  
                    <fo:table-cell text-align="center" font-size="8px"><fo:block text-align="left">Fecha:&nbsp;<fo:inline font-weight="bold"><xsl:value-of select="ReportInfo/QueryInfo/AditionalInfo/FechaReporte"/></fo:inline></fo:block></fo:table-cell>
                  </fo:table-row>                                
                </fo:table-body>
              </fo:table>
            </fo:block>            
            <fo:block>
              <fo:leader leader-length="259mm" leader-pattern="rule"
                         rule-style="solid" line-height="0.5mm" rule-thickness="0.5mm"
                         color="#000000" alignment-baseline="central"/>            
            </fo:block>            
          </fo:static-content>      
          <fo:static-content flow-name="xsl-region-footer">
            <fo:block>
              <fo:leader leader-length="259mm" leader-pattern="rule"
                         rule-style="solid" line-height="0.5mm" rule-thickness="0.5mm"
                         color="#000000" alignment-baseline="central"/>            
              <fo:table>
                <fo:table-column column-width="220mm" />
                <fo:table-column column-width="59mm" />
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell text-align="center" number-rows-spanned="3">
                      <fo:block text-align="left" font-weight="bold" font-size="6px"><xsl:value-of select="ReportInfo/QueryInfo/AditionalInfo/NotaFooter"/></fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center" number-rows-spanned="3">
                      <fo:block padding-top="1mm" text-align="center" font-weight="bold" font-size="7px">Página &nbsp;<fo:page-number>&nbsp;</fo:page-number></fo:block>
                    </fo:table-cell>                  
                  </fo:table-row>
                </fo:table-body>
              </fo:table>                                     
            </fo:block>                
          </fo:static-content>            
          <fo:flow flow-name="xsl-region-body">
            <!-- Header Inicio -->

            <fo:block border="0.5mm solid black" border-bottom="0.5mm solid black"
                      border-left="0.5mm solid black" border-right="0.5mm solid black">
            
              <fo:table background-color="rgb(188,200,192)" >
                <fo:table-column column-width="220mm" />
                <fo:table-column column-width="59mm" />
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell text-align="center">
                      <fo:block font-size="6px">Titulo 1</fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="center">
                      <fo:block font-size="6px">Titulo 2</fo:block>
                    </fo:table-cell>                  
                  </fo:table-row>
                </fo:table-body>
              </fo:table>                   
            
            </fo:block>
            <!-- Header Fin -->
          </fo:flow>
        </fo:page-sequence>
      
      </xsl:for-each>
      
    </fo:root>
  </xsl:template>
</xsl:stylesheet>
