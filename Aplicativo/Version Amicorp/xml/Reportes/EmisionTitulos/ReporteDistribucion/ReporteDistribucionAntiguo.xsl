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
          xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
          xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
          xmlns:html="http://www.w3.org/TR/REC-html40">
  <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
    <Version>12.00</Version>
  </DocumentProperties>
  <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
    <WindowHeight>9120</WindowHeight>
    <WindowWidth>12120</WindowWidth>
    <WindowTopX>480</WindowTopX>
    <WindowTopY>315</WindowTopY>
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
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s18" ss:Name="Moneda">
      <NumberFormat ss:Format="_-&quot;$&quot;* #,##0.00_-;\-&quot;$&quot;* #,##0.00_-;_-&quot;$&quot;* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s22" ss:Name="Porcentual">
      <NumberFormat ss:Format="0%"/>
    </Style>
    <Style ss:ID="m53777808">
      <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s23">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s24">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s25" ss:Parent="s16">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s26">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s27">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s28" ss:Parent="s16">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s29">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s30">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s31">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s32" ss:Parent="s16">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s33">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s34" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#0000FF"
            ss:Bold="1"/>
      <NumberFormat ss:Format="0.0%"/>
    </Style>
    <Style ss:ID="s35">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s36" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="0.0%"/>
    </Style>
    <Style ss:ID="s37" ss:Parent="s16">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s38">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s39">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s40">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
    </Style>
    <Style ss:ID="s41">
      <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="#,##0&quot;            &quot;"/>
    </Style>
    <Style ss:ID="s42" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s43" ss:Parent="s16">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#00FFFF"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s44">
      <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior/>
      <NumberFormat ss:Format="#,##0&quot;            &quot;"/>
    </Style>
    <Style ss:ID="s45" ss:Parent="s22">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s46">
      <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior/>
      <NumberFormat ss:Format="#,##0&quot;            &quot;"/>
    </Style>
    <Style ss:ID="s47" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s48">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s49">
      <Alignment ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s50" ss:Parent="s16">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s51" ss:Parent="s16">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s52" ss:Parent="s16">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s53" ss:Parent="s22">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s54" ss:Parent="s16">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s55">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s56" ss:Parent="s22">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s57" ss:Parent="s22">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="0.0%"/>
    </Style>
    <Style ss:ID="s58" ss:Parent="s16">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s59">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s60">
      <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s61" ss:Parent="s16">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"
            ss:Bold="1"/>
      <Interior ss:Color="#000080" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s63">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s65" ss:Parent="s22">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s66">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s67">
      <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="#,##0&quot;            &quot;"/>
    </Style>
    <Style ss:ID="s68" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s69">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s70">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"
            ss:Underline="Single"/>
    </Style>
    <Style ss:ID="s71">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"
            ss:Underline="Single"/>
    </Style>
    <Style ss:ID="s72" ss:Parent="s18">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s73" ss:Parent="s18">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s74">
      <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s75" ss:Parent="s16">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#0000FF"
            ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s76">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"
            ss:Underline="Single"/>
    </Style>
    <Style ss:ID="s77" ss:Parent="s18">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s78" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s79" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s80" ss:Parent="s18">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"
            ss:Underline="SingleAccounting"/>
    </Style>
    <Style ss:ID="s81" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s82" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s83" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s84" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s85" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FF0000"
            ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s86" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
    </Style>
    <Style ss:ID="s87" ss:Parent="s18">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s88" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s89" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s90" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s91">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s92">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="_-&quot;$&quot;* #,##0.00_-;\-&quot;$&quot;* #,##0.00_-;_-&quot;$&quot;* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s93" ss:Parent="s18">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="&quot;UDI &quot;#,##0.00"/>
    </Style>
    <Style ss:ID="s94" ss:Parent="s18">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="&quot;UDI &quot;#,##0.00"/>
    </Style>
    <Style ss:ID="s95">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s96" ss:Parent="s18">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#0000FF"/>
    </Style>
    <Style ss:ID="s97">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#0000FF"/>
      <NumberFormat ss:Format="Short Date"/>
    </Style>
    <Style ss:ID="s98">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"
            ss:Underline="Single"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s99" ss:Parent="s22">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s100" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="&quot;UDI &quot;#,##0.00"/>
    </Style>
    <Style ss:ID="s101">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"
            ss:Underline="Single"/>
    </Style>
    <Style ss:ID="s102">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s103">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
    </Style>
    <Style ss:ID="s104">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
    </Style>
    <Style ss:ID="s105">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s106">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s107">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s108">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"
            ss:Bold="1"/>
      <Interior ss:Color="#000080" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s109">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"/>
      <Interior ss:Color="#000080" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s110" ss:Parent="s16">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"
            ss:Underline="SingleAccounting"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s111" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
    </Style>
    <Style ss:ID="s112" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#0000FF"
            ss:Bold="1"/>
    </Style>
    <Style ss:ID="s113" ss:Parent="s18">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior ss:Color="#FFFF00" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="&quot;UDI &quot;#,##0.00"/>
    </Style>
    <Style ss:ID="s114" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#0000FF"/>
      <Interior ss:Color="#FFFF00" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s115" ss:Parent="s16">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s116">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s117">
      <Borders>
        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s118">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
    </Style>
    <Style ss:ID="s119">
      <Borders>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
    </Style>
    <Style ss:ID="s120">
      <Borders>
        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s121">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s122">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="_-&quot;$&quot;* #,##0.00_-;\-&quot;$&quot;* #,##0.00_-;_-&quot;$&quot;* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s123">
      <Borders>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s124">
      <Borders>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
    </Style>
    <Style ss:ID="s125">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
    </Style>
    <Style ss:ID="s126" ss:Parent="s16">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s127">
      <Borders>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="_-&quot;$&quot;* #,##0.00_-;\-&quot;$&quot;* #,##0.00_-;_-&quot;$&quot;* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s128" ss:Parent="s16">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s129">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s130">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="0.000000"/>
    </Style>
    <Style ss:ID="s131">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
    </Style>
    <Style ss:ID="s132">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <Interior/>
      <NumberFormat ss:Format="0.000000"/>
    </Style>
    <Style ss:ID="s133">
      <Borders>
        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"
            ss:Underline="Single"/>
      <Interior/>
    </Style>
    <Style ss:ID="s134">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8"/>
      <NumberFormat ss:Format="Short Date"/>
    </Style>
    <Style ss:ID="s135">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#0000FF"/>
      <Interior ss:Color="#FFFF00" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="0.0000000"/>
    </Style>
    <Style ss:ID="s136" ss:Parent="s22">
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <NumberFormat ss:Format="0.000%"/>
    </Style>
    <Style ss:ID="s137" ss:Parent="s18">
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#0000FF"/>
      <Interior/>
    </Style>
    <Style ss:ID="s138" ss:Parent="s16">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Bold="1"/>
      <Interior/>
      <NumberFormat ss:Format="Short Date"/>
    </Style>
    <Style ss:ID="s144">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"
            ss:Bold="1"/>
      <Interior ss:Color="#000080" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s146">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Arial" x:Family="Swiss" ss:Size="8" ss:Color="#FFFFFF"
            ss:Bold="1"/>
      <Interior ss:Color="#000080" ss:Pattern="Solid"/>
    </Style>
  </Styles>
  <Worksheet ss:Name="Reporte de Distribuciones UDIS">
    <Table ss:ExpandedColumnCount="21" ss:ExpandedRowCount="73" x:FullColumns="1" x:FullRows="1" ss:StyleID="s26" ss:DefaultColumnWidth="60" ss:DefaultRowHeight="11.25">
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="33"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="123.75"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="64.5"/>
      <Column ss:StyleID="s32" ss:AutoFitWidth="0" ss:Width="101.25"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="100.5"/>
      <Column ss:StyleID="s26" ss:Width="99.75"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="24.75"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="14.25"/>
      <Column ss:StyleID="s26" ss:Width="186.75"/>
      <Column ss:StyleID="s26" ss:Width="67.5"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="97.5"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="99.75"/>
      <Column ss:StyleID="s26" ss:Width="67.5"/>
      <Column ss:StyleID="s26" ss:Width="46.5"/>
      <Column ss:StyleID="s26" ss:Width="54.75"/>
      <Column ss:StyleID="s26" ss:Width="68.25"/>
      <Column ss:StyleID="s26" ss:Width="64.5"/>
      <Column ss:StyleID="s26" ss:Width="62.25"/>
      <Column ss:StyleID="s26" ss:Width="51.75"/>
      <Column ss:StyleID="s26" ss:Width="68.25"/>
      <Column ss:StyleID="s26" ss:Width="76.5"/>
      <!-- Inicio Reporte -->
      <Row ss:Index="2">
        <Cell ss:Index="2" ss:MergeAcross="10" ss:StyleID="s116"><Data ss:Type="String">REPORTE DE DISTRIBUCIONES</Data></Cell>
      </Row>
      <Row>
        <Cell ss:Index="3"><Data ss:Type="String">Emisión:</Data></Cell>
        <Cell ss:StyleID="s51"><Data ss:Type="String">rdNomEmision</Data></Cell>
        <Cell ss:Index="11"><Data ss:Type="String">Fecha Cálculo:</Data></Cell>
        <Cell ss:StyleID="s134"><Data ss:Type="String">rdFechaCalculo</Data></Cell>
      </Row>
      
      <Row ss:Index="5" ss:AutoFitHeight="0" ss:Height="13.5">
        <Cell ss:Index="2" ss:MergeAcross="4" ss:StyleID="s146"><Data ss:Type="String">Flujo de Cobranza al Fideicomiso</Data></Cell>
        <Cell ss:Index="8" ss:MergeAcross="4" ss:StyleID="s146"><Data ss:Type="String">Reporte de Distribición</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s110"><Data ss:Type="String">Depositado</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:Index="8" ss:StyleID="s91"><Data ss:Type="Number">1</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">Saldo de efectivo</Data></Cell>
      </Row>
      <Row>
        <Cell ss:Index="3" ss:StyleID="s27"><Data ss:Type="String">Inicial</Data></Cell>
        <Cell ss:StyleID="s96"><Data ss:Type="Number">rdImpDepositoInicial</Data></Cell>
        <Cell ss:StyleID="s28"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:Index="8" ss:StyleID="s91"></Cell>
        <Cell ss:StyleID="s104"><Data ss:Type="String" x:Ticked="1">Saldo en Caja del Fideicomiso</Data></Cell>
        <Cell ss:StyleID="s28"></Cell>
        <Cell ss:StyleID="s28"></Cell>
        <Cell ss:StyleID="s77" ss:Formula="=+R[4]C[-8]"><Data ss:Type="Number"></Data></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2"><Data ss:Type="String"></Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">COBRANZA BIMESTRdE 1</Data></Cell>
        <Cell ss:StyleID="s137"><Data ss:Type="Number">rdImpDeposito1</Data></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="String"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:Index="8" ss:StyleID="s38"></Cell>
        <Cell ss:StyleID="s39"><Data ss:Type="String">Intereses devengados Inversiones TRB</Data></Cell>
        <Cell ss:StyleID="s114"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s39"></Cell>
        <Cell ss:StyleID="s78" ss:Formula="=+R[-1]C+RC[-2]"><Data ss:Type="Number"></Data></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2"><Data ss:Type="String"></Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">COBRANZA BIMESTRE 2</Data></Cell>
        <Cell ss:StyleID="s96"><Data ss:Type="Number">rdImpDeposito2</Data></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="String"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:Index="8" ss:StyleID="s91"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">Honorarios Fiduciario</Data></Cell>
        <Cell ss:StyleID="s115"><Data ss:Type="Number">rdImpHonoFid</Data></Cell>
        <Cell ss:StyleID="s115"></Cell>
        <Cell ss:StyleID="s28"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2"><Data ss:Type="String"></Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">COBRANZA BIMESTRE 3</Data></Cell>
        <Cell ss:StyleID="s112"><Data ss:Type="Number">rdImpDeposito3</Data></Cell>
        <Cell><Data ss:Type="String"></Data></Cell>
        <Cell ss:StyleID="s77"></Cell>
        <Cell ss:Index="8" ss:StyleID="s91"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">Honorarios Representante Común</Data></Cell>
        <Cell ss:StyleID="s115"><Data ss:Type="Number">rdImpHonoRepComun</Data></Cell>
        <Cell ss:StyleID="s115"></Cell>
        <Cell ss:StyleID="s28"></Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s30"><Data ss:Type="String"></Data></Cell>
        <Cell ss:StyleID="s30"></Cell>
        <Cell ss:StyleID="s83" ss:Formula="=SUM(R[-4]C:R[-1]C)+R[-1]C[2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s31"></Cell>
        <Cell ss:StyleID="s82"></Cell>
        <Cell ss:Index="8" ss:StyleID="s91"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">Bolsa Mexicana de Valores, S.A. C.V.</Data></Cell>
        <Cell ss:StyleID="s115"><Data ss:Type="Number">rdImpHonoBmv</Data></Cell>
        <Cell ss:StyleID="s115"></Cell>
        <Cell ss:StyleID="s28"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="6" ss:StyleID="s73"></Cell>
        <Cell ss:Index="8" ss:StyleID="s59"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">CNBV</Data></Cell>
        <Cell ss:StyleID="s55"><Data ss:Type="Number">rdImpHonoCnvb</Data></Cell>
        <Cell ss:StyleID="s55"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s33"><Data ss:Type="String">Saldo Final Cartera Reporte AMR648</Data></Cell>
        <Cell ss:StyleID="s33"></Cell>
        <Cell ss:StyleID="s29"></Cell>
        <Cell ss:StyleID="s29"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s84"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:Index="8" ss:StyleID="s59"></Cell>
        <Cell><Data ss:Type="String">ISR</Data></Cell>
        <Cell ss:StyleID="s55"><Data ss:Type="Number">rdImpHonoIsr</Data></Cell>
        <Cell ss:StyleID="s55"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:Index="4" ss:StyleID="s34"></Cell>
        <Cell ss:StyleID="s35"></Cell>
        <Cell ss:StyleID="s28"></Cell>
        <Cell ss:Index="8" ss:StyleID="s59"></Cell>
        <Cell><Data ss:Type="String">Auditores Externos</Data></Cell>
        <Cell ss:StyleID="s55"><Data ss:Type="Number">rdImpHonoAuditXt</Data></Cell>
        <Cell ss:StyleID="s55"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:Index="4" ss:StyleID="s36"></Cell>
        <Cell ss:StyleID="s35"></Cell>
        <Cell ss:StyleID="s37"></Cell>
        <Cell ss:Index="8" ss:StyleID="s59"></Cell>
        <Cell><Data ss:Type="String">Auditores Externos (Revisión Expendientes)</Data></Cell>
        <Cell ss:StyleID="s55"><Data ss:Type="Number">rdImpHonoAuditXtRe</Data></Cell>
        <Cell ss:StyleID="s55"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s38"><Data ss:Type="String">Estadística de la Morosidad de la Cartera</Data></Cell>
        <Cell ss:StyleID="s38"></Cell>
        <Cell ss:StyleID="s39"></Cell>
        <Cell ss:StyleID="s39"></Cell>
        <Cell ss:StyleID="s39"></Cell>
        <Cell ss:Index="8" ss:StyleID="s59"></Cell>
        <Cell><Data ss:Type="String">Honorarios Legales</Data></Cell>
        <Cell ss:StyleID="s55"><Data ss:Type="Number">rdImpHonoLegales</Data></Cell>
        <Cell ss:StyleID="s55"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">Cuentas</Data></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">% Cuentas</Data></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">Saldo</Data></Cell>
        <Cell ss:StyleID="s71"></Cell>
        <Cell ss:Index="8" ss:StyleID="s91"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">Publicaciones</Data></Cell>
        <Cell ss:StyleID="s115"><Data ss:Type="Number">rdImpHonoPublicaciones</Data></Cell>
        <Cell ss:StyleID="s115"></Cell>
        <Cell ss:StyleID="s28"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s40"><Data ss:Type="String">Extensión</Data></Cell>
        <Cell ss:StyleID="s41"><Data ss:Type="Number">rdCuentasExt</Data></Cell>
        <Cell ss:StyleID="s42"><Data ss:Type="Number">rdPjeCuentasExt</Data></Cell>
        <Cell ss:StyleID="s73"><Data ss:Type="Number">rdSalCuentasExt</Data></Cell>
        <Cell ss:StyleID="s85"></Cell>
        <Cell ss:Index="8" ss:StyleID="s91"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">ISR</Data></Cell>
        <Cell ss:StyleID="s126"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s115"></Cell>
        <Cell ss:StyleID="s28"></Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s40"><Data ss:Type="String">30-59</Data></Cell>
        <Cell ss:StyleID="s41"><Data ss:Type="Number">rdCuentas3059</Data></Cell>
        <Cell ss:StyleID="s42"><Data ss:Type="Number">rdPjeCuentas3059</Data></Cell>
        <Cell ss:StyleID="s73"><Data ss:Type="Number">rdSalCuentas3059</Data></Cell>
        <Cell ss:StyleID="s77"></Cell>
        <Cell ss:Index="8" ss:StyleID="s23"></Cell>
        <Cell ss:StyleID="s24"><Data ss:Type="String">Total Gastos Semestrales</Data></Cell>
        <Cell ss:StyleID="s25"></Cell>
        <Cell ss:StyleID="s79" ss:Formula="=SUM(R[-10]C[-1]:R[-1]C[-1])"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s79" ss:Formula="=+R[-11]C-RC[-1]"><Data ss:Type="Number"></Data></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s40"><Data ss:Type="String">60-89</Data></Cell>
        <Cell ss:StyleID="s41"><Data ss:Type="Number">rdCuentas6089</Data></Cell>
        <Cell ss:StyleID="s42"><Data ss:Type="Number">rdPjeCuentas6089</Data></Cell>
        <Cell ss:StyleID="s73"><Data ss:Type="Number">rdSalCuentas6089</Data></Cell>
        <Cell ss:StyleID="s77"></Cell>
        <Cell ss:StyleID="s43"></Cell>
        <Cell ss:StyleID="s59"></Cell>
        <Cell ss:StyleID="s70"><Data ss:Type="String">Pagos a los Tenedores:</Data></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s40"><Data ss:Type="String">90-119</Data></Cell>
        <Cell ss:StyleID="s41"><Data ss:Type="Number">rdCuentas90119</Data></Cell>
        <Cell ss:StyleID="s42"><Data ss:Type="Number">rdPjeCuentas90119</Data></Cell>
        <Cell ss:StyleID="s73"><Data ss:Type="Number">rdSalCuentas90119</Data></Cell>
        <Cell ss:StyleID="s86"></Cell>
        <Cell ss:StyleID="s32"></Cell>
        <Cell ss:StyleID="s91"><Data ss:Type="Number">2</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">Intereses a los Tenedores</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s77" ss:Formula="=+R[19]C[-7]*R[14]C[-8]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s77"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s40"><Data ss:Type="String">120-149</Data></Cell>
        <Cell ss:StyleID="s41"><Data ss:Type="Number">rdCuentas120149</Data></Cell>
        <Cell ss:StyleID="s42"><Data ss:Type="Number">rdPjeCuentas120149</Data></Cell>
        <Cell ss:StyleID="s73"><Data ss:Type="Number">rdSalCuentas120149</Data></Cell>
        <Cell ss:StyleID="s86"></Cell>
        <Cell ss:Index="8" ss:StyleID="s91"><Data ss:Type="Number">3</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">Amortización Anticipada de Principal</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s80" ss:Formula="=MAX(0,MIN(R[-3]C[1]-R[-1]C))"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s77"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s40">
          <Data ss:Type="String">150-179</Data>
        </Cell>
        <Cell ss:StyleID="s41">
          <Data ss:Type="Number">rdCuentas150179</Data>
        </Cell>
        <Cell ss:StyleID="s42">
          <Data ss:Type="Number">rdPjeCuentas150179</Data>
        </Cell>
        <Cell ss:StyleID="s73">
          <Data ss:Type="Number">rdSalCuentas150179</Data>
        </Cell>
        <Cell ss:StyleID="s86">
        </Cell>
        <Cell ss:Index="8" ss:StyleID="s59">
        </Cell>
        <Cell ss:StyleID="s59">
          <Data ss:Type="String">Total a distribuir a los tenedores</Data>
        </Cell>
        <Cell ss:Index="11" ss:StyleID="s72" ss:Formula="=+R[-1]C+R[-2]C">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s73">
        </Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s66">
          <Data ss:Type="String">180 and over</Data>
        </Cell>
        <Cell ss:StyleID="s67">
          <Data ss:Type="Number">rdCuentas180</Data>
        </Cell>
        <Cell ss:StyleID="s68">
          <Data ss:Type="Number">rdPjeCuentas180</Data>
        </Cell>
        <Cell ss:StyleID="s87">
          <Data ss:Type="Number">rdSalCuentas180</Data>
        </Cell>
        <Cell ss:StyleID="s88" ss:Formula="=+RC[-1]">
          <Data ss:Type="Number">0</Data>
        </Cell>
        <Cell ss:Index="8" ss:StyleID="s23">
          <Data ss:Type="Number">4</Data>
        </Cell>
        <Cell ss:StyleID="s24">
          <Data ss:Type="String">Monto Remanente</Data>
        </Cell>
        <Cell ss:StyleID="s24">
        </Cell>
        <Cell ss:StyleID="s79">
        </Cell>
        <Cell ss:StyleID="s81" ss:Formula="=+R[-5]C-R[-3]C[-1]-R[-2]C[-1]">
          <Data ss:Type="Number">0</Data>
        </Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s103">
          <Data ss:Type="String" x:Ticked="1">TOTAL</Data>
        </Cell>
        <Cell ss:StyleID="s44" ss:Formula="=SUM(R[-7]C:R[-1]C)">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s45" ss:Formula="=+RC[-1]/R13C5">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s111" ss:Formula="=SUM(R[-7]C:R[-1]C)">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s81" ss:Formula="=SUM(R[-7]C:R[-1]C)">
          <Data ss:Type="Number">0</Data>
        </Cell>
        <Cell ss:Index="8" ss:StyleID="s59">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="4" ss:StyleID="s46">
        </Cell>
        <Cell ss:StyleID="s47">
        </Cell>
        <Cell ss:StyleID="s48">
        </Cell>
        <Cell ss:Index="8" ss:StyleID="s33">
        </Cell>
        <Cell ss:StyleID="s76">
          <Data ss:Type="String">Otros Conceptos:</Data>
        </Cell>
        <Cell ss:StyleID="s33">
        </Cell>
        <Cell ss:StyleID="s33">
        </Cell>
        <Cell ss:StyleID="s33">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s49">
          <Data ss:Type="String">Saldos Cartera a deducir de Cómputo</Data>
        </Cell>
        <Cell ss:StyleID="s40">
        </Cell>
        <Cell ss:StyleID="s46">
        </Cell>
        <Cell ss:StyleID="s47">
        </Cell>
        <Cell ss:StyleID="s90" ss:Formula="=+R[-2]C">
          <Data ss:Type="Number">0</Data>
        </Cell>
        <Cell ss:Index="8" ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s77">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s40">
        </Cell>
        <Cell ss:StyleID="s46">
        </Cell>
        <Cell ss:StyleID="s47">
        </Cell>
        <Cell ss:StyleID="s48">
        </Cell>
        <Cell ss:Index="8" ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s71">
          <Data ss:Type="String">UDIS</Data>
        </Cell>
        <Cell ss:StyleID="s98">
          <Data ss:Type="String">Pesos</Data>
        </Cell>
      </Row>
      <Row ss:AutoFitHeight="0" ss:Height="24.75">
        <Cell ss:Index="2" ss:MergeAcross="3" ss:StyleID="m53777808">
          <ss:Data ss:Type="String" x:Ticked="1"
                   xmlns="http://www.w3.org/TR/REC-html40">
            <B>Saldo Vigente fines Fideicomiso</B>
            <Font>
            </Font>
          </ss:Data>
        </Cell>
        <Cell ss:StyleID="s89" ss:Formula="=+R[-16]C-R[-2]C">
          <Data ss:Type="Number">1434780186.8699999</Data>
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s91">
          <Data ss:Type="String">Amortización Anticipada de Principal</Data>
        </Cell>
        <Cell ss:Index="11" ss:StyleID="s93" ss:Formula="=+RC[1]/R[6]C[-8]">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s92" ss:Formula="=+R[-7]C[-1]">
          <Data ss:Type="Number"></Data>
        </Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s30">
        </Cell>
        <Cell ss:StyleID="s30">
        </Cell>
        <Cell ss:StyleID="s50">
        </Cell>
        <Cell ss:StyleID="s30">
        </Cell>
        <Cell ss:StyleID="s30">
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s59">
          <Data ss:Type="String">Saldo Certificados después del pago de cupón</Data>
        </Cell>
        <Cell ss:StyleID="s59">
        </Cell>
        <Cell ss:StyleID="s93" ss:Formula="=+R[8]C[-7]-(R[-1]C[1]/R[5]C[-8])">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s72" ss:Formula="=+RC[-1]*R[5]C[-9]">
          <Data ss:Type="Number"></Data>
        </Cell>
      </Row>
      <Row ss:AutoFitHeight="0">
        <Cell ss:Index="2" ss:MergeAcross="4" ss:StyleID="s144">
          <Data ss:Type="String" x:Ticked="1">Cálculo del Pago A CEDEVIS 05U</Data>
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s59">
          <Data ss:Type="String">Saldo Cartera Vigente y Activos</Data>
        </Cell>
        <Cell ss:StyleID="s59">
        </Cell>
        <Cell ss:StyleID="s93" ss:Formula="=+RC[1]/R[4]C[-8]">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s72" ss:Formula="=+R[35]C[-7]">
          <Data ss:Type="Number"></Data>
        </Cell>
      </Row>
      <Row ss:Height="34.5">
        <Cell ss:Index="2" ss:StyleID="s69">
          <Data ss:Type="String">Periodo</Data>
        </Cell>
        <Cell ss:StyleID="s74">
          <Data ss:Type="String">Fechas Periodo de Cupón</Data>
        </Cell>
        <Cell ss:StyleID="s74">
          <Data ss:Type="String">Dias</Data>
        </Cell>
        <Cell ss:StyleID="s74">
        </Cell>
        <Cell ss:StyleID="s74">
        </Cell>
        <Cell ss:Index="8" ss:StyleID="s27">
        </Cell>
        <Cell>
          <Data ss:Type="String">Porcentaje de Certificados a Activos Vigentes</Data>
        </Cell>
        <Cell ss:Index="12" ss:StyleID="s53" ss:Formula="=+R[-2]C/R[-1]C">
          <Data ss:Type="Number"></Data>
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s102">
          <ss:Data ss:Type="String" x:Ticked="1"
                   xmlns="http://www.w3.org/TR/REC-html40">
            <B>Fecha Inicio</B>
            <Font> de Periodo Ints</Font>
          </ss:Data>
        </Cell>
        <Cell ss:StyleID="s97">
          <Data ss:Type="String">rdFechaInicio</Data>
        </Cell>
        <Cell ss:Index="5" ss:StyleID="s32">
        </Cell>
        <Cell ss:StyleID="s32">
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s27">
          <Data ss:Type="String">Monto de Distribución a la Constancia</Data>
        </Cell>
        <Cell ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s77" ss:Formula="=+R[29]C[-7]">
          <Data ss:Type="Number"></Data>
        </Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s102">
          <ss:Data ss:Type="String" x:Ticked="1"
                   xmlns="http://www.w3.org/TR/REC-html40">
            <B>Fecha de Pago</B>
            <Font> del periodo</Font>
          </ss:Data>
        </Cell>
        <Cell ss:StyleID="s97">
          <Data ss:Type="String">rdFechaPago</Data>
        </Cell>
        <Cell ss:StyleID="s51" ss:Formula="=+RC[-1]-R[-1]C[-1]">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s51">
        </Cell>
        <Cell ss:StyleID="s51">
        </Cell>
        <Cell ss:Index="8" ss:StyleID="s30">
        </Cell>
        <Cell ss:StyleID="s30">
          <Data ss:Type="String">Monto de Retención en el Fideicomiso</Data>
        </Cell>
        <Cell ss:StyleID="s30">
        </Cell>
        <Cell ss:StyleID="s30">
        </Cell>
        <Cell ss:StyleID="s82" ss:Formula="=+R[30]C[-7]">
          <Data ss:Type="Number"></Data>
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s95">
          <Data ss:Type="String" x:Ticked="1">T.C UDI A la Fecha de Pago</Data>
        </Cell>
        <Cell ss:StyleID="s135">
          <Data ss:Type="Number">rdTasaUdi</Data>
        </Cell>
        <Cell ss:Index="5" ss:StyleID="s32">
        </Cell>
        <Cell ss:StyleID="s32">
        </Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s105">
          <Data ss:Type="String">Cálculo del Cupón</Data>
        </Cell>
        <Cell ss:StyleID="s23">
        </Cell>
        <Cell ss:StyleID="s52">
        </Cell>
        <Cell ss:StyleID="s52">
        </Cell>
        <Cell ss:StyleID="s52">
        </Cell>
        <Cell ss:Index="11" ss:StyleID="s99">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s106">
        </Cell>
        <Cell ss:StyleID="s91">
        </Cell>
        <Cell ss:StyleID="s71">
          <Data ss:Type="String">UDIS</Data>
        </Cell>
        <Cell ss:StyleID="s101">
          <Data ss:Type="String">Pesos</Data>
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s59">
          <Data ss:Type="String">CEDEVIS</Data>
        </Cell>
        <Cell ss:Index="11" ss:StyleID="s99">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s95">
          <Data ss:Type="String" x:Ticked="1">(Si) Saldo Insoluto Inicio Periodo CEDEVIS</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s113">
          <Data ss:Type="Number">rdSaldoInsolutoInicio</Data>
        </Cell>
        <Cell ss:StyleID="s72" ss:Formula="=+RC[-1]*R35C3">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:Index="9">
          <Data ss:Type="String">Inicio:</Data>
        </Cell>
        <Cell ss:StyleID="s116">
          <Data ss:Type="String">Udis</Data>
        </Cell>
        <Cell ss:StyleID="s116">
          <Data ss:Type="String">Pesos</Data>
        </Cell>
        <Cell ss:StyleID="s116">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2">
          <Data ss:Type="String">(TB) Tasa</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s136">
          <Data ss:Type="Number">rdTasa</Data>
        </Cell>
        <Cell ss:StyleID="s107">
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s117">
          <Data ss:Type="String">Valor Nominal Adjustado Emisión:</Data>
        </Cell>
        <Cell ss:StyleID="s118">
        </Cell>
        <Cell ss:StyleID="s118">
        </Cell>
        <Cell ss:StyleID="s119">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2">
          <Data ss:Type="String">(IDi) Intereses</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s93"
              ss:Formula="=+R[-2]C*R[-1]C/360*R[-6]C">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s72" ss:Formula="=+RC[-1]*R35C3">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s120">
          <Data ss:Type="String">VNA Inicio del período</Data>
        </Cell>
        <Cell ss:StyleID="s121" ss:Formula="=+R[-2]C[-6]">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s122" ss:Formula="=+R[-2]C[-6]">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s123">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2">
          <Data ss:Type="String">(Nfi) Periodo que se está pagando</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s75">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s59">
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s120">
          <Data ss:Type="String">Amortización Anticipada</Data>
        </Cell>
        <Cell ss:StyleID="s121" ss:Formula="=+R[2]C[-6]">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s122" ss:Formula="=+R[2]C[-6]">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s124">
        </Cell>
      </Row>
      <Row ss:Hidden="1">
        <Cell ss:Index="2">
          <Data ss:Type="String">Total de Pagos semestrales del CEDEVI</Data>
        </Cell>
        <Cell ss:Index="4">
          <Data ss:Type="Number">14</Data>
        </Cell>
        <Cell ss:StyleID="s59">
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s120">
          <Data ss:Type="String">VNA Nuevo</Data>
        </Cell>
        <Cell ss:StyleID="s121" ss:Formula="=+R[-2]C-R[-1]C">
          <Data ss:Type="Number">309357628.56503272</Data>
        </Cell>
        <Cell ss:StyleID="s125">
        </Cell>
        <Cell ss:StyleID="s124">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2">
          <Data ss:Type="String">Monto de Amortización Anticipada</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s93" ss:Formula="=+R[-14]C[7]">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s72" ss:Formula="=+RC[-1]*R35C3">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s120">
        </Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s95">
          <Data ss:Type="String" x:Ticked="1">Pago Total a CEDEVIS</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s100" ss:Formula="=+R[-1]C+R[-4]C">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s81" ss:Formula="=+RC[-1]*R35C3">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s133">
          <Data ss:Type="String">A partir del:</Data>
        </Cell>
        <Cell ss:StyleID="s138" ss:Formula="=+R[-10]C[-7]">
          <Data ss:Type="String"></Data>
        </Cell>
        <Cell ss:StyleID="s122">
        </Cell>
        <Cell ss:StyleID="s127">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s95">
          <Data ss:Type="String" x:Ticked="1">(SIPB) Saldo insoluto de principal CEDEVIS</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s93" ss:Formula="=+R[-7]C-R[-2]C">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s72" ss:Formula="=+RC[-1]*R35C3">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s120">
          <Data ss:Type="String">VNA Nuevo</Data>
        </Cell>
        <Cell ss:StyleID="s126" ss:Formula="=+R[-5]C-R[-4]C">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s122" ss:Formula="=+RC[-6]">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s127">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s102">
          <Data ss:Type="String" x:Ticked="1">% Del valor nominal CEDEVIS</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s65" ss:Formula="=+R[-1]C/R[-8]C">
          <Data ss:Type="Number"></Data>
        </Cell>
        <Cell ss:StyleID="s65" ss:Formula="=+R[-1]C/R[-8]C">
          <Data ss:Type="Number">0.94683769384683214</Data>
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s120">
          <Data ss:Type="String">Total Títulos</Data>
        </Cell>
        <Cell ss:StyleID="s128">
          <Data ss:Type="Number">rdTotTitulos</Data>
        </Cell>
        <Cell ss:StyleID="s125">
        </Cell>
        <Cell ss:StyleID="s124">
        </Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s108">
          <Data ss:Type="String" x:Ticked="1">Cálculo Distribución a Constancia</Data>
        </Cell>
        <Cell ss:StyleID="s109">
        </Cell>
        <Cell ss:StyleID="s109">
        </Cell>
        <Cell ss:StyleID="s109">
        </Cell>
        <Cell ss:Index="9" ss:StyleID="s129">
          <Data ss:Type="String">VNA x Título</Data>
        </Cell>
        <Cell ss:StyleID="s130" ss:Formula="=+R[-2]C/R[-1]C">
          <Data ss:Type="Number">rdVnaTitulo</Data>
        </Cell>
        <Cell ss:StyleID="s131">
        </Cell>
        <Cell ss:StyleID="s132">
        </Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s91">
        </Cell>
        <Cell ss:StyleID="s27">
        </Cell>
        <Cell ss:StyleID="s71">
          <Data ss:Type="String">UDIS</Data>
        </Cell>
        <Cell ss:StyleID="s101">
          <Data ss:Type="String">Pesos</Data>
        </Cell>
      </Row>
      <Row ss:Hidden="1">
        <Cell ss:Index="2">
          <Data ss:Type="String">SIPCB (Saldo Insoluto Cedevi)</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s94" ss:Formula="=+RC[1]/R[-14]C[-1]">
          <Data ss:Type="Number">309357628.56503266</Data>
        </Cell>
        <Cell ss:StyleID="s73" ss:Formula="=+R[-19]C[7]">
          <Data ss:Type="Number">1130838249.7617631</Data>
        </Cell>
      </Row>
      <Row ss:Hidden="1">
        <Cell ss:Index="2">
          <Data ss:Type="String">CHV (Cartera Hip. Vigente)</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s94" ss:Formula="=+RC[1]/R35C3">
          <Data ss:Type="Number">392505467.70566607</Data>
        </Cell>
        <Cell ss:StyleID="s73" ss:Formula="=+R[-21]C[1]">
          <Data ss:Type="Number">1434780186.8699999</Data>
        </Cell>
        <Cell ss:Index="10">
          <Data ss:Type="String">Fecha</Data>
        </Cell>
        <Cell>
          <Data ss:Type="String">Saldo Insoluto Principal</Data>
        </Cell>
      </Row>
      <Row ss:Hidden="1">
        <Cell ss:Index="2">
          <Data ss:Type="String">MR (Monto Remanente)</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s94" ss:Formula="=+RC[1]/R35C3">
          <Data ss:Type="Number">0</Data>
        </Cell>
        <Cell ss:StyleID="s55" ss:Formula="=+R[-27]C[7]">
          <Data ss:Type="Number">0</Data>
        </Cell>
        <Cell ss:Index="11">
          <Data ss:Type="String">de los Certificados</Data>
        </Cell>
        <Cell>
          <Data ss:Type="String">%</Data>
        </Cell>
      </Row>
      <Row ss:Hidden="1">
        <Cell ss:Index="2">
          <Data ss:Type="String">Subordinación</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s56" ss:Formula="=1-+R[-3]C/R[-2]C">
          <Data ss:Type="Number">0.21183867737349515</Data>
        </Cell>
        <Cell ss:StyleID="s56" ss:Formula="=1-(R[-22]C[7]/(+R[-2]C))">
          <Data ss:Type="Number">0.21183867737349504</Data>
        </Cell>
        <Cell ss:Index="10">
          <Data ss:Type="Number">38303</Data>
        </Cell>
        <Cell>
          <Data ss:Type="Number">345761100</Data>
        </Cell>
        <Cell>
          <Data ss:Type="Number">1</Data>
        </Cell>
      </Row>
      <Row ss:Height="22.5" ss:Hidden="1">
        <Cell ss:Index="2" ss:StyleID="s60">
          <Data ss:Type="String">Nivel del Gatillo de Evento de Retención</Data>
        </Cell>
        <Cell ss:StyleID="s60">
        </Cell>
        <Cell ss:StyleID="s26">
        </Cell>
        <Cell ss:StyleID="s57">
          <Data ss:Type="Number">0.23</Data>
        </Cell>
        <Cell ss:Index="10">
          <Data ss:Type="Number">38492</Data>
        </Cell>
        <Cell>
          <Data ss:Type="Number">328939124.63451242</Data>
        </Cell>
        <Cell>
          <Data ss:Type="Number">0.95134798169751433</Data>
        </Cell>
      </Row>
      <Row ss:Hidden="1">
        <Cell ss:Index="2">
          <Data ss:Type="String">Evento de Retención</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s26">
        </Cell>
        <Cell ss:StyleID="s58"
              ss:Formula="=IF(R[-2]C&lt;R53C5,&quot;SI&quot;,&quot;NO&quot;)">
          <Data ss:Type="String">SI</Data>
        </Cell>
        <Cell ss:Index="10">
          <Data ss:Type="Number">38677</Data>
        </Cell>
        <Cell>
          <Data ss:Type="Number">309229774.05024737</Data>
        </Cell>
        <Cell>
          <Data ss:Type="Number">0.8943451824113452</Data>
        </Cell>
      </Row>
      <Row ss:AutoFitHeight="0" ss:Hidden="1">
        <Cell ss:Index="2" ss:StyleID="s95">
          <Data ss:Type="String" x:Ticked="1">Saldo teórico para Colateralización 23%</Data>
        </Cell>
        <Cell ss:Index="4" ss:StyleID="s94" ss:Formula="=+RC[1]/R[-20]C[-1]">
          <Data ss:Type="Number">401763153.98056191</Data>
        </Cell>
        <Cell ss:StyleID="s54"
              ss:Formula="=(+R[-10]C[-1]*R[-20]C[-2])/(1-R[-2]C)">
          <Data ss:Type="Number">1468621103.5867052</Data>
        </Cell>
      </Row>
      <Row ss:AutoFitHeight="0" ss:Hidden="1">
        <Cell ss:Index="4" ss:StyleID="s26">
        </Cell>
        <Cell ss:StyleID="s54">
        </Cell>
      </Row>
      <Row ss:AutoFitHeight="0">
        <Cell ss:Index="4" ss:StyleID="s26">
        </Cell>
        <Cell ss:StyleID="s54">
        </Cell>
      </Row>
      <Row ss:AutoFitHeight="0">
        <Cell ss:Index="2"><Data ss:Type="String">Saldo Cartera Vigente</Data></Cell>
        <Cell ss:StyleID="s63"><Data ss:Type="String" x:Ticked="1">+</Data></Cell>
        <Cell ss:StyleID="s93" ss:Formula="=+RC[1]/R35C3"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s72" ss:Formula="=+R[-8]C"><Data ss:Type="Number"></Data></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2"><Data ss:Type="String">Monto Remanente</Data></Cell>
        <Cell ss:StyleID="s63"><Data ss:Type="String">+</Data></Cell>
        <Cell ss:StyleID="s94" ss:Formula="=+RC[1]/R35C3"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s73" ss:Formula="=+R[-35]C[7]"><Data ss:Type="Number"></Data></Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2" ss:StyleID="s59"><Data ss:Type="String">Activos Totales</Data></Cell>
        <Cell ss:Index="4" ss:StyleID="s100" ss:Formula="=+RC[1]/R35C3"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s81" ss:Formula="=+R[-1]C+R[-2]C"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s55"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="4" ss:StyleID="s73"></Cell>
        <Cell ss:StyleID="s73"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2"><Data ss:Type="String">Importe a repartir a la Constancia</Data></Cell>
        <Cell ss:Index="4" ss:StyleID="s93" ss:Formula="=+RC[1]/R[-27]C[-1]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s72" ss:Formula="=MAX(0,(R[-12]C/R[-27]C[-2])+R[-11]C-R[-7]C)"><Data ss:Type="Number"></Data></Cell>
      </Row>
      <Row>
        <Cell ss:Index="4" ss:StyleID="s73"></Cell>
        <Cell ss:StyleID="s73"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s95"><Data ss:Type="String" x:Ticked="1">Recursos diponibles </Data></Cell>
        <Cell ss:StyleID="s63"><Data ss:Type="String" x:Ticked="1">+</Data></Cell>
        <Cell ss:StyleID="s93" ss:Formula="=+RC[1]/R35C3"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s72" ss:Formula="=+R[-13]C-R[-2]C"><Data ss:Type="Number"></Data></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2"><Data ss:Type="String">Saldo Cartera Vigente</Data></Cell>
        <Cell ss:StyleID="s63"><Data ss:Type="String" x:Ticked="1">+</Data></Cell>
        <Cell ss:StyleID="s93" ss:Formula="=+RC[1]/R35C3"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s72" ss:Formula="=+R[-15]C"><Data ss:Type="Number"></Data></Cell>
      </Row>
      <Row ss:Height="12">
        <Cell ss:Index="2"><Data ss:Type="String">Saldo Final Colateral</Data></Cell>
        <Cell ss:StyleID="s63"><Data ss:Type="String" x:Ticked="1">=</Data></Cell>
        <Cell ss:StyleID="s100" ss:Formula="=+RC[1]/R35C3"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s81" ss:Formula="=+R[-1]C+R[-2]C"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s55"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="4" ss:StyleID="s65"></Cell>
        <Cell ss:StyleID="s65"></Cell>
      </Row>
      <Row>
        <Cell ss:Index="2" ss:StyleID="s59"><Data ss:Type="String">Colateralización final </Data></Cell>
        <Cell ss:StyleID="s59"></Cell>
        <Cell ss:StyleID="s56" ss:Formula="=1-(+R[-23]C/R[-2]C)"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s56" ss:Formula="=1-(R[-38]C[7]/(R[-2]C))"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s55"></Cell>
      </Row>
      <Row ss:Hidden="1">
        <Cell ss:Index="4" ss:StyleID="s26"/>
        <Cell ss:StyleID="s61" ss:Formula="=IF(R[-1]C&lt;R53C5,&quot;SI&quot;,&quot;NO&quot;)"><Data ss:Type="String">SI</Data></Cell>
        <Cell ss:StyleID="s55"/>
      </Row>
      <Row ss:Hidden="1">
        <Cell ss:Index="2" ss:StyleID="s59"><Data ss:Type="String">Colateral Faltante</Data></Cell>
        <Cell ss:StyleID="s59"/>
        <Cell ss:StyleID="s26"/>
        <Cell ss:StyleID="s54" ss:Formula="=IF(+R[-15]C-R[-4]C&gt;0,+R[-15]C-R[-4]C,0)"><Data ss:Type="Number">33840916.716705322</Data></Cell>
        <Cell ss:StyleID="s55"/>
      </Row>
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
        <Scale>70</Scale>
        <HorizontalResolution>600</HorizontalResolution>
        <VerticalResolution>600</VerticalResolution>
      </Print>
      <Zoom>90</Zoom>
      <Selected/>
      <Panes>
        <Pane>
          <Number>3</Number>
          <ActiveRow>64</ActiveRow>
          <ActiveCol>4</ActiveCol>
        </Pane>
      </Panes>
      <ProtectObjects>False</ProtectObjects>
      <ProtectScenarios>False</ProtectScenarios>
    </WorksheetOptions>
    <ConditionalFormatting xmlns="urn:schemas-microsoft-com:office:excel">
      <Range>R69C5,R54C5</Range>
      <Condition>
        <Qualifier>Equal</Qualifier>
        <Value1>&quot;si&quot;</Value1>
        <Format Style="color:white;font-weight:700;background:red"/>
      </Condition>
    </ConditionalFormatting>
  </Worksheet>
  </Workbook>
  </xsl:template>
</xsl:stylesheet>