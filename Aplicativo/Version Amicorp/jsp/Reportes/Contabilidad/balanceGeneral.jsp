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
try
	{
  
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    String sNumFideicomiso ="";    
    BigDecimal iNumUsuario = new BigDecimal(0);    
    BigDecimal iCveCuenta = new BigDecimal(0);    
    BigDecimal iFolio = new BigDecimal(0);   
    BigDecimal iEsEtiqueta = new BigDecimal(0);   
    BigDecimal dValorDato = new BigDecimal(0);   
    BigDecimal dordenDato = new BigDecimal(0);   
    BigDecimal valorDatoTemp= new BigDecimal(0);
    String sValorLogicoTemp="";
    String sNombreImpresoTemp="";
    String sNombreAgrupacion="";
    String sNomUsuario="";
    String sCuenta="";    
    String sMotRechazo=""; 
    String sFideicomiso="";
    String sPeriodo="";
    String sNombreImpreso="";
    int iCtaOrden=0;

  
String fideicomiso="";
String periodo="";					

String mensaje="";	
String[] meses={" ","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};

//se valida si hay informacion en la tabla
  if(consulta.size()>0)
  {
    registro = (java.util.Map)consulta.get(0);
    sFideicomiso=(String)registro.get("refNomFideicomiso");
    sNumFideicomiso=(String)registro.get("refNumFideicomiso");
    sPeriodo=(String)registro.get("refPeriodoReporte");
    valida.setVtrIntDato1(Integer.valueOf(sNumFideicomiso).intValue());//numero de contrato
    valida.querySelect(10,"");

    if(valida.hasData())
      tipoAdmin=valida.getVtrStrDato1().trim();
        
    if(tipoAdmin.equals("SI"))
        {
        mensaje="El Reporte de Balance General<BR>No esta disponible<BR><BR>Para Fideicomisos con administración propia";
        }
  }
  else
  {
    mensaje="No esta disponible<BR>El Reporte de Balance General<BR>De "+sPeriodo;
  }
  //Valida si el fideicomiso tiene administracion propia o no
int j=0;
int contlineatotactivo=0;
int contlineatotpasivo=0;
%>

<html>
<%
boolean encabezado=false;
if(consulta.size()>0&&tipoAdmin.equals("NO"))
	{
  %>
<head>
<title>Estado de Posicion Financiera de <%=sPeriodo%> Fideicomiso: <%=(String)session.getValue( "Fideicomiso" )%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && balance.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">
<table width="960" border="0" align="center">
<tr><td><hr width="960" size="1"> </td></tr>
</table>


<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' >
		<tr>		
		<td>
			<table width='738'>
				<tr>
					<td align="CENTER" class='style15'><span class="style14">PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.</span></td>
				</tr>
				<tr>
					<td><div align='center' class='style15'>DIVISION FIDUCIARIA</div></td>
				</tr>
				<tr> 
    <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" colspan="7"> 
      <%=sFideicomiso%>
    </td>
    
  </tr>
  <tr> 
    <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" colspan="7">ESTADO DE POSICION FINANCIERA AL <%=sPeriodo%></td>
    
  </tr>
				<tr><td height='23'>&nbsp;</td></tr>
			</table>
		</td>
		<td>
			<table> 
				<tr>
					<td width='151' height='91' rowspan='7'><div align='center'><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div></td>
					
				</tr>
			</table>
		</td>
		</tr>
		</table>

<table width="960" border="0" align="center">
<tr><td><hr width="960" size="1"> </td></tr>
</table>

    
<table width="960" border="0" align="center">
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;" >
    <td align="center" colspan="8">&nbsp;</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;" > 
    <td align="center" colspan="8">(Importe en Pesos)</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td align="center" width="50%" colspan="4">ACTIVO</td>
    <td align="center" width="50%" colspan="4">PASIVO Y PATRIMONIO</td>
  </tr>
</table>


<table width="960" border="0" align="center">
  <tr style="font-family: Arial;	font-size: 9px;color: #000000;" > 
  <td width="48%">
  <table width="480" border="0" align="center">  
  <%
  //SE INCORPORAN LOS DATOS DEL ESTADO FINANCIERO  
      for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
        registro = (java.util.Map)consulta.get(i); 
        sNombreAgrupacion=(String)registro.get("facoNombreAgrupacion");
        dordenDato=(BigDecimal)registro.get("refOrdenDato");                
        iEsEtiqueta=(BigDecimal)registro.get("refEtiqueta");
        sNombreImpreso=(String)registro.get("facuNombreImpreso");
        dValorDato=(BigDecimal)registro.get("refValorDato");        
	%>
  <%if(sNombreAgrupacion.indexOf("ACTIVO")>=0){//INICIO DE ACTIVO%>
    <%if(iEsEtiqueta.intValue()==1){//IDENTIFICANDO SUBTITULOS%>
          <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
          <td align="left" width="30%"><%=sNombreImpreso%></td>
          <td align="right" width="18%"></td>
          </tr>              
    <%
    }//FIN DE SECCION DE DETALLE
    else if(iEsEtiqueta.intValue()==0&&dValorDato.intValue()!=0&&sNombreAgrupacion.indexOf("TOTAL")>=0&&sNombreAgrupacion.indexOf("TOTAL ACTIVO")<0){//SECCION DE TOTALES%>  
          <tr style="font-family: Arial;	font-size: 9px;color: #000000;" >         
            <td width="30%" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=sNombreImpreso!=null?sNombreImpreso:"&nbsp;"%></td>
            <td align="right" width="18%" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
            <table>
              <tr>
                <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">-------------------------</td>
              </tr>
              <tr>
                <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=dValorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", dValorDato):"&nbsp;"%></td>
              </tr>
            </table>  
            </td>
          </tr>
        <%
    }//FIN SECCION DE TOTALES
    else if (iEsEtiqueta.intValue()==0&&dValorDato.intValue()!=0&&sNombreAgrupacion.compareToIgnoreCase("TOTAL")<0){//SECCION DE DETALLE%>  
          <tr style="font-family: Arial;	font-size: 9px;color: #000000;" >         
            <td width="30%" ><%=sNombreImpreso!=null?sNombreImpreso:"&nbsp;"%></td>
            <td align="right" width="18%">
            <table>
              <tr>
                <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:"></td>
              </tr>
              <tr>
                <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:"><%=dValorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", dValorDato):"&nbsp;"%></td>
              </tr>
            </table>  
            </td>
          </tr>
        <%
    }//FIN SECCION DE TOTALES    
    %>
  <%}//FIN DE ACTIVO%>  
  <%       
	}
  
  %>
  </table>
  </td>
  <td width="48%">
      <table width="480" border="0" align="center">  
        <%//INICIO DE PASIVO
            for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
                registro = (java.util.Map)consulta.get(i); 
                sNombreAgrupacion=(String)registro.get("facoNombreAgrupacion");
                iEsEtiqueta=(BigDecimal)registro.get("refEtiqueta");
                sNombreImpreso=(String)registro.get("facuNombreImpreso");
                dValorDato=(BigDecimal)registro.get("refValorDato");             
        %>
                <%if(sNombreAgrupacion.indexOf("PASIVO")>=0){//INICIO DE PASIVO%>
                    <%if(iEsEtiqueta.intValue()==1){//IDENTIFICANDO SUBTITULOS%>
                          <tr style="font-family: Arial;	font-size: 9px;color: #000000;" > 
                              <td width="30%"><%=sNombreImpreso%></td>
                              <td align="right" width="18%"></td>
                              <td align="right" width="18%"></td>
                          </tr>              
                    <%
                    }//FIN DE SECCION DE DETALLE
                else if(iEsEtiqueta.intValue()==0&&dValorDato.intValue()!=0&&sNombreAgrupacion.indexOf("TOTAL")>=0&&sNombreAgrupacion.indexOf("TOTAL PASIVO")<0){//SECCION DE TOTALES%>  
                          <tr style="font-family: Arial;	font-size: 9px;color: #000000;" >         
                              <td width="30%" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=sNombreImpreso!=null?sNombreImpreso:"&nbsp;"%></td>
                              <td width="20%">&nbsp;</td> 
                              <td align="right" width="18%" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
                                  <table>
                                        <tr>
                                          <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">-------------------------</td>
                                        </tr>
                                        <tr>
                                          <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=dValorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", dValorDato):"&nbsp;"%></td>
                                        </tr>
                                  </table>  
                              </td>
                        </tr>
        <%
              }//FIN SECCION DE TOTALES 
              else if (iEsEtiqueta.intValue()==0&&dValorDato.intValue()!=0&&sNombreAgrupacion.compareToIgnoreCase("TOTAL")<0){//SECCION DE DETALLE
                          if (i<consulta.size()-1){
                              registro = (java.util.Map)consulta.get(i+1);
                              valorDatoTemp= new BigDecimal(0);
                              sValorLogicoTemp=(String)registro.get("facoNombreAgrupacion");
                              if(sValorLogicoTemp.indexOf("COMP PASIVO "+sNombreAgrupacion)>=0){
                                    i++;
                                    valorDatoTemp=(BigDecimal)registro.get("refValorDato");
                              }
                              else
                                    sValorLogicoTemp="";
                          }
                          if(!sValorLogicoTemp.equalsIgnoreCase("")&&(dValorDato.intValue()!=0||valorDatoTemp.intValue() != 0)){%>  
                              <tr style="font-family: Arial;	font-size: 9px;color: #000000;" >         
                                <td width="30%" ><%=sNombreImpreso!=null?sNombreImpreso:"&nbsp;"%></td>
                                <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:"><%=valorDatoTemp.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", valorDatoTemp):"&nbsp;"%></td>
                                <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:"><%=dValorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", dValorDato):"&nbsp;"%></td>
                              </tr>
                        <%}
                          else if(sValorLogicoTemp.equalsIgnoreCase("")&&dValorDato.intValue()!=0){%>
                               <tr style="font-family: Arial;	font-size: 9px;color: #000000;" >         
                                  <td width="30%" ><%=sNombreImpreso!=null?sNombreImpreso:"&nbsp;"%></td>
                                  <td>&nbsp;</td>
                                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:"><%=dValorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", dValorDato):"&nbsp;"%></td>
                              </tr>
                        <%}%>
