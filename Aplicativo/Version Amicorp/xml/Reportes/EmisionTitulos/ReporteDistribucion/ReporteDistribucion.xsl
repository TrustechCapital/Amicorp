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
      <Font ss:FontName="Calibri"/>
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
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s23">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s24">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s25" ss:Parent="s16">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s26">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s27">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="&quot;&quot;###,###,###,###.##"/>
    </Style>
    <Style ss:ID="h27">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="&quot;&quot;###,###,###,##0.000000"/>
    </Style>
    <Style ss:ID="s28">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="&quot;&quot;###,###,###,###"/>
    </Style>
    <Style ss:ID="p28">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="&quot;&quot;###,###,###,###.######"/>
    </Style>
    <Style ss:ID="h28">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="&quot;&quot;###,###,###,###"/>
    </Style>
    <Style ss:ID="s29">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s30">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s31">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s32" ss:Parent="s16">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s33">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s34" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#0000FF"
            ss:Bold="1"/>
      <NumberFormat ss:Format="0.0%"/>
    </Style>
    <Style ss:ID="s35">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s36" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="0.0%"/>
    </Style>
    <Style ss:ID="s37" ss:Parent="s16">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s38">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s39">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s40">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
    </Style>
    <Style ss:ID="s41">
      <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="#,##0&quot;            &quot;"/>
    </Style>
    <Style ss:ID="s42" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s43" ss:Parent="s16">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#00FFFF"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s44">
      <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior/>
      <NumberFormat ss:Format="#,##0&quot;            &quot;"/>
    </Style>
    <Style ss:ID="s45" ss:Parent="s22">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s46">
      <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior/>
      <NumberFormat ss:Format="#,##0&quot;            &quot;"/>
    </Style>
    <Style ss:ID="s47" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s48">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s49">
      <Alignment ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s50" ss:Parent="s16">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s51" ss:Parent="s16">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <!--NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/-->
      <NumberFormat ss:Format="&quot;&quot;###,###,##0.00"/>
    </Style>
    <Style ss:ID="s52" ss:Parent="s16">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s53" ss:Parent="s22">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s54" ss:Parent="s16">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s55">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s56" ss:Parent="s22">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s57" ss:Parent="s22">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="0.0%"/>
    </Style>
    <Style ss:ID="s58" ss:Parent="s16">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s59">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s60">
      <Alignment ss:Horizontal="Left" ss:Vertical="Center" ss:WrapText="1"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s61" ss:Parent="s16">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#FFFFFF"
            ss:Bold="1"/>
      <Interior ss:Color="#006598" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s63">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s65" ss:Parent="s22">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s66">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s67">
      <Alignment ss:Horizontal="Right" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="#,##0&quot;            &quot;"/>
    </Style>
    <Style ss:ID="s68" ss:Parent="s22">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s69">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s70">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"
            ss:Underline="Single"/>
    </Style>
    <Style ss:ID="s71">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"
            ss:Underline="Single"/>
    </Style>
    <Style ss:ID="s72" ss:Parent="s18">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s73" ss:Parent="s18">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s74">
      <Alignment ss:Horizontal="Center" ss:Vertical="Center" ss:WrapText="1"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s75" ss:Parent="s16">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#0000FF"
            ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s76">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"
            ss:Underline="Single"/>
    </Style>
    <Style ss:ID="s77" ss:Parent="s18">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s78" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s79" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s80" ss:Parent="s18">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"
            ss:Underline="SingleAccounting"/>
    </Style>
    <Style ss:ID="s81" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s82" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s83" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s84" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s85" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#FF0000"
            ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s86" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
    </Style>
    <Style ss:ID="s87" ss:Parent="s18">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s88" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s89" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s90" ss:Parent="s18">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s91">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s92">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="_-&quot;$&quot;* #,##0.00_-;\-&quot;$&quot;* #,##0.00_-;_-&quot;$&quot;* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s93" ss:Parent="s18">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="&quot;UDI &quot;#,##0.00"/>
    </Style>
    <Style ss:ID="s94" ss:Parent="s18">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="&quot;UDI &quot;#,##0.00"/>
    </Style>
    <Style ss:ID="s95">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s96" ss:Parent="s18">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#0000FF"/>
    </Style>
    <Style ss:ID="s97">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#0000FF"/>
      <NumberFormat ss:Format="Short Date"/>
    </Style>
    <Style ss:ID="s98">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"
            ss:Underline="Single"/>
      <NumberFormat ss:Format="Percent"/>
    </Style>
    <Style ss:ID="s99" ss:Parent="s22">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s100" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="&quot;&quot;###,###,##0.00"/>
    </Style>
    <Style ss:ID="s101">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"
            ss:Underline="Single"/>
    </Style>
    <Style ss:ID="s102">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s103">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
    </Style>
    <Style ss:ID="s104">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
    </Style>
    <Style ss:ID="s105">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s106">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s107">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s108">
      <Alignment ss:Horizontal="Left" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#FFFFFF"
            ss:Bold="1"/>
      <Interior ss:Color="#006598" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s109">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#FFFFFF"/>
      <Interior ss:Color="#006598" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s110" ss:Parent="s16">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"
            ss:Underline="SingleAccounting"/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s111" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
    </Style>
    <Style ss:ID="s112" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#0000FF"
            ss:Bold="1"/>
    </Style>
    <Style ss:ID="s113" ss:Parent="s18">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior ss:Color="#FFFF00" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="&quot;UDI &quot;#,##0.00"/>
    </Style>
    <Style ss:ID="s114" ss:Parent="s18">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#0000FF"/>
      <Interior ss:Color="#FFFF00" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s115" ss:Parent="s16">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s116">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
    </Style>
    <Style ss:ID="s117">
      <Borders>
        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s118">
      <Borders>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="###,###,###,###,##0.00"/>
      <Interior/>
    </Style>
    <Style ss:ID="s119">
      <Borders>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
    </Style>
    <Style ss:ID="s120">
      <Borders>
        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s121">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s122">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="_-&quot;$&quot;* #,##0.00_-;\-&quot;$&quot;* #,##0.00_-;_-&quot;$&quot;* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s123">
      <Borders>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s124">
      <Borders>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
    </Style>
    <Style ss:ID="s125">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
    </Style>
    <Style ss:ID="s126" ss:Parent="s16">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0.00_-;\-* #,##0.00_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s127">
      <Borders>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="_-&quot;$&quot;* #,##0.00_-;\-&quot;$&quot;* #,##0.00_-;_-&quot;$&quot;* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s128" ss:Parent="s16">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="_-* #,##0_-;\-* #,##0_-;_-* &quot;-&quot;??_-;_-@_-"/>
    </Style>
    <Style ss:ID="s129">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior/>
    </Style>
    <Style ss:ID="s130">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="###,###,###,###,##0.00"/>
    </Style>
    <Style ss:ID="s131">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="###,###,###,###,##0.00"/>
      <Interior/>
    </Style>
    <Style ss:ID="s132">
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <Interior/>
      <NumberFormat ss:Format="0.000000"/>
    </Style>
    <Style ss:ID="s133">
      <Borders>
        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"
            ss:Underline="Single"/>
      <Interior/>
    </Style>
    <Style ss:ID="s134">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11"/>
      <NumberFormat ss:Format="Short Date"/>
    </Style>
    <Style ss:ID="s135">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#0000FF"/>
      <Interior ss:Color="#FFFF00" ss:Pattern="Solid"/>
      <NumberFormat ss:Format="0.0000000"/>
    </Style>
    <Style ss:ID="s136" ss:Parent="s22">
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <NumberFormat ss:Format="0.000%"/>
    </Style>
    <Style ss:ID="s137" ss:Parent="s18">
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#0000FF"/>
      <Interior/>
    </Style>
    <Style ss:ID="s138" ss:Parent="s16">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Bold="1"/>
      <Interior/>
      <NumberFormat ss:Format="Short Date"/>
    </Style>
    <Style ss:ID="s144">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Borders>
        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="2"/>
      </Borders>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#FFFFFF"
            ss:Bold="1"/>
      <Interior ss:Color="#006598" ss:Pattern="Solid"/>
    </Style>
    <Style ss:ID="s146">
      <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
      <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#FFFFFF"
            ss:Bold="1"/>
      <Interior ss:Color="#006598" ss:Pattern="Solid"/>
    </Style>
  </Styles>
  <Worksheet ss:Name="Reporte de Distribuciones UDIS">
    <Table ss:ExpandedColumnCount="21" ss:ExpandedRowCount="250" x:FullColumns="1" x:FullRows="1" ss:StyleID="s26" ss:DefaultColumnWidth="60" ss:DefaultRowHeight="11.25">
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="60"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="80"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="60"/>
      <Column ss:StyleID="s32" ss:AutoFitWidth="0" ss:Width="60"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="60"/>
      <Column ss:StyleID="s26" ss:Width="90"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="30"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="80"/>
      <Column ss:StyleID="s26" ss:Width="60"/>
      <Column ss:StyleID="s26" ss:Width="80"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="40"/>
      <Column ss:StyleID="s26" ss:AutoFitWidth="0" ss:Width="80"/>
      <Column ss:StyleID="s26" ss:Width="30"/>
      <Column ss:StyleID="s26" ss:Width="60"/>
      <Column ss:StyleID="s26" ss:Width="54.75"/>
      <Column ss:StyleID="s26" ss:Width="68.25"/>
      <Column ss:StyleID="s26" ss:Width="64.5"/>
      <Column ss:StyleID="s26" ss:Width="62.25"/>
      <Column ss:StyleID="s26" ss:Width="51.75"/>
      <Column ss:StyleID="s26" ss:Width="68.25"/>
      <Column ss:StyleID="s26" ss:Width="76.5"/>
      <!-- Inicio REPORTE DISTRIBUCION -->
      
      <Row ss:Index="6" ss:AutoFitHeight="0" ss:Height="13.5">
        <Cell ss:Index="2" ss:MergeAcross="11" ss:StyleID="s146"><Data ss:Type="String">Reporte de Distribución</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Emisor</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27" ss:MergeAcross="2"><Data ss:Type="String">rdNomEmisor</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Fideicomitente</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27" ss:MergeAcross="2"><Data ss:Type="String">rdNomFideicomitente</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51" ss:MergeAcross="1"><Data ss:Type="String">Fecha Inicio de Cupón</Data></Cell>
        <Cell ss:StyleID="h27" ss:MergeAcross="1"><Data ss:Type="String">rdFechaInicio</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Certificados</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27" ss:MergeAcross="1"><Data ss:Type="String">rdPizarraSerie1</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">rdPizarraSerie2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51" ss:MergeAcross="1"><Data ss:Type="String">Fecha Fin de Cupón</Data></Cell>
        <Cell ss:StyleID="h27" ss:MergeAcross="1"><Data ss:Type="String">rdFechaFin</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Fecha de Emisión</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27" ss:MergeAcross="2"><Data ss:Type="String">rdFechaEmision</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51" ss:MergeAcross="1"><Data ss:Type="String">Fecha de Pago</Data></Cell>
        <Cell ss:StyleID="h27" ss:MergeAcross="1"><Data ss:Type="String">rdFechaPago</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Fecha de Determinación</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27" ss:MergeAcross="2"><Data ss:Type="String">rdFechaDeterminacion</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51" ss:MergeAcross="1"><Data ss:Type="String">Número de Días</Data></Cell>
        <Cell ss:StyleID="h28" ss:MergeAcross="1"><Data ss:Type="Number">rdDiasPeriodo</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Cupón</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdIdPeriodo</Data></Cell>
        <Cell ss:StyleID="s27" ss:MergeAcross="2"></Cell>
        <Cell ss:StyleID="s51" ss:MergeAcross="1"><Data ss:Type="String">Valor UDI</Data></Cell>
        <Cell ss:StyleID="h27" ss:MergeAcross="1"><Data ss:Type="Number">rdTasaUdi</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      
      <!-- INGRESO Y GASTOS -->
      <Row ss:AutoFitHeight="0" ss:Height="13.5">
        <Cell ss:Index="2" ss:MergeAcross="11" ss:StyleID="s146"><Data ss:Type="String">Ingresos y Gastos</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdConceptoCobranzaInicial</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpDepositoInicial</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdConceptoCobranza1</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpDeposito1</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdConceptoCobranza2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpDeposito2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdConceptoCobranza3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpDeposito3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdConceptoIntereses</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpIntereses</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdIsr</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s130"><Data ss:Type="Number">rdImpIsr</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">rdConceptoCobranzaTotal</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51"><Data ss:Type="Number">rdImpDepositoTotal</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Gastos Permitidos</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpGastosPermitidos</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Honorarios Fiduciario</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpHonoFid</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Honorarios Representante Común</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpHonoRepComun</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Cuota BMV</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpHonoBmv</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Cuota CNBV</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpHonoCnvb</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Publicaciones</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpHonoPublicaciones</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Auditores Externos</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpHonoAuditXt</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Administrador Maestro</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpAdministrador</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Calificadoras</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdImpHonoCalif</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Otros</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s130"><Data ss:Type="Number">rdImpOtros</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Total Gastos</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51"><Data ss:Type="Number">rdTotGastos</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Recursos Disponibles</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51" ss:Formula="=R[-14]C-R[-2]C"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      
      
      <!-- CASCADA DE  PAGOS -->
      <Row ss:AutoFitHeight="0" ss:Height="13.5">
        <Cell ss:Index="2" ss:MergeAcross="11" ss:StyleID="s146"><Data ss:Type="String">Cascada de Pagos</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s116"><Data ss:Type="String">Constancia</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">rdPizarraSerie1</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">rdPizarraSerie2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">rdPizarra3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51"><Data ss:Type="String">TOTAL</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Intereses vencidos y no pagados</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Intereses pendientes de pago periodos anteriores</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdIntPendientes</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdIntPendientes2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdIntPendientes3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"  ss:Formula="=SUM(RC[-6]:RC[-2])"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Pago de Intereses</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdConceptoPagoIntereses</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdPagoIntereses</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdPagoIntereses2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdPagoIntereses3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"  ss:Formula="=SUM(RC[-6]:RC[-2])"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Amortización Anticipada de Principal de los CB's</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Evento de Paridad</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmorPrincipal</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmorPrincipal2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmorPrincipal3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"  ss:Formula="=SUM(RC[-6]:RC[-2])"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Evento de cartera vencida acumulada</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmorCarVen</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmorCarVen2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmorCarVen3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"  ss:Formula="=SUM(RC[-6]:RC[-2])"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Intereses vencidos y no pagados Instrumento Subordinado</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Intereses pendientes de pago periodos anteriores</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdInterPendPerAnt</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdInterPendPerAnt2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdInterPendPerAnt3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"  ss:Formula="=SUM(RC[-6]:RC[-2])"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Pago de Intereses Instrumento Subordinado</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdConceptopagoIntInstSub</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdPagoIntInstSub</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdPagoIntInstSub2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdPagoIntInstSub3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"  ss:Formula="=SUM(RC[-6]:RC[-2])"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Amortización Anticipada de Principal</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Amortización Anticipada</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmorAntPrincipal</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmorAntPrincipal2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmorAntPrincipal3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"  ss:Formula="=SUM(RC[-6]:RC[-2])"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Importe a pagar</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s100" ss:Formula="=SUM(R[-18]C:R[-1]C)"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s100"></Cell>
        <Cell ss:StyleID="s100" ss:Formula="=SUM(R[-18]C:R[-1]C)"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s100"></Cell>
        <Cell ss:StyleID="s100" ss:Formula="=SUM(R[-18]C:R[-1]C)"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s100"></Cell>
        <Cell ss:StyleID="s100" ss:Formula="=SUM(RC[-6]:RC[-2])"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"><Data ss:Type="String">Monto Remanente</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s100" ss:Formula="=R[-26]C-R[-2]C"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      
      <!-- SALDO INSOLUTO E INTERESES DEL  PERIODO -->
      <Row ss:AutoFitHeight="0" ss:Height="13.5">
        <Cell ss:Index="2" ss:MergeAcross="11" ss:StyleID="s146"><Data ss:Type="String">Saldo Insoluto e Intereses del Periodo</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Número de Certificados Bursátiles</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdNumTitulos</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdNumTitulos2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdNumTitulos3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27" ss:Formula="=RC[-6]+RC[-4]+RC[-2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Valor Nominal de la Constancia Preferente</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdValNomAjustadoConv3</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27" ss:Formula="=RC[-6]+RC[-4]+RC[-2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Valor Nominal Inicial por Título</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdValNomInicial</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdValNomInicial2</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Valor Nominal Ajustado por Título</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdValNomAjustado</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdValNomAjustado2</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Factor Prorrata</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdFactorPorrata</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">%</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdFactorPorrata2</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">%</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27" ss:Formula="=RC[-6]+RC[-4]+RC[-2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">%</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Tasa de Interes</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdTasaInteres</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">%</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdTasaInteres2</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">%</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdTasaInteres3</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">%</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Intereses del Período</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s118"><Data ss:Type="Number">rdIntereses</Data></Cell>
        <Cell ss:StyleID="s118"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s118"><Data ss:Type="Number">rdIntereses2</Data></Cell>
        <Cell ss:StyleID="s118"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s118"><Data ss:Type="Number">rdIntereses3</Data></Cell>
        <Cell ss:StyleID="s118"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27" ss:Formula="=RC[-6]+RC[-4]+RC[-2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Valor Nominal Inicial de la emisión</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdVanIniEmision</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdVanIniEmision2</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdVanIniEmision3</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27" ss:Formula="=RC[-6]+RC[-4]+RC[-2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Amortización</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmortizacion</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmortizacion2</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdAmortizacion3</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27" ss:Formula="=RC[-6]+RC[-4]+RC[-2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Valor Nominal Ajustado de la emisión</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdVanAjustadoEmi</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdVanAjustadoEmi2</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdVanAjustadoEmi3</Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
        <Cell ss:StyleID="s27" ss:Formula="=RC[-6]+RC[-4]+RC[-2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="String">UDIS</Data></Cell>
      </Row>
      <Row ss:Height="5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Valor Nominal Inicial de la Emisión MXN</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s118"><Data ss:Type="Number">rdValNomInicialConv</Data></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s118"><Data ss:Type="Number">rdValNomInicialConv2</Data></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s118"><Data ss:Type="Number">rdValNomInicialConv3</Data></Cell>
        <Cell ss:StyleID="s118"></Cell>
        <Cell ss:StyleID="s118" ss:Formula="=RC[-6]+RC[-4]+RC[-2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Valor Nominal Ajustado de la Emisión MXN</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s131"><Data ss:Type="Number">rdValNomAjustadoConv</Data></Cell>
        <Cell ss:StyleID="s131"></Cell>
        <Cell ss:StyleID="s131"><Data ss:Type="Number">rdValNomAjustadoConv2</Data></Cell>
        <Cell ss:StyleID="s131"></Cell>
        <Cell ss:StyleID="s131"><Data ss:Type="Number">rdValNomAjustadoConv3</Data></Cell>
        <Cell ss:StyleID="s131"></Cell>
        <Cell ss:StyleID="s27" ss:Formula="=RC[-6]+RC[-4]+RC[-2]"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      
      <!-- ESTADISTICA DE MOROSIDAD DE CARTERA -->
      <Row ss:AutoFitHeight="0" ss:Height="13.5">
        <Cell ss:Index="2" ss:MergeAcross="11" ss:StyleID="s146"><Data ss:Type="String">Estadística de Morosidad de Cartera</Data></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Saldo Final Cartera</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdSalFinCartera</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Número de Créditos al Final del Periodo</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdNumCreditos</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s51"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">No. de Cuentas</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">% Cuentas</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"><Data ss:Type="String">Saldo</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdMorConcpeto1</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorNumCtas1</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="p28"><Data ss:Type="Number">rdMorPjeCtas1</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorImporte1</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdMorConcpeto2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorNumCtas2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="p28"><Data ss:Type="Number">rdMorPjeCtas2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorImporte2</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdMorConcpeto3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorNumCtas3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="p28"><Data ss:Type="Number">rdMorPjeCtas3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorImporte3</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdMorConcpeto4</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorNumCtas4</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="p28"><Data ss:Type="Number">rdMorPjeCtas4</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorImporte4</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdMorConcpeto5</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorNumCtas5</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="p28"><Data ss:Type="Number">rdMorPjeCtas5</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorImporte5</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdMorConcpeto6</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorNumCtas6</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="p28"><Data ss:Type="Number">rdMorPjeCtas6</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorImporte6</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdMorConcpeto7</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorNumCtas7</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="p28"><Data ss:Type="Number">rdMorPjeCtas7</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorImporte7</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdMorConcpeto8</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorNumCtas8</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="p28"><Data ss:Type="Number">rdMorPjeCtas8</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s28"><Data ss:Type="Number">rdMorImporte8</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">rdMorConcpeto8</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51" ss:Formula="=SUM(R[-8]C:R[-1]C)"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51" ss:Formula="=SUM(R[-8]C:R[-1]C)"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51" ss:Formula="=SUM(R[-8]C:R[-1]C)"><Data ss:Type="Number"></Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"><Data ss:Type="String">Saldo vigente de cartera hipotecaria</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"><Data ss:Type="Number">rdSalFinCartera</Data></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s71"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s51"></Cell>
        <Cell ss:StyleID="s27"></Cell>
      </Row>
      
      <Row ss:Height="13.5">
        <Cell ss:Index="2" ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
        <Cell ss:StyleID="s27"></Cell>
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
      <Zoom>100</Zoom>
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