<%@page contentType="application/vnd.ms-excel"%>
<%
response.setHeader("Content-Disposition","attachment; filename=\"ReporteCartera.xls\"");
%>

<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="ReporteCartera_archivos/filelist.xml">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]-->
<style id="Archivo Composicin de Cartera Final_32513_Styles">
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.font532513
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.font632513
	{color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl8032513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8132513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8232513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8332513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8432513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"0\.0000";
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8532513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\.0000";
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl8632513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:justify;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl8732513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl8832513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl8932513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	background:white;
	mso-pattern:auto none;
	white-space:nowrap;}
.xl9032513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9132513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9232513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9332513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9432513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:1.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9532513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_-* \#\,\#\#0\.00_-\;\\-* \#\,\#\#0\.00_-\;_-* \0022-\0022??_-\;_-\@_-";
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9632513
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl9732513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:right;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9832513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl9932513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl10032513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl10132513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl10232513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:right;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl10332513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl10432513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl10532513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:justify;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl10632513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0";
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl10732513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_-* \#\,\#\#0_-\;\\-* \#\,\#\#0_-\;_-* \0022-\0022??_-\;_-\@_-";
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl10832513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:Standard;
	text-align:justify;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl10932513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl11032513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl11132513
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border-top:none;
	border-right:none;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl11232513
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border-top:none;
	border-right:1.5pt solid windowtext;
	border-bottom:1.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl11332513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl11432513
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl11532513
	{padding:0px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border-top:.5pt solid windowtext;
	border-right:1.5pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl11632513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:italic;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl11732513
	{padding:0px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:700;
	font-style:italic;
	text-decoration:underline;
	text-underline-style:single;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	mso-number-format:"\[$-F800\]dddd\\\,\\ mmmm\\ dd\\\,\\ yyyy";
	text-align:center;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
-->
</style>
</head>

<body>
<%

java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
        
    String sfideicomiso="";
    String sfecha="";
    String fecha="";
    String pizarra="";
    String serie="";
    
    String ncer = "";
    String ncercre = "";
    String ncerred = "";
    String naftracs = "";
    String ntitnaftracs = "";
    String vcanasta = "";
    String nceruni = "";
    String vactivos = "";
    String cuenta = "";
    String preciotra = "";
    
    
    if(consulta.size()>0) 
    { 
        registro = (java.util.Map)consulta.get(0);
        sfideicomiso = (String)registro.get("temNomFiso");
        sfecha = (String)registro.get("temNomFecMovto");
        fecha = (String)registro.get("temFecMovto");
        
        serie=(String)registro.get("temIdSerie");
        pizarra=(String)registro.get("temIdPizarra");
        ncer=(String)registro.get("temCerCirculacion");
        ncercre=(String)registro.get("temCerCreados");
        ncerred=(String)registro.get("temCerRedimidos");
        vcanasta=(String)registro.get("temValorCanasta");
        naftracs=(String)registro.get("temNumTracs");
        ntitnaftracs = (String)registro.get("temNumTitulos");
        preciotra = (String)registro.get("temPrecioTra");
        nceruni=(String)registro.get("temNumUnidad");
        vactivos=(String)registro.get("temValorActivos");
        cuenta=(String)registro.get("temCuentaGastos");
        //=(String)registro.get("temNumTitulos");
        //fecha=(String)registro.get("temPrecioTra");
    
%>

<!--[if !excel]>&nbsp;&nbsp;<![endif]-->
<!--La siguiente información se generó mediante la característica Publicar como
página Web de Microsoft Office Excel.-->
<!--Si se vuelve a publicar el mismo elemento desde Excel, se reemplazará toda
la información comprendida entre las etiquetas DIV.-->
<!----------------------------->
<!--INICIO DE LOS RESULTADOS DEL ASISTENTE PARA PUBLICAR COMO PÁGINA WEB DE
EXCEL -->
<!----------------------------->

<div id="Archivo Composicin de Cartera Final_32513" align=center
x:publishsource="Excel">

<table x:str border=0 cellpadding=0 cellspacing=0 width=1660 class=xl8032513
 style='border-collapse:collapse;table-layout:fixed;width:1248pt'>
 <col class=xl8032513 width=21 style='mso-width-source:userset;mso-width-alt:
 768;width:16pt'>
 <col class=xl8032513 width=98 style='mso-width-source:userset;mso-width-alt:
 3584;width:74pt'>
 <col class=xl8032513 width=81 style='mso-width-source:userset;mso-width-alt:
 2962;width:61pt'>
 <col class=xl8032513 width=122 style='mso-width-source:userset;mso-width-alt:
 4461;width:92pt'>
 <col class=xl8032513 width=94 style='mso-width-source:userset;mso-width-alt:
 3437;width:71pt'>
 <col class=xl8032513 width=92 style='mso-width-source:userset;mso-width-alt:
 3364;width:69pt'>
 <col class=xl8032513 width=117 style='mso-width-source:userset;mso-width-alt:
 4278;width:88pt'>
 <col class=xl8032513 width=140 style='mso-width-source:userset;mso-width-alt:
 5120;width:105pt'>
 <col class=xl8032513 width=237 style='mso-width-source:userset;mso-width-alt:
 8667;width:178pt'>
 <col class=xl8032513 width=89 span=2 style='mso-width-source:userset;
 mso-width-alt:3254;width:67pt'>
 <col class=xl8032513 width=80 span=6 style='width:60pt'>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 width=21 style='height:12.75pt;width:16pt'><a
  name="RANGE!A1:I38"></a></td>
  <td class=xl8032513 width=98 style='width:74pt'></td>
  <td class=xl8032513 width=81 style='width:61pt'></td>
  <td class=xl8032513 width=122 style='width:92pt'></td>
  <td width=94 style='width:71pt' align=left valign=top><!--[if gte vml 1]><v:shapetype
   id="_x0000_t75" coordsize="21600,21600" o:spt="75" o:preferrelative="t"
   path="m@4@5l@4@11@9@11@9@5xe" filled="f" stroked="f">
   <v:stroke joinstyle="miter"/>
   <v:formulas>
    <v:f eqn="if lineDrawn pixelLineWidth 0"/>
    <v:f eqn="sum @0 1 0"/>
    <v:f eqn="sum 0 0 @1"/>
    <v:f eqn="prod @2 1 2"/>
    <v:f eqn="prod @3 21600 pixelWidth"/>
    <v:f eqn="prod @3 21600 pixelHeight"/>
    <v:f eqn="sum @0 0 1"/>
    <v:f eqn="prod @6 1 2"/>
    <v:f eqn="prod @7 21600 pixelWidth"/>
    <v:f eqn="sum @8 21600 0"/>
    <v:f eqn="prod @7 21600 pixelHeight"/>
    <v:f eqn="sum @10 21600 0"/>
   </v:formulas>
   <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
   <o:lock v:ext="edit" aspectratio="t"/>
  </v:shapetype><v:shape id="Picture_x0020_34" o:spid="_x0000_s1135" type="#_x0000_t75"
   style='position:absolute;margin-left:64.5pt;margin-top:9.75pt;width:189pt;
   height:53.25pt;z-index:5;visibility:visible'>
   <v:imagedata src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image001.jpg"
    o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><v:shape id="Picture_x0020_1" o:spid="_x0000_s1131" type="#_x0000_t75"
   style='position:absolute;margin-left:190.5pt;margin-top:0;width:197.25pt;
   height:2.25pt;z-index:1;visibility:visible'>
   <v:imagedata src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image002.emz"
    o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Pict</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:5;margin-left:86px;margin-top:0px;width:431px;
  height:84px'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td width=0 height=0></td>
    <td width=168></td>
    <td width=84></td>
    <td width=179></td>
   </tr>
   <tr>
    <td height=3></td>
    <td></td>
    <td colspan=2 align=left valign=top><img width=263 height=3
    src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image003.gif"
    v:shapes="Picture_x0020_1"></td>
   </tr>
   <tr>
    <td height=10></td>
   </tr>
   <tr>
    <td height=71></td>
    <td colspan=2 align=left valign=top><img width=252 height=71
    src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image004.jpg"
    v:shapes="Picture_x0020_34"></td>
   </tr>
  </table>
  </span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=17 class=xl8032513 width=94 style='height:12.75pt;width:71pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl8032513 width=92 style='width:69pt'></td>
  <td class=xl8032513 width=117 style='width:88pt'></td>
  <td class=xl8032513 width=140 style='width:105pt'></td>
  <td class=xl8032513 width=237 style='width:178pt'></td>
  <td class=xl8032513 width=89 style='width:67pt'></td>
  <td class=xl8032513 width=89 style='width:67pt'></td>
  <td class=xl8032513 width=80 style='width:60pt'></td>
  <td class=xl8032513 width=80 style='width:60pt'></td>
  <td class=xl8032513 width=80 style='width:60pt'></td>
  <td class=xl8032513 width=80 style='width:60pt'></td>
  <td class=xl8032513 width=80 style='width:60pt'></td>
  <td class=xl8032513 width=80 style='width:60pt'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td align=left valign=top><!--[if gte vml 1]><v:shape id="Picture_x0020_31"
   o:spid="_x0000_s1132" type="#_x0000_t75" style='position:absolute;
   margin-left:72.75pt;margin-top:7.5pt;width:571.5pt;height:12pt;z-index:2;
   visibility:visible'>
   <v:imagedata src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image005.jpg"
    o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:2;margin-left:97px;margin-top:10px;width:762px;
  height:16px'><img width=762 height=16
  src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image006.jpg"
  v:shapes="Picture_x0020_31"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=17 class=xl8032513 width=98 style='height:12.75pt;width:74pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl10332513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=24 style='height:18.0pt'>
  <td colspan=9 height=24 class=xl11332513 style='border-right:1.5pt solid black;
  height:18.0pt'>PROTEGO CASA DE BOLSA, S.A. DE C.V., DIVISIÓN FIDUCIARIA</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=24 style='height:18.0pt'>
  <td height=24 class=xl9332513 style='height:18.0pt'>&nbsp;</td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl9432513>&nbsp;</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td colspan=9 height=25 class=xl11032513 style='border-right:1.5pt solid black;
  height:18.75pt'><%=sfideicomiso%></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 class=xl8132513 style='height:18.75pt'></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=24 style='height:18.0pt'>
  <td height=24 class=xl8132513 style='height:18.0pt'></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513></td>
  <td class=xl8132513 colspan=4>ARCHIVO DE COMPOSICIÓN DE CARTERA al <%=sfecha%></td>
  
  <td align=left valign=top><!--[if gte vml 1]><v:shape id="Picture_x0020_33"
   o:spid="_x0000_s1134" type="#_x0000_t75" style='position:absolute;
   margin-left:49.5pt;margin-top:15pt;width:6in;height:387pt;z-index:4;
   visibility:visible'>
   <v:imagedata src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image007.jpg"
    o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:4;margin-left:66px;margin-top:20px;width:576px;
  height:516px'><img width=576 height=516
  src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image008.jpg"
  v:shapes="Picture_x0020_33"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=24 class=xl8032513 width=89 style='height:18.0pt;width:67pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=0 style='display:none'>
  <td colspan=9 class=xl11632513>Composición de la Unidad Mínima de Conversión,
  Precio Teórico del NAFTRAC y Cuenta de Gastos al:</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=9 height=17 class=xl11732513 width=1002 style='height:12.75pt;
  width:754pt' x:num="40427" x:fmla="=TODAY()">Lunes, 06 de Septiembre de 2010</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td colspan=9 height=17 class=xl11632513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8232513 style='height:12.75pt'></td>
  <td class=xl8232513></td>
  <td class=xl8232513></td>
  <td class=xl8232513></td>
  <td class=xl8232513></td>
  <td class=xl8232513></td>
  <td class=xl8232513></td>
  <td class=xl8232513></td>
  <td class=xl8232513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513>FECHA</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl10332513 align=right x:num="40427" x:fmla="=TODAY()"><%=fecha%></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513>SERIE</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl9732513><%=serie%></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl8032513 style='height:15.0pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513 colspan=2>CLAVE DE PIZARRA</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl9732513><%=pizarra%></td>
  <td class=xl8032513></td>
  <td class=xl9632513 width=237 style='width:178pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl8032513 style='height:15.0pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513 colspan=3>NUMERO DE CERTIFICADOS EN CIRCULACION</td>
  <td class=xl9732513></td>
  <td class=xl10432513 align=right x:num="<%=ncer%>"><%=ncer%></td>
  <td class=xl8032513></td>
  <td class=xl9632513 width=237 style='width:178pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513 colspan=3>NUMERO DE CERTIFICADOS CREADOS</td>
  <td class=xl9732513></td>
  <td class=xl10432513 align=right x:num="<%=ncercre%>"><%=ncercre%></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513 colspan=3>NUMERO DE CERTIFICADOS REDIMIDOS</td>
  <td class=xl9732513></td>
  <td class=xl10432513 align=right x:num="<%=ncerred%>"><%=ncerred%></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513 colspan=3>VALOR TEÓRICO DE LA CANASTA</td>
  <td class=xl9732513></td>
  <td class=xl10432513 align=right x:num="<%=vcanasta%>" x:fmla="=+G24*F33"><%=vcanasta%></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513 colspan=4>CANTIDAD DE VALORES (NAFTRACS) POR CANASTA</td>
  <td class=xl10632513 align=right x:num="<%=naftracs%>"><%=naftracs%></td>
  <td class=xl8032513></td>
  <td class=xl8332513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513 colspan=4>NÚMERO DE CERTIFICADOS POR UNIDAD MINIMA</td>
  <td class=xl9032513 align=right x:num="<%=nceruni%>"><%=nceruni%></td>
  <td class=xl8032513></td>
  <td class=xl8532513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl8032513 style='height:14.25pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513 colspan=3>VALOR NETO DE LOS ACTIVOS<font
  class="font532513"><sup>2)</sup></font></td>
  <td class=xl9732513></td>
  <td class=xl10432513 align=right x:num="<%=vactivos%>" x:fmla="=+G33"><%=vactivos%></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl8032513 style='height:14.25pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513 colspan=2>CUENTA DE GASTOS<font class="font532513"><sup>1)</sup></font></td>
  <td class=xl8032513></td>
  <td class=xl9732513></td>
  <td class=xl8332513 align=right x:num="<%=cuenta%>"><%=cuenta%></td>
  <td class=xl8432513></td>
  <td class=xl8532513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td colspan=9 height=24 class=xl10532513 width=1002 style='height:18.0pt;
  width:754pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl10532513 width=21 style='height:18.0pt;width:16pt'></td>
  <td class=xl10532513 width=98 style='width:74pt'></td>
  <td colspan=5 class=xl10932513 width=506 style='width:381pt'>POSICIÓN EN
  VALORES DEL FIDEICOMISO AL CIERRE</td>
  <td class=xl10832513 width=140 style='width:105pt' x:num="<%=ncer%>"
  x:fmla="=(G20+G21)"><%=ncer%></td>
  <td class=xl10532513 width=237 style='width:178pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=24 style='mso-height-source:userset;height:18.0pt'>
  <td height=24 class=xl8632513 width=21 style='height:18.0pt;width:16pt'></td>
  <td class=xl8632513 width=98 style='width:74pt'></td>
  <td class=xl8632513 width=81 style='width:61pt'></td>
  <td class=xl8632513 width=122 style='width:92pt'></td>
  <td class=xl8632513 width=94 style='width:71pt'></td>
  <td class=xl8632513 width=92 style='width:69pt'></td>
  <td class=xl8632513 width=117 style='width:88pt'></td>
  <td class=xl8632513 width=140 style='width:105pt'></td>
  <td class=xl8632513 width=237 style='width:178pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=35 style='height:26.25pt'>
  <td height=35 class=xl8032513 style='height:26.25pt'></td>
  <td class=xl8032513></td>
  <td class=xl8732513 width=81 style='width:61pt'>EMISORA</td>
  <td class=xl8732513 width=122 style='width:92pt'>SERIE</td>
  <td class=xl8832513 width=94 style='width:71pt'>TITULOS</td>
  <td class=xl8832513 width=92 style='width:69pt'>PRECIO CIERRE</td>
  <td class=xl8832513 width=117 style='width:88pt'>VALOR DE MERCADO</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl8032513 style='height:13.5pt'></td>
  <td class=xl8032513></td>
  <td class=xl8932513>NAFTRAC</td>
  <td class=xl8232513>´02</td>
  <td class=xl10732513 x:num="<%=ntitnaftracs%>" x:fmla="=+(G24*(G20+G21-G22)/G25)"><span
  style='mso-spacerun:yes'>     </span><%=ntitnaftracs%> </td>
  <td class=xl8332513 align=right x:num="<%=preciotra%>"><%=preciotra%></td>
  <td class=xl9532513 x:num="<%=vactivos%>" x:fmla="=+E33*F33"><span
  style='mso-spacerun:yes'>    </span><%=vactivos%></td>
  <td class=xl8332513></td>
  <td class=xl8332513></td>
  <td class=xl8332513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8932513>&nbsp;</td>
  <td class=xl8232513></td>
  <td class=xl8032513></td>
  <td class=xl8332513></td>
  <td class=xl9532513></td>
  <td class=xl8332513></td>
  <td class=xl8332513></td>
  <td class=xl8332513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8932513>&nbsp;</td>
  <td class=xl8232513></td>
  <td class=xl8032513></td>
  <td class=xl8332513></td>
  <td class=xl9532513></td>
  <td class=xl8332513></td>
  <td class=xl8332513></td>
  <td class=xl8332513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr class=xl9832513 height=37 style='height:27.75pt'>
  <td height=37 class=xl9832513 style='height:27.75pt'></td>
  <td class=xl9832513></td>
  <td class=xl9932513 width=81 style='width:61pt'>CONTRATO</td>
  <td class=xl9932513 width=122 style='width:92pt'>SERIE</td>
  <td class=xl10032513 width=94 style='width:71pt'>CONTRATOS</td>
  <td class=xl10032513 width=92 style='width:69pt'>NOCIONAL<font
  class="font632513"><sup>3)</sup></font></td>
  <td class=xl10032513 width=117 style='width:88pt'>VALOR CONTABLE<font
  class="font632513"><sup>4)</sup></font></td>
  <td class=xl10132513></td>
  <td class=xl10132513></td>
  <td class=xl10132513></td>
  <td class=xl9832513></td>
  <td class=xl9832513></td>
  <td class=xl9832513></td>
  <td class=xl9832513></td>
  <td class=xl9832513></td>
  <td class=xl9832513></td>
  <td class=xl9832513></td>
 </tr>
 <tr height=18 style='height:13.5pt'>
  <td height=18 class=xl8032513 style='height:13.5pt'></td>
  <td class=xl8032513></td>
  <td class=xl8932513>&nbsp;</td>
  <td class=xl8232513></td>
  <td class=xl8032513></td>
  <td class=xl8332513></td>
  <td class=xl9532513></td>
  <td class=xl8332513></td>
  <td class=xl8332513></td>
  <td class=xl8332513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8332513>FUTURO IPC</td>
  <td class=xl8032513>IPC SP10</td>
  <td class=xl9032513 align=right x:num="1200">1,200</td>
  <td class=xl8032513></td>
  <td class=xl8232513 x:num>0</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8332513></td>
  <td class=xl9032513></td>
  <td class=xl8332513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl9032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8332513></td>
  <td class=xl8032513></td>
  <td class=xl9032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td align=left valign=top><!--[if gte vml 1]><v:shape id="Picture_x0020_32"
   o:spid="_x0000_s1133" type="#_x0000_t75" style='position:absolute;
   margin-left:71.25pt;margin-top:12pt;width:577.5pt;height:12.75pt;z-index:3;
   visibility:visible'>
   <v:imagedata src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image005.jpg"
    o:title=""/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    <x:CF>Bitmap</x:CF>
   </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:3;margin-left:95px;margin-top:16px;width:770px;
  height:17px'><img width=770 height=17
  src="ReporteCartera_archivos/Archivo%20Composicin%20de%20Cartera%20Final_32513_image009.jpg"
  v:shapes="Picture_x0020_32"></span><![endif]><span style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=17 class=xl8032513 width=98 style='height:12.75pt;width:74pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl8332513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8332513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl8032513 style='height:14.25pt'></td>
  <td class=xl10232513><sup>1)</sup></td>
  <td class=xl8032513 colspan=7>Los tenedores de los Certificados no tendrán
  derecho a la subcuenta de Gastos, de conformidad con lo dispuesto en la
  Cláusula XXX del Fideicomiso.</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl8032513 style='height:14.25pt'></td>
  <td class=xl10232513><sup>2)</sup></td>
  <td class=xl8032513 colspan=8
  x:str="El Valor Neto de los Activos se publicará de manera mensual el primer día hábil del mes con respecto al mes inmediatamente anterior y reflejará el valor neto ">El
  Valor Neto de los Activos se publicará de manera mensual el primer día hábil
  del mes con respecto al mes inmediatamente anterior y reflejará el valor
  neto<span style='mso-spacerun:yes'> </span></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl8032513 style='height:14.25pt'></td>
  <td class=xl10232513><sup></sup></td>
  <td class=xl8032513 colspan=5>contable de los activos del Fideicomiso
  correspondiente a cada Certificado</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl8032513 style='height:14.25pt'></td>
  <td class=xl10232513><sup>3)</sup></td>
  <td class=xl8032513 colspan=3>Definir el término del Valor Nocional</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl8032513 style='height:14.25pt'></td>
  <td class=xl10232513><sup>4)</sup></td>
  <td class=xl8032513 colspan=5>Falta incluir la definición contablemente
  correcta del valor contable de los Futuros</td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl9132513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl9132513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl9132513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl9232513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl9232513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl9132513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl9132513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl8032513 style='height:12.75pt'></td>
  <td class=xl8032513></td>
  <td class=xl9132513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
  <td class=xl8032513></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=21 style='width:16pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=81 style='width:61pt'></td>
  <td width=122 style='width:92pt'></td>
  <td width=94 style='width:71pt'></td>
  <td width=92 style='width:69pt'></td>
  <td width=117 style='width:88pt'></td>
  <td width=140 style='width:105pt'></td>
  <td width=237 style='width:178pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=80 style='width:60pt'></td>
 </tr>
 <![endif]>
</table>

</div>


<!----------------------------->
<!--FINAL DE LOS RESULTADOS DEL ASISTENTE PARA PUBLICAR COMO PÁGINA WEB DE
EXCEL-->
<!----------------------------->
</body>

<%
}
else
{
%>

<font size=5 face="Arial">No hay registros para los parámetros de consulta</font>

<%
}
%>
</html>