<%}//FIN SECCION DE TOTALES%>
  <%}//FIN DE ACTIVO%>  
<%}%>
  </table>  
  </td>
  </tr>
</table>

<table width="960" border="0" align="center">
  <%
      for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
        registro = (java.util.Map)consulta.get(i); 
        sNombreAgrupacion=(String)registro.get("facoNombreAgrupacion");
        iEsEtiqueta=(BigDecimal)registro.get("refEtiqueta");
        sNombreImpreso=(String)registro.get("facuNombreImpreso");
        dValorDato=(BigDecimal)registro.get("refValorDato"); 
        
        if(sNombreAgrupacion.indexOf("TOTAL ACTIVO")>=0){
	%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td align="center" width="25%" colspan="4"><%=sNombreImpreso!=null?sNombreImpreso:"&nbsp;"%></td>
    <td>
    <table>
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">-------------------------</td>
                </tr>
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" width="25%" colspan="4"><%=dValorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", dValorDato):"&nbsp;"%></td>
                </tr>
              </table>  
    </td>
    <%for(int h = i+1; h < consulta.size(); h++) {
        registro = (java.util.Map)consulta.get(h);
        valorDatoTemp= new BigDecimal(0);
        sNombreImpresoTemp="";
        sValorLogicoTemp=(String)registro.get("facoNombreAgrupacion");    
       if(sValorLogicoTemp.indexOf("TOTAL PASIVO")>=0){
        valorDatoTemp=(BigDecimal)registro.get("refValorDato");
        sNombreImpresoTemp=(String)registro.get("facuNombreImpreso");
        %>
        <td align="center" width="25%" colspan="4"><%=sNombreImpresoTemp!=null?sNombreImpresoTemp:"&nbsp;"%></td>
        <td>
    <table>
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">-------------------------</td>
                </tr>
                <tr>
                  <td align="right" width="25%" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" colspan="4"><%=valorDatoTemp.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", valorDatoTemp):"&nbsp;"%></td>
                </tr>
              </table>  
    </td>   
    <% 
       //break; 
       }
      }%>
  </tr>
    <%  
        //break;
        }  
    }%>
