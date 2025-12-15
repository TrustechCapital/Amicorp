<!--
/*
  @Autor:Inscitech
  @Creado: Junio 2008
*/
-->

<%@ page import="java.text.*,java.util.*,java.lang.*,java.io.*,java.sql.*"%>
<jsp:useBean id="balance" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="valida" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="cuentas" class="com.nafin.negocio.balanceFormulas"/>

<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="repEdoFinan"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="datEdoFinan" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="nFid" class="com.nafin.negocio.nFiducia"/>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%

DecimalFormat decFormat = new DecimalFormat("###,###,###,###,###,###,###,##0.00");
String[] bitacora = new String[5];

String fechaCont=BD.getFecha();
String folioBit="";
int regBitacora=0;
String tipoAdmin="";

try
	{
  
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendr�n los elementos de cada tupla
    
    String cgr_id_folio = "";
    //BigDecimal cgr_tipo_reporte = new BigDecimal(0);
	  String cgr_fideicomiso = "";
    String cgr_credito = "";
    String cgr_num_disposicion = "";
    String cgr_reporte = "";
    String cgr_dato1 = "";
    String cgr_dato2 = "";
    String cgr_dato3 = "";
    String cgr_dato4 = "";
    String cgr_dato5 = "";
    String cgr_dato6 = "";
    String cgr_dato7 = "";
    String cgr_dato8 = "";
    String cgr_dato9 = "";
    String cgr_dato10 = "";
    String cgr_dato11 = "";
    String cgr_dato12 = "";
    String cgr_dato13 = "";
    String cgr_dato14 = "";
    String cgr_fecha = "";
    String cgr_nombre_autoriza1 = "";
    String cgr_puesto_autoriza1 = "";
    String cgr_institucion_autoriza1 = "";
    String cgr_firma1 = "";

  
String fideicomiso="";
String periodo="";					

String mensaje="";	
String[] meses={" ","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};

//se valida si hay informacion en la tabla
  if(consulta.size()>0)
  {
    registro = (java.util.Map)consulta.get(0);
    
    cgr_id_folio =  (String)registro.get("cgrIdFolio");

	  cgr_fideicomiso = (String)registro.get("cgrFideicomiso");
    cgr_credito = (String)registro.get("cgrCredito");
    cgr_num_disposicion = (String)registro.get("cgrNumDisposicion");
    cgr_reporte = (String)registro.get("cgrReporte");
    cgr_dato1 = (String)registro.get("cgrDato1");
    cgr_dato2 = (String)registro.get("cgrDato2");
    cgr_dato3 = (String)registro.get("cgrDato3");
    cgr_dato4 = (String)registro.get("cgrDato4");
    cgr_dato5 = nFid.convertNumberToLetter(cgr_dato4);
    cgr_dato6 = (String)registro.get("cgrDato6");
    cgr_dato7 = (String)registro.get("cgrDato7");
    cgr_dato8 = (String)registro.get("cgrDato8");
    cgr_dato9 = (String)registro.get("cgrDato9");
    cgr_dato10 = (String)registro.get("cgrDato10");
    cgr_dato11 = (String)registro.get("cgrDato11");
    cgr_dato12 = (String)registro.get("cgrDato12");
    cgr_dato13 = (String)registro.get("cgrDato12");
    cgr_dato14 = (String)registro.get("cgrDato14");
    cgr_fecha = (String)registro.get("cgrFecha");
    cgr_nombre_autoriza1 = (String)registro.get("cgrNombreAutoriza1");
    cgr_puesto_autoriza1 = (String)registro.get("cgrPuestoAutoriza1");
    cgr_institucion_autoriza1 = (String)registro.get("cgrInstitucionAutoriza1");
    cgr_firma1 = (String)registro.get("cgrFirma1");
  }
%>

<html>
<head>
<title>Carta Garantias</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && balance.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">
<table width="90%" border="0" align="center">
<tr><td><!--<hr width="960" size="1">--> </td></tr>
</table>


<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' width="80%" align="center" >
		<tr>
			<td align=center>
        <!--<img src="<%=request.getContextPath()%>/imagenes/logo.jpg" >-->
      </td>
		</tr>
    <tr>
      <td align=right valign=bottom class="texto"> 
          <B>Mexico, D.F. a <%=cgr_fecha%></B>
      </td>
</tr>

</table>

<table width="960" border="0" align="center">
<tr><td><!--<hr width="960" size="1">--> </td></tr>
</table>

<br><br>


<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' width="75%" align="center" >
		<tr>
    <td class="texto" align="justify">


  <p align="justify">
  <b>
  <%=cgr_dato3%>
  <br>
  Presente
  </b>
</P>

<%
  int longitud4=cgr_dato4.indexOf(".");
  String centavos_dato4=(longitud4!=-1)?cgr_dato4.substring(longitud4+1,cgr_dato4.length()):"00";


  %>
  
  <p align="justify">
  En  relaci�n al contrato de Fideicomiso de Garantia y Fuente Alterna de Pago numero <b><%=cgr_fideicomiso%></b> celebrado con su representada en su caracter de Fideicomitente, esta <b><%=cgr_dato1%>, <%=cgr_dato2%></b>,
  informa que se ha liberado la <b>Constancia Fiduciaria <%=cgr_dato8%></b>, la cual ampara los recursos fideicomitidos hasta por la cantidad de <b>$<%=cgr_dato4%> M.N.(<%=cgr_dato5%> <%=centavos_dato4%>/100 M.N.)</b>
  </p>
  
  <!--<p align="justify">
    Los recursos antes referidos se han depositado en la cuenta de cheques No. <b><%=cgr_dato6%></b> en <b><%=cgr_dato7%></b>, de conformidad a lo instruido por el Comit� T�cnico 
    del Fideicomiso.
  </p>-->
        
    </td>
	</tr>
</table>

    
<br><br><br>

<table width="400" border="0"  align="center" class="texto">
  <tr>
    <td align="center">Atentamente</td>
  </tr>
  <tr> 
    <td align="center" style="font-family: Arial;color: #000000;">	
      <b><%=cgr_nombre_autoriza1%></b>
    </td>
  </tr>
  <tr> 
    <td align="center" style="font-family: Arial;	color: #000000;height:150">
      <!--<img src="<%=request.getContextPath()%>/<%=cgr_firma1%>">-->
    </td>
  </tr>
  
  <tr  > 
    <td align="center" style="font-family: Arial;color: #000000;">	
      <b><%=cgr_puesto_autoriza1%> de <%=cgr_dato1%>, <%=cgr_dato2%></b>
    </td>
    
  </tr>
  <tr>
    <td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" colspan="2">&nbsp;</td>
  </tr>
</table>



<br><br><br><br>


<!--
<br><br><br><br><br>
<table width="960" border="0" align="center">
<tr><td><hr width="960" size="1"> </td></tr>
</table>
<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' align="center" >
  <tr>
    <td align=center valign=bottom class="texto"> 
      <p align="justify">
      Edificio Corporativo Altavista Blvd. Adolfo L�pez Mateos No. 379  3-B
      Col. San �ngel Inn  Deleg. �lvaro Obreg�n C.P. 01060, M�xico, D.F. Tel. 5595-8382
      </p>
      
    </td>
  </tr>
</table>
-->
<%


}
catch(Exception e)
	{
System.out.println(" Reporte Estado de Posicion Financiera: \nError:"+e);
	%>

	<table width="447" align="center">
  <tr>
    <td height="19">&nbsp;</td>
  </tr>
  <tr> 
    <td width="439" height="19">&nbsp;</td>
  </tr>
  <tr> 
    <td  align="center" height="19" style="font-family: Arial, Helvetica, Verdana;	font-size: 14px;color: #006699;font-weight: bold;">CARTA: Error:<%=e%></td>
  </tr>
  <tr> 
    <td align="center">&nbsp;</td>
  </tr>
 
</table>

<%}%>
</body>
</html>

<style>
.texto {  
		font-family: calibri,arial, helvetica, sanserif; 
		color: #000000; 
		font-size: 14px;  
		font-weight: normal; 
    }

</style>