<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<link rel="stylesheet" href="styles/nafin.css" type="text/css">
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  <body>
  
  <%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    String sColumna1="";
    String sTitular="";
    String sBanco="";
    String sClabe="";
    String sUltColumna="";    
    String sValColumna1="";
    String sValUltColumna="";
    String sNomReporte="";
    
    if(consulta.size()>0)
    {
      registro = (java.util.Map)consulta.get(0);
      sColumna1=(String)registro.get("rcbTitulo1aColumna");
      sUltColumna=(String)registro.get("rcbTituloUltColumna");
      sNomReporte=(String)registro.get("rcbReporte");
    }
  %>
  
  <table border="0" cellspacing="0" cellpadding="0">
  <tr><td td colspan="8">
  <table border='0' width='1200' bordercolor='#000000' bgcolor='#FFFFFF'>
 <tr>
      
        <td width='200' height='91'>&nbsp;</td>
      <td width='808'><tr><table >  
      <tr>
        <td width='808'>
          <div align='center' class='style15'>DIVISION FIDUCIARIA</div>
        </td>
      </tr>
      <tr>
        <td><div align='center' class='style15'>DIVISION FIDUCIARIA</div></td>
      </tr>
      
        <tr>
          <td><div align='center' class='style15'><span style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=sNomReporte%></span></div></td>
        </tr>
      <tr><td height='23'>&nbsp;</td></tr>
      
      </table></tr></td>
        <td width='151' height='91' rowspan='7'><div align='center'><img src='../../../imagenes/logo_bn.jpg' width='102' height='70'></div></td>
        
      </tr>
    </table>

  </td>
  </tr>
    <tr><td colspan="8">&nbsp;</td></tr>
    <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
      <td width="200" align="center"><%=sColumna1%></td>
      <td width="600">TITULAR</td>
      <td width="20">&nbsp;</td>
      <td width="100">BANCO</td>
      <td width="250">CLABE</td>
      <td width="200"><%=sUltColumna%></td>
      <td width="60">&nbsp;</td>
      <td width="60">&nbsp;</td>
    </tr>
    <%if(consulta.size()>0){%>
    <tr><td colspan="8"><hr/></td></tr>
  <%  
    for(int i = 1; i < consulta.size(); i++) {  //Para cada registro
      registro = (java.util.Map)consulta.get(i);
      //Obtener datos de la BD
      sTitular = (String)registro.get("rcbTitular");
      sBanco = (String)registro.get("rcbBanco");
      sClabe = (String)registro.get("rcbClabe");
      sValColumna1=(String)registro.get("rcbVal1aColumna");
      sValUltColumna=(String)registro.get("rcbValUltColumna");
  %>
    <tr style="font-family: Arial;	font-size: 9px;color: #000000;">
      <td width="200" align="center"><%=sValColumna1%></td>
      <td width="600" ><%=sTitular%></td>
      <td width="20" >&nbsp;</td>
      <td width="100"><%=sBanco%></td>
      <td width="250"><%=sClabe%></td>
      <td width="200"><%=sValUltColumna%></td>
      <td width="60" >&nbsp;</td>
      <td width="60" >&nbsp;</td>
    </tr>
  <%
    }//Fin de las iteraciones para los registros
  }%>
  </table>
  
  </body>
</html>