<!--
/*
  @Autor:Inscitech
  @Creado: Junio 2008
*/
-->

<%@ page import="java.text.*,java.util.*,java.lang.*,java.io.*,java.sql.*"%>
<jsp:useBean id="balance" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="cuentas" class="com.nafin.negocio.balanceFormulas"/>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="repEdoFinan"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="datEdoFinan" class="com.nafin.negocio.nReporte"/>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%

DecimalFormat decFormat = new DecimalFormat("###,###,###,###,###,###,###,##0.00");
String[] bitacora = new String[5];
String fechaCont=BD.getFecha();
String folioBit="";
int regBitacora=0;
String tipoAdmin="";
%>
<%
 
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    String fideicomiso ="";    
    String pizarra ="";    
    String serie ="";    
    int numfideicomiso = 0;   
    BigDecimal maxUnidades = new BigDecimal(0);    
    BigDecimal maxUnidadesCBP = new BigDecimal(0);    
    BigDecimal maxUnidadesCB = new BigDecimal(0);    
    int cveOperacion=0;
    BigDecimal casaBolsa=new BigDecimal(0);
    String scveOperacion="";
    String scasaBolsa="";
    String fecha="";
    String mensaje= "";
    int solicitadas= 0; 
    int asignadas= 0;  
    int tsolicitadas= 0; 
    int tasignadas= 0;  
    int totalMovtos= 0;    
    BigDecimal noNaftracs= new BigDecimal(0);    
    boolean checknaftrac = (request.getParameter("checknaftrac").equals("true")?true:false);
    String antscveOperacion = "";
    
    String cadTotales = "";
    cadTotales += "<table   border='0' align='center'>";
    cadTotales += "          <tr>";
    cadTotales += "            <td align='center'>&nbsp;</td>";
    cadTotales += "            <td align='center' colspan=2><hr></td>";
    cadTotales += "            <td align='center'>&nbsp;</td>";
    cadTotales += "          </tr>";
    cadTotales += "          <tr style='font-family: Arial;	font-size: 13px;color: #000000;'>";
    cadTotales += "            <td align='right' width='300' ></td>";
    cadTotales += "            <td align='left' width='150' ><b>TOTAL leyenda</b></td>";      
    cadTotales += "            <td align='right' width='150' >totalAsignadas</td>"; 
    if(checknaftrac)
    {
      cadTotales += "           <td  align='right' width='150' >&nbsp;</td>";
    }
    cadTotales += "          </tr>";
    cadTotales += "    </table>";
    
//se valida si hay informacion en la tabla
  if(consulta.size()>0)
  {
    registro = (java.util.Map)consulta.get(0);
    fecha=(String)registro.get("trnStringFecha");
  }
  else
  {
    mensaje="No hay datos para esta fecha ";
  }

%>

<html>
<head>
<title>Reporte Creaciones y Redenciones</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && balance.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">
<table width="960" border="0" align="center">
<tr><td><hr width="960" size="1"> </td></tr>
</table>