</table>

<%
    //SE VALIDA SI EXISTEN CUENTAS DE ORDEN PARA ESTE FIDEICOMISO
    for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
            registro = (java.util.Map)consulta.get(i);
            sNombreAgrupacion=(String)registro.get("facoNombreAgrupacion");
            if(sNombreAgrupacion.indexOf("CUENTAS DE ORDEN")>=0){
              iCtaOrden++;
              break;
            }  
    }
    
if(iCtaOrden>0){%>

<table width="960" border="0" align="center">
  <tr>
       <td colspan="4">&nbsp;</td>
  </tr>
  <tr>
       <td colspan="4">&nbsp;</td>
  </tr>
  <tr>
       <td colspan="4">&nbsp;</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td align="center" colspan="4">CUENTAS DE ORDEN</td>
  <%
      for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
        registro = (java.util.Map)consulta.get(i); 
        sNombreAgrupacion=(String)registro.get("facoNombreAgrupacion");
        iEsEtiqueta=(BigDecimal)registro.get("refEtiqueta");
        sNombreImpreso=(String)registro.get("facuNombreImpreso");
        dValorDato=(BigDecimal)registro.get("refValorDato"); 
        
        if(sNombreAgrupacion.indexOf("CUENTAS DE ORDEN")>=0){
           if(dValorDato.intValue() != 0) {
	%>
  <tr style="font-family: Arial;	font-size: 9px;color: #000000;" > 
    <td align="center" width="25%">&nbsp;</td>
    <td align="left" width="25%"><%=sNombreImpreso!=null?sNombreImpreso:"&nbsp;"%></td>
    <td align="right" width="25%"><%=dValorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", dValorDato):"&nbsp;"%></td>
    <td align="center" width="25%">&nbsp;</td>    
  </tr>
    <%  }
          }
    }%>
