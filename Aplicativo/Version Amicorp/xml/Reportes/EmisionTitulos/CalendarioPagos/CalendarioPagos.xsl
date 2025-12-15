<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet xmlns="urn:schemas-microsoft-com:office:spreadsheet"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
                xmlns:fo="http://www.w3.org/XSL/Format/1.0"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:user="urn:my-scripts"
                xmlns:o="urn:schemas-microsoft-com:office:office"
                xmlns:x="urn:schemas-microsoft-com:office:excel"
                xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet">
  <xsl:template match="/ReportInfo">
  <Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
            xmlns:o="urn:schemas-microsoft-com:office:office"
            xmlns:x="urn:schemas-microsoft-com:office:excel"
            xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
            xmlns:html="http://www.w3.org/TR/REC-html40">
  <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
    <Version>12.00</Version>
  </DocumentProperties>
   <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
    <WindowHeight>8835</WindowHeight>
    <WindowWidth>15180</WindowWidth>
    <WindowTopX>120</WindowTopX>
    <WindowTopY>135</WindowTopY>
    <ProtectStructure>False</ProtectStructure>
    <ProtectWindows>False</ProtectWindows>
   </ExcelWorkbook>
   <Styles>
    <Style ss:ID="Default" ss:Name="Normal">
     <Alignment ss:Vertical="Bottom"/>
     <Borders/>
     <Font ss:FontName="Arial"/>
     <Interior/>
     <NumberFormat/>
     <Protection/>
    </Style>
    <Style ss:ID="s16" ss:Name="Millares">
     <NumberFormat ss:Format="_(* #,##0.00_);_(* \(#,##0.00\);_(* &quot;-&quot;??_);_(@_)"/>
    </Style>
    <Style ss:ID="s18" ss:Name="Moneda">
     <NumberFormat
      ss:Format="_(&quot;$&quot;* #,##0.00_);_(&quot;$&quot;* \(#,##0.00\);_(&quot;$&quot;* &quot;-&quot;??_);_(@_)"/>
    </Style>
    <Style ss:ID="s20" ss:Name="Porcentual">
     <NumberFormat ss:Format="0%"/>
    </Style>
    <Style ss:ID="m42176960">
     <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior ss:Color="#0000FF" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s62">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s63" ss:Parent="s16">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s64">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <NumberFormat ss:Format="Standard"/>
    </Style>
    <Style ss:ID="s65">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#000000"/>
    </Style>
    <Style ss:ID="s66">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="14"/>
    </Style>
    <Style ss:ID="s67">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="12" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s69">
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior ss:Color="#0000FF" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s70">
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s71" ss:Parent="s16">
     <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s72">
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior ss:Color="#0000FF" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s73">
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s74" ss:Parent="s16">
     <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s75" ss:Parent="s16">
     <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <NumberFormat ss:Format="_(* #,##0_);_(* \(#,##0\);_(* &quot;-&quot;??_);_(@_)"/>
    </Style>
    <Style ss:ID="s76">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
    </Style>
    <Style ss:ID="s77" ss:Parent="s16">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
    </Style>
    <Style ss:ID="s78">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
     <NumberFormat ss:Format="Standard"/>
    </Style>
    <Style ss:ID="s79">
     <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s80" ss:Parent="s16">
     <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s81" ss:Parent="s16">
     <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s82">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior/>
    </Style>
    <Style ss:ID="s83" ss:Parent="s16">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior/>
    </Style>
    <Style ss:ID="s84">
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior/>
     <NumberFormat ss:Format="Standard"/>
    </Style>
    <Style ss:ID="s85">
     <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior ss:Color="#0000FF" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s92" ss:Parent="s16">
     <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior ss:Color="#0000FF" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s93">
     <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
     <Borders>
      <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
     </Borders>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior ss:Color="#0000FF" ss:Pattern="Solid"/>
     <NumberFormat ss:Format="Standard"/>
    </Style>
    <Style ss:ID="s94">
     <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
     <Interior/>
    </Style>
    <Style ss:ID="s95">
     <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
     <NumberFormat ss:Format="Medium Date"/>
    </Style>
    <Style ss:ID="s96">
     <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
     <NumberFormat ss:Format="#,##0"/>
    </Style>
    <Style ss:ID="s98" ss:Parent="s20">
     <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
     <NumberFormat ss:Format="@"/>
    </Style>
    <Style ss:ID="s99">
     <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
     <NumberFormat ss:Format="@"/>
    </Style>
    <Style ss:ID="s100" ss:Parent="s16">
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
    </Style>
    <Style ss:ID="s101">
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
     <NumberFormat ss:Format="Standard"/>
    </Style>
    <Style ss:ID="s103" ss:Parent="s18">
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
    </Style>
    <Style ss:ID="s104" ss:Parent="s18">
     <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
     <NumberFormat ss:Format="Medium Date"/>
    </Style>
    <Style ss:ID="s105">
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
     <Interior/>
    </Style>
    <Style ss:ID="s106">
     <Borders/>
     <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
     <Interior/>
    </Style>
   </Styles>
    <Worksheet ss:Name="Tasa Fija">
      <Table ss:ExpandedColumnCount="15" ss:ExpandedRowCount="21" x:FullColumns="1"
       x:FullRows="1" ss:StyleID="s62" ss:DefaultColumnWidth="102.75"
       ss:DefaultRowHeight="11.25">
       <Column ss:StyleID="s62" ss:Width="24.75"/>
       <Column ss:Index="3" ss:StyleID="s62" ss:Width="11.25"/>
       <Column ss:Index="5" ss:StyleID="s62" ss:AutoFitWidth="0" ss:Width="102"/>
       <Column ss:StyleID="s62" ss:AutoFitWidth="0" ss:Width="65.25"/>
       <Column ss:StyleID="s62" ss:AutoFitWidth="0" ss:Width="66.75"/>
       <Column ss:StyleID="s62" ss:AutoFitWidth="0" ss:Width="71.25"/>
       <Column ss:StyleID="s62" ss:AutoFitWidth="0" ss:Width="63"/>
       <Column ss:StyleID="s63" ss:AutoFitWidth="0" ss:Width="59.25"/>
       <Column ss:StyleID="s64" ss:AutoFitWidth="0" ss:Width="89.25"/>
       <Column ss:Index="13" ss:StyleID="s65" ss:AutoFitWidth="0"/>
       <Row/>
       <Row ss:Height="18">
        <Cell ss:Index="2" ss:StyleID="s66"><Data ss:Type="String"><xsl:value-of select="QueryInfo/RowInfo/nomFideicomiso"/></Data></Cell>
       </Row>
       <Row ss:Height="18">
        <Cell ss:Index="2" ss:StyleID="s66"><Data ss:Type="String"><xsl:value-of select="QueryInfo/RowInfo/nomRepresentante"/></Data></Cell>
        <Cell ss:Index="12" ss:StyleID="s67"><Data ss:Type="String">Emisión:</Data></Cell>
        <Cell ss:StyleID="s67"><Data ss:Type="String"><xsl:value-of select="QueryInfo/RowInfo/nomEmision"/></Data></Cell>
       </Row>
       <Row>
        <Cell ss:Index="6" ss:StyleID="s63"></Cell>
       </Row>
       
       <xsl:for-each select="QueryInfo/RowInfo/TableInfo1/RowInfo">
         <Row>
          <Cell ss:Index="2" ss:StyleID="s69"><Data ss:Type="String"><xsl:value-of select="titleInfo"/></Data></Cell>
          <Cell ss:StyleID="s70"/>
          <Cell ss:StyleID="s71"><Data ss:Type="String"><xsl:value-of select="valueInfo"/></Data></Cell>
         </Row>
       </xsl:for-each>
       
       <Row/>
       
       <Row ss:StyleID="s76">
         <xsl:for-each select="QueryInfo/RowInfo/TableInfo2/headerInfo">
           <xsl:variable name="test"><xsl:value-of select="."/></xsl:variable>
           <xsl:choose>
             <xsl:when test="$test='PERIODO'"><Cell ss:Index="2" ss:MergeAcross="2" ss:StyleID="m42176960"><Data ss:Type="String">PERIODO</Data></Cell></xsl:when>
             <xsl:otherwise><Cell ss:StyleID="s85"><Data ss:Type="String"><xsl:value-of select="."/></Data></Cell></xsl:otherwise>
           </xsl:choose> 
         </xsl:for-each>
       </Row>
       
       <xsl:variable name="renglon" select="1"></xsl:variable>
       <xsl:for-each select="QueryInfo/RowInfo/TableInfo2/RowInfo">
         <Row ss:Height="12" ss:StyleID="s76">
           <Cell ss:StyleID="s94"><Data ss:Type="String"><xsl:value-of select="position()"/></Data></Cell>
           <xsl:variable name="renglon">2000</xsl:variable>
           <xsl:for-each select="valueInfo">
             <Cell ss:StyleID="s95"><Data ss:Type="String"><xsl:value-of select="."/></Data></Cell>
           </xsl:for-each>
           <!--xsl:variable name="renglon"><xsl:value-of select="number($renglon)+1"/></xsl:variable-->
         </Row>
       </xsl:for-each>
      
      </Table>
      <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
       <PageSetup>
        <Layout x:Orientation="Landscape"/>
        <Header x:Margin="0.51181102362204722"/>
        <Footer x:Margin="0.51181102362204722"/>
        <PageMargins x:Bottom="0" x:Left="0" x:Right="0" x:Top="0"/>
       </PageSetup>
       <Print>
        <ValidPrinterInfo/>
        <PaperSizeIndex>5</PaperSizeIndex>
        <Scale>87</Scale>
        <HorizontalResolution>600</HorizontalResolution>
        <VerticalResolution>600</VerticalResolution>
       </Print>
       <Zoom>84</Zoom>
       <Selected/>
      </WorksheetOptions>
     </Worksheet>
    </Workbook>
  </xsl:template>
</xsl:stylesheet>