<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' >
		<tr>		
		<td>
			<table width='960'>
				<tr>
					<td align="CENTER"  style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_1")%></td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Verdana, Arial, Helvetica;	font-size: 12px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_2")%></div></td>
				</tr>
        <tr><td height='23'>&nbsp;</td></tr>
				<tr>
					<td><div align='center' style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;">Reporte de Creaciones y Redenciones</div></td>
				</tr>
				
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">AL DIA <%=fecha%></td></tr>
			</table>
		</td>
		<td>
			<table> 
				<tr>
					<td width='151' height='91' rowspan='7' valign="top" align="center"><img src="<%=request.getContextPath()%>/imagenes/logo.jpg" ></td>					
				</tr>
			</table>
		</td>
		</tr>
		</table>	
	<%
           for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
              
              registro = (java.util.Map)consulta.get(i); 
              
              fideicomiso =(String)registro.get("trnIdNomFiso");  
              int antnumfideicomiso = numfideicomiso;
              numfideicomiso = Integer.parseInt(DecimalFormatUtils.getFormatedNumber("####", (BigDecimal)registro.get("trnIdFiso"))); 
              pizarra =(String)registro.get("temIdSerie");    
              serie =(String)registro.get("temIdPizarra");    
              
              maxUnidades = (BigDecimal)registro.get("temMaxUnidadesDia");  
              maxUnidadesCBP = (BigDecimal)registro.get("temMaxUnidadesCbp");  
              maxUnidadesCB = (BigDecimal)registro.get("temMaxUnidadesCb"); 
              int antcveOperacion = cveOperacion;
              cveOperacion=Integer.parseInt(DecimalFormatUtils.getFormatedNumber("####", (BigDecimal)registro.get("trnIdTipoOpe")));
              casaBolsa=(BigDecimal)registro.get("trnIdCasaBolsa");
              scasaBolsa=(String)registro.get("trnNomCasaBolsa");
              antscveOperacion = scveOperacion;
              scveOperacion= cveOperacion==1?"CREACIONES":"REDENCIONES";
              solicitadas= Integer.parseInt(DecimalFormatUtils.getFormatedNumber("####", (BigDecimal)registro.get("trnNumUnidadesSol")));
              asignadas= Integer.parseInt(DecimalFormatUtils.getFormatedNumber("####", (BigDecimal)registro.get("trnNumUnidadesAsi")));
              noNaftracs= (BigDecimal)registro.get("trnNumNaftracks"); 
              
              //DecimalFormatUtils.getFormatedNumber("###,###.00", um)
              
                 if(antnumfideicomiso!=numfideicomiso)
                 {
                  antcveOperacion = 0;
                    
                            if(tasignadas>0&&tsolicitadas>0)//totales
                             {
                                out.print(cadTotales.replaceAll("leyenda",antscveOperacion).replaceAll("totalAsignadas",String.valueOf(tasignadas)));
                             
                                tsolicitadas = 0;  
                                tasignadas = 0;  
                             }
                  %>
                  <br><br><br>
                  
                  <hr width="750" >
                  
                  <table   border="0" align="center" style="font-family: Arial;	font-size: 12px;color: #000000;">
                      <tr>
                          <td align="center"  style="font-size: 18px;"><b><%=fideicomiso%></b></td>
                      </tr>
                  </table>
                  <hr width="750" >
                  <table   border="0" align="center" style="font-family: Arial;	font-size: 12px;color: #000000;">
                   
                      <tr>
                          <td align="center" >
                          </td>
                      </tr>
                      <tr>
                          <td align="left" >
                          Máximo de Unidades por Día
                          </td>
                          <td align="right" width="50" >
                          <b><%=maxUnidades%></b>
                          </td>
                      </tr>
                      <tr>
                          <td align="left" >
                          Porcentaje Máximo por Casa de Bolsa
                          </td>
                          <td align="right" >
                          <b><%=maxUnidadesCBP%>%</b>
                          </td>
                      </tr>
                      <tr>
                          <td align="left" >
                          Máximo Unidades por Casa de Bolsa
                          </td>
                          <td align="right" >
                          <b><%=maxUnidadesCB%></b>
                          </td>
                      </tr>
                      <tr>
                          <td align="center" colspan=2><hr></td>
                      </tr>
                   </table>
                 <%
                 }
                 
                 if(antcveOperacion!=cveOperacion)
                 { 
                   if(tasignadas>0&&tsolicitadas>0)//totales
                   {
                      out.print(cadTotales.replaceAll("leyenda",antscveOperacion).replaceAll("totalAsignadas",String.valueOf(tasignadas)));
                   
                      tsolicitadas = 0;  
                      tasignadas = 0;  
                   }
                   
                  %>
                 <br>
                 <table   border="0" align="center"  style="font-family: Arial;	font-size: 13px;color: #000000;font-weight: bold;">
                  <tr>
                      <td align="left" width="300"><%=scveOperacion%></td>
                      <td align="right" width="150">&nbsp</td>
                      <td align="right" width="150">&nbsp</td>
                      <%if(checknaftrac){%>
                        <td align="right" width="150">&nbsp</td>
                      <%}%>
                  </tr>
                  <tr bgcolor="#CCCCCC">
                      <td align="left" width="300">Casa de Bolsa</td>
                      <td align="right" width="150">Unidades Solicitadas</td>
                      <td align="right" width="150">Unidades Asignadas</td>
                      <%if(checknaftrac){%>
                        <td align="right" width="150">NAFTRACs</td>
                      <%}%>
                  </tr>
                  </table>
                  <%
                    }
                  %>
                  <table   border="0" align="center">
                      <tr style="font-family: Arial;	font-size: 11px;color: #000000;">
                        <td align="left" width="300" ><%=scasaBolsa%></td>
                        <td align="right" width="150" ><%=solicitadas%></td>                
                        <td align="right" width="150" ><%=asignadas%></td>      
                        <%if(checknaftrac){%>
                          <td  align="right" width="150" ><%=noNaftracs%></td>
                        <%}%>
                      </tr>  
                  </table>
               
          <% 
                tsolicitadas= tsolicitadas + solicitadas;  
                tasignadas= tasignadas + asignadas;  
          } 
          %>
          
          <%
                  if(tasignadas>0&&tsolicitadas>0)//totales
                   {
                      out.print(cadTotales.replaceAll("leyenda",scveOperacion).replaceAll("totalAsignadas",String.valueOf(tasignadas)));
                   
                      tsolicitadas = 0;  
                      tasignadas = 0;  
                   }
                    
                    
          %>
         

</body>
</html>