</table>
<%}//FIN DE IF DE TITULO%>
<table width="960" border="0"  align="center">
  <tr><td>&nbsp;</td></tr>
  <tr><td>&nbsp;</td></tr>
  <tr><td>&nbsp;</td></tr>
  <tr style="font-family: Arial;	font-size: 9px;color: #000000;" > 
    <td align="center"><p align="justify">&nbsp;</p></td>
  </tr>
</table>
		     
<table width="960" border="0"  align="center">
    <tr  >
    <td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" colspan="8">&nbsp;</td>
  </tr>
  <tr  > 
    <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;"  width="50%">&nbsp;</td>
    <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;"  width="50%"><img src="../../../imagenes/THARTI.jpg" width="206" height="71" ></td>    
  </tr>
  <tr  > 
    <td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" width="50%">	
      Delegado Fiduciario</td>
    <td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" width="50%">	
      C.P. Contador General</td>
      
  </tr>


  <tr  >
    <td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" colspan="8">&nbsp;</td>
  </tr>
</table>


<%
}
else
	{%>
<table width="447" align="center">
  <tr>
    <td height="19" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="439" height="19" >&nbsp;</td>
  </tr>
  <tr> 
    <td height="19" style="font-family: Arial, Helvetica, Verdana;	font-size: 14px;color: #006699;font-weight: bold;" align="center"> 
		<%=mensaje%>    
    </td>
  </tr>
  <tr> 
    <td align="center">&nbsp;</td>
  </tr>
  <tr> 
    <td align="center"><input type="button" name="Cerrar" value="Cerrar" onClick="window.close();" style="background: #006699; border: 1px solid #000066; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px; color: #FFFFFF; font-weight: normal;"></td>
  </tr>
</table>
	<%}%>

<%}
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
    <td  align="center" height="19" style="font-family: Arial, Helvetica, Verdana;	font-size: 14px;color: #006699;font-weight: bold;">Reporte Estado de Posicion Financiera: Error:<%=e%></td>
  </tr>
  <tr> 
    <td align="center">&nbsp;</td>
  </tr>
 
</table>

<%}%>
</body>
</html>