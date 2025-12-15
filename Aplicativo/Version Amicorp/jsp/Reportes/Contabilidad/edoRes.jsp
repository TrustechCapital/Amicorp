<!--
/*
  @Autor:Inscitech
  @Creado: Junio 2008
*/
-->

<%@ page import="java.text.*,java.util.*,java.lang.*"%>
<jsp:useBean id="reporte" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="valida" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="edoRes" scope="page" class="com.nafin.negocio.edoResFormulas" />
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="repEdoFinan"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="datEdoFinan" class="com.nafin.negocio.nReporte"/>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>

<%
String[] bitacora = new String[5];
String fechaCont=BD.getFecha();
String folioBit="";
int regBitacora=0;

try
	{
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    java.util.Map registro = null;
    String sNumFideicomiso ="";
    String sFideicomiso="";
    String sPeriodo="";
    String sValorLogico="";
    String sValorLogicoTemp="";
    BigDecimal esEtiqueta= new BigDecimal(0); 
    BigDecimal numCol= new BigDecimal(0);
    BigDecimal valorDato= new BigDecimal(0);
    BigDecimal valorDatoTemp= new BigDecimal(0);
    String nomImpreso="";
    
    String tipoAdmin="";
    String mensaje="";	
    String[] meses={" ","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};
  //  int numFid=Integer.valueOf(request.getParameter("numFid")).intValue();
  //  int mes=Integer.valueOf(request.getParameter("mes")).intValue();
  //  int anio=Integer.valueOf(request.getParameter("anio")).intValue();

 if(consulta.size()>0)
  {
    registro = (java.util.Map)consulta.get(0);
    sFideicomiso=(String)registro.get("refNomFideicomiso");
    sNumFideicomiso=(String)registro.get("refNumFideicomiso");
    sPeriodo=(String)registro.get("refPeriodoReporte");
    valida.setVtrIntDato1(Integer.valueOf(sNumFideicomiso).intValue());//numero de contrato
    valida.setVtrIntDato1(Integer.valueOf(sNumFideicomiso).intValue());
    valida.querySelect(10,"");

    //String tipoAdmin="";
    if(valida.hasData())
      tipoAdmin=valida.getVtrStrDato1().trim();
        
    if(tipoAdmin.equals("SI"))
        {
        mensaje="El Reporte de Estado de resultados <BR>No esta disponible<BR><BR>Para Fideicomisos con administración propia";
        }
  }
  else
  {
    mensaje="No esta disponible<BR>El Reporte de Estado de resultados<BR>De "+sPeriodo;
  }

%>
<html>
<%if(tipoAdmin.equals("NO")){%>
<head>
<title>Estado de Resultados de <%=sPeriodo%> Fideicomiso: <%=(String)session.getValue( "Fideicomiso" )%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && reporte.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">


<table width="960" border='0' bordercolor='#000000' bgcolor='#FFFFFF' >
		<tr>		
		<td>
			<table width='860'>
				<tr>
					<td align="CENTER" style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_1")%></td>
				</tr>
				<tr>
					<td><div align='center'  style="font-family: Verdana, Arial, Helvetica;	font-size: 12px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_2")%></div></td>
				</tr>
				<tr>
        <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" colspan="7">ESTADO 
      DE RESULTADOS <%=sPeriodo%>&nbsp;</td>
      </tr>
      <tr>
        <td>
         &nbsp;
        </td>
       </tr>
      <tr><td height='23' align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=sFideicomiso%></td></tr>
			</table>
		</td>
		<td>
			<table> 
				<tr>
					<td width='151' height='91' rowspan='7'><div align='RIGHT'><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div></td>
					
				</tr>
			</table>
		</td>
		</tr>
		</table> 

	<table width="1176">
            <tr style="font-weight:bolder">
                <td width="20%">&nbsp;</td>
                <td width="18%">&nbsp;</td>
                <td width="63%"></td>
                
            </tr>
          </table>

    
<table width="960" border="0" align="center">
  <%
  //SE INCORPORAN LOS DATOS DEL ESTADO FINANCIERO
  int contlineagrupo=0;
  int contlineatotal=0;
 // datEdoFinan.setVtrIntDato1(Integer.valueOf(request.getParameter("numFid")).intValue());	
 // datEdoFinan.setVtrIntDato2(1);	  
 // datEdoFinan.querySelect(5,"");  
   for(int i = 0; i < consulta.size(); i++){ 
          registro = (java.util.Map)consulta.get(i);
          esEtiqueta = (BigDecimal)registro.get("refEtiqueta");
          numCol = (BigDecimal)registro.get("refNumColDato");
          valorDato = (BigDecimal)registro.get("refValorDato");
          nomImpreso=(String)registro.get("facuNombreImpreso");
          sValorLogico=(String)registro.get("facoNombreAgrupacion");
          if(esEtiqueta.intValue()==1&&sValorLogico.indexOf("MENOS")<0){//ES SUBTITULO  %>
              <tr align="left" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
              <td width="40%"><%=nomImpreso%></td>
              <td width="20%">&nbsp;</td>
              <td width="20%">&nbsp;</td>
              <td width="25%">&nbsp;</td>
              </tr>
        <%} else if (esEtiqueta.intValue()==1&&(sValorLogico.indexOf("MENOS")>=0)){%> 
              <tr align="left" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
              <td width="40%">&nbsp;</td>
              <td width="20%"><%=nomImpreso%></td>              
              <td width="20%">&nbsp;</td>
              <td width="25%">&nbsp;</td>  
        <%} else if (esEtiqueta.intValue()==0&&(sValorLogico.indexOf("SUBTOTAL")>=0)&&valorDato.intValue() != 0){%> 
              <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
              <td width="40%">&nbsp;</td>
              <td width="20%"><%=nomImpreso%></td>              
              <td width="20%">&nbsp;</td>
              <td align="right" width="25%">
              <table>
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">-------------------------</td>
                </tr>
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=valorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", valorDato):"&nbsp;"%></td>
                </tr>
              </table>  
              </td>
           <%} else if (esEtiqueta.intValue()==0&&(sValorLogico.indexOf("SUBTOTAL EGRESOS")>=0)){%> 
              <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
              <td width="40%">&nbsp;</td>
              <td width="20%"><%=nomImpreso%></td>              
              <td width="20%">&nbsp;</td>
              <td align="right" width="25%">
              <table>
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">-------------------------</td>
                </tr>
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", valorDato)%></td>
                </tr>
              </table>  
              </td>
        <%} else if (esEtiqueta.intValue()==0&&sValorLogico.indexOf("DEFICIENTE-REMANENTE")>=0&&valorDato.intValue() != 0){%> 
              <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
              <td width="40%">&nbsp;</td>
              <td width="20%">&nbsp;</td>              
              <td width="20%"><%=valorDato.intValue() >0? "RESULTADO NETO":"RESULTADO NETO"%></td>              
              <td width="25%">
              <table width="100%">
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">-------------------------</td>
                </tr>
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=valorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", valorDato):"&nbsp;"%></td>
                </tr>
              </table>   
              </td>
        <%} else {//ES DETALLE
        //se verifica que exista otro registro
          if (i<consulta.size()-1){
            registro = (java.util.Map)consulta.get(i+1);
            valorDatoTemp= new BigDecimal(0);
            sValorLogicoTemp=(String)registro.get("facoNombreAgrupacion");
            if(sValorLogicoTemp.indexOf("NEG "+sValorLogico)>=0){
              i++;
              valorDatoTemp=(BigDecimal)registro.get("refValorDato");
            }
            else
              sValorLogicoTemp="";
          }
          
          if(!sValorLogicoTemp.equalsIgnoreCase("")&&(valorDato.intValue()!=0||valorDatoTemp.intValue() != 0)){
        %>
            <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:" > 
            <td width="40%"><%=nomImpreso%></td>
            <td width="20%">&nbsp;</td>              
            <td align="right" width="20%">
              <table width="100%">
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=valorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", valorDato):"&nbsp;"%></td>
                </tr>
              </table>             
            </td>              
            <td align="right" width="25%">
              <table width="100%">
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=valorDatoTemp.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", valorDatoTemp):"&nbsp;"%></td>
                </tr>
              </table>             
            </td>
          <%}
           else if(sValorLogicoTemp.equalsIgnoreCase("")&&valorDato.intValue()!=0){%>  
            <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight:" > 
            <td width="40%"><%=nomImpreso%></td>
            <td width="20%">&nbsp;</td>              
            <td width="20%">&nbsp;</td>              
            <td align="right" width="25%">
              <table width="100%">
                <tr>
                  <td align="right" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=valorDato.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", valorDato):"&nbsp;"%></td>
                </tr>
              </table>              
            </td>           
          <%
           }
          }%>
   <%}%>
  
</table>  

<table width="960" border="0"  align="center">
  <tr style="font-family: Arial;	font-size: 9px;color: #000000;" > 
    <td align="center"><p align="center">&nbsp;</p></td>
  </tr>
</table>

<table width="960" border="0"  align="center">
    <tr  >
    <td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" colspan="8">&nbsp;</td>
  </tr>
  <tr  > 
    <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;"  width="50%">&nbsp;</td>
    <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;"  width="50%">&nbsp;</td>    
  </tr>
  <tr  > 
    <td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" width="50%">&nbsp;</td>
    <td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" width="50%">&nbsp;</td>      
  </tr>
  <tr  >
    <td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" colspan="8">&nbsp;</td>
  </tr>
</table>
<%}%>
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
    <td align="center"><input type="button" name="Cerrar" value="Cerrar" onClick="window.close();" style="background: #006699; border: 1px solid #000066; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9px; color: #FFFFFF; font-weight: normal;visibility:hidden"></td>
  </tr>
</table>
<%}
catch(Exception e)
	{
    System.out.println(" Reporte Estado de Resultados: \nError:"+e);
    %>
	<table width="447" align="center">
  <tr>
    <td height="19">&nbsp;</td>
  </tr>
  <tr> 
    <td width="439" height="19">&nbsp;</td>
  </tr>
  <tr> 
    <td  align="center" height="19" style="font-family: Arial, Helvetica, Verdana;	font-size: 14px;color: #006699;font-weight: bold;">Reporte Estado de Resultados: Error:<%=e%></td>
  </tr>
  <tr> 
    <td align="center">&nbsp;</td>
  </tr>
 
</table>

<%}%>
</body>
</html>