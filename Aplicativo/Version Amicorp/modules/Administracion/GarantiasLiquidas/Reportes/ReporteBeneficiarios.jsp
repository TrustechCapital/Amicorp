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

String[] bitacora = new String[5];
String fechaCont=BD.getFecha();
String folioBit="";
int regBitacora=0;
String tipoAdmin="";

    NumberFormat nf = NumberFormat.getInstance();
    List consulta = (List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    Map registro = null;
    
    
    //Variables que contendrán los elementos de cada tupla
    String fideicomiso ="";   
    String credito ="";   
    String disposicion ="";   
    String secuencial ="";   
    String beneficiario ="";  
    String rfcCurp ="";   
    String nomBeneficiario ="";   
    String pjegarantia ="";   
    String impGarantia ="";  
    String impCredito ="";   
    String impGarantiaLib ="";   
    String impIntereses ="";  
    
    String institucion = "";
    String productoCredito = "";
    
    double timpGarantia =.00;  
    double timpCredito =.00;     
    double timpGarantiaLib =.00;   
    double timpIntereses =.00;  
    
    int tipoReporte = Integer.parseInt(request.getParameter("tipoReporte").toString());
    
    /* 
      tipoReporte = 1;//reportes individuales
      tipoReporte = 2;//reporte general
      tipoReporte = 3;//reporte individual
    */       
%>

<html>
<head>
<title>Estado de Cuenta Individual</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && balance.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">

<table border='0'  align = "center" bordercolor='#000000' bgcolor='#FFFFFF'>
    <tr>
      <td height='23' colspan=2><hr></td></tr>
    <tr>
    <tr>	
      <td colspan=2 align="CENTER" style="font-family: Arial;	font-size: 18px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_1")%><br><%=session.getAttribute("empresa_2")%></td>
		</tr>
    <tr>
      <td height='23' colspan=2><hr></td></tr>
    <tr>
			<td><div align='center' style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;">ESTADO DE CUENTA <%=tipoReporte!=2?"INDIVIDUAL":""%></div></td>
      <td  valign="top" align="right"><img height="60" src="<%=request.getContextPath()%>/imagenes/logo.jpg" ></td>
		</tr>
</table>	
	<%
           if(consulta.size()>0) 
           {  //Para cada registro
              
              registro = (java.util.Map)consulta.get(0); 
              
              fideicomiso =(String)registro.get("glbeIdFideicomiso");  
              credito =(String)registro.get("glbeIdCredito");  
              disposicion =(String)registro.get("glbeIdDisposicion");  
              institucion =(String)registro.get("fidNomFideicom");  
              productoCredito = (String)registro.get("fcreProductoCredito");
              
              secuencial =(String)registro.get("glbeIdSecuencial");  
              beneficiario =(String)registro.get("glbeIdBeneficiario");  
              rfcCurp =(String)registro.get("glbeRfcCurp");  
              nomBeneficiario =(String)registro.get("glbeNombreBen");  
          }
              
  %>
                  <br>
                  <hr width="900" >
                  
                  <table   border="0" align="center" style="font-family: Arial;	font-size: 14px;color: #000000;">
                      <tr>
                          <td align="center"  style="font-size: 18px;"><b><%=fideicomiso%></b></td>
                      </tr>
                  </table>
                  <hr width="900" >
                  
                  <table  width =900 border="0" align="center" style="font-family: Arial;	font-size: 16px;color: #000000;">
                      <tr>
                          <td align="center" colspan =5>&nbsp;</td>
                      </tr>
        <%
        if(tipoReporte==2)//reporte general
        {
        %>
                              <tr>
                                  <td align="left" >Crédito</td>
                                  <td align="right"  ><b><%=credito%></b></td>
                                  <td align="center" width=5%>&nbsp;</td>
                                  <td align="left">Producto</td>
                                  <td align="right" ><b><%=productoCredito%></b></td>
                              </tr>
                              <tr>
                                  <td align="left" >Disposición</td>
                                  <td align="right"  ><b><%=disposicion%></b></td>
                                  <td align="right" width=5%>&nbsp;</td>
                                  <td align="left">Institución</td>
                                  <td align="right" ><b><%=institucion%></b></td>
                              </tr>
                              <tr>
                                  <td align="center" colspan =5><hr></td>
                              </tr>
                              <tr>
                                  <td align="center" colspan =5>&nbsp;</td>
                              </tr>
                              <tr>
                                   <td align="center" colspan =5>
                                   
                                      <table width="100%" cellpadding=4 cellspacing=0>
                                        <tr bgcolor="Silver" style="font-family: Arial;	font-size: 16px;color: #000000;">
                                          <td align="right"><b>ID</b></td>
                                          <td align="right" width=80><b>RFC</b></td>
                                          <td align="right"><b>No.</b></td>
                                          <td align="left" width=300><b>Nombre</b></td>
                                          <td align="right"><b>Porcentaje Garantía</b></td>
                                          <td align="right"><b>Importe Crédito</b></td>
                                          <td align="right"><b>Importe Garantía</b></td>
                                          <td align="right"><b>Importe Liberado</b></td>
                                          <td align="right"><b>Rendimientos</b></td>
                                        </tr>
                                      <%
                                         for(int i = 0; i < consulta.size(); i++) 
                                         {  //Para cada registro
                                            
                                            registro = (java.util.Map)consulta.get(i); 
                                              
                                            fideicomiso =(String)registro.get("glbeIdFideicomiso");  
                                            secuencial =(String)registro.get("glbeIdSecuencial");  
                                            
                                            beneficiario =(String)registro.get("glbeIdBeneficiario");  
                                            rfcCurp =(String)registro.get("glbeRfcCurp");  
                                            nomBeneficiario =(String)registro.get("glbeNombreBen");   
                                              
                                            pjegarantia =(String)registro.get("glbePjeGarantia");  
                                            impGarantia =(String)registro.get("glbeImpGarliq");  
                                            impCredito =(String)registro.get("glbeImpCredito");  
                                            impGarantiaLib =(String)registro.get("glbeImpGarliqLib");  
                                            impIntereses =(String)registro.get("glbeImpIntereses"); 
                                            
                                            timpGarantia = timpGarantia + Double.parseDouble(impGarantia.replaceAll(",",""));  
                                            timpCredito = timpCredito + Double.parseDouble(impCredito.replaceAll(",",""));  
                                            timpGarantiaLib = timpGarantiaLib + Double.parseDouble(impGarantiaLib.replaceAll(",",""));  
                                            timpIntereses = timpIntereses + Double.parseDouble(impIntereses.replaceAll(",",""));
                                      %>
                                        <tr style="font-family: Arial;	font-size: 14px;color: #000000;">
                                          <td align="right"><%=beneficiario%></td>
                                          <td align="right"><%=rfcCurp%></td>
                                          <td align="right"><%=secuencial%></td>
                                          <td align="left"><%=nomBeneficiario%></td>
                                          <td align="right"><%=pjegarantia%></td>
                                          <td align="right"><%=impCredito%></td>
                                          <td align="right"><%=impGarantia%></td>
                                          <td align="right"><%=impGarantiaLib%></td>
                                          <td align="right"><%=impIntereses%></td>
                                        </tr>
                                      <%
                                         }        
                                      %>
                                        <tr>
                                           <td align="right" colspan=9>&nbsp;</td>
                                        </tr>
                                        <tr >
                                          <td align="right" colspan=4>&nbsp;</td>
                                          <td align="right" colspan=5><hr></td>
                                        </tr>
                                        <tr>
                                          <td align="right">&nbsp;</td>
                                          <td align="right">&nbsp;</td>
                                          <td align="right">&nbsp;</td>
                                          <td align="right">&nbsp;</td>
        <%
        }
        else//reportes individuales
        {
        %>
                              <tr>
                                  <td align="left" >ID Beneficiario</td>
                                  <td align="right" width="50" ><b><%=beneficiario%></b></td>
                                  <td align="center" width=5%>&nbsp;</td>
                                  <td align="left">RFC del Beneficiario</td>
                                  <td align="right" ><b><%=rfcCurp%></b></td>
                              </tr>
                              <tr>
                                  <td align="left" >Número de Beneficiario</td>
                                  <td align="right" width="50" ><b><%=secuencial%></b></td>
                                  <td align="center" width=5%>&nbsp;</td>
                                  <td align="left">Nombre del Beneficiario</td>
                                  <td align="right" ><b><%=nomBeneficiario%></b></td>
                              </tr>
                              <tr>
                                  <td align="center" colspan =5><hr></td>
                              </tr>
                              <tr>
                                  <td align="center" colspan =5>&nbsp;</td>
                              </tr>
                              <tr>
                                   <td align="center" colspan =5>
                                   
                                      <table width="100%" cellpadding=0 cellspacing=0>
                                        <tr bgcolor="Silver" style="font-family: Arial;	font-size: 16px;color: #000000;">
                                          <td align="right"><b>Crédito</b></td>
                                          <td align="right"><b>Disposición</b></td>
                                          <td align="right"><b>Porcentaje Garantía</b></td>
                                          <td align="right"><b>Importe Crédito</b></td>
                                          <td align="right"><b>Importe Garantía</b></td>
                                          <td align="right"><b>Importe Liberado</b></td>
                                          <td align="right"><b>Rendimientos</b></td>
                                        </tr>
                                      <%
                                         for(int i = 0; i < consulta.size(); i++) 
                                         {  //Para cada registro
                                            
                                            registro = (java.util.Map)consulta.get(i); 
                                              
                                            credito =(String)registro.get("glbeIdCredito");  
                                            disposicion =(String)registro.get("glbeIdDisposicion");  
                                            pjegarantia =(String)registro.get("glbePjeGarantia");  
                                            impGarantia =(String)registro.get("glbeImpGarliq");  
                                            impCredito =(String)registro.get("glbeImpCredito");  
                                            impGarantiaLib =(String)registro.get("glbeImpGarliqLib");  
                                            impIntereses =(String)registro.get("glbeImpIntereses"); 
                                            
                                            timpGarantia = timpGarantia + Double.parseDouble(impGarantia.replaceAll(",",""));  
                                            timpCredito = timpCredito + Double.parseDouble(impCredito.replaceAll(",",""));  
                                            timpGarantiaLib = timpGarantiaLib + Double.parseDouble(impGarantiaLib.replaceAll(",",""));  
                                            timpIntereses = timpIntereses + Double.parseDouble(impIntereses.replaceAll(",",""));
                                      %>
                                        <tr>
                                          <td align="right"><%=credito%></td>
                                          <td align="right"><%=disposicion%></td>
                                          <td align="right"><%=pjegarantia%></td>
                                          <td align="right"><%=impCredito%></td>
                                          <td align="right"><%=impGarantia%></td>
                                          <td align="right"><%=impGarantiaLib%></td>
                                          <td align="right"><%=impIntereses%></td>
                                        </tr>
                                      <%
                                         }        
                                      %>
                                        <tr>
                                           <td align="right" colspan=7>&nbsp;</td>
                                        </tr>
                                        <tr >
                                          <td align="right" colspan=2>&nbsp;</td>
                                          <td align="right" colspan=5><hr></td>
                                        </tr>
                                        <tr>
                                          <td align="right">&nbsp;</td>
                                          <td align="right">&nbsp;</td>
        <%
        }
        %>
                                  <td align="right"><b>Totales</b></td>
                                  <td align="right"><%=nf.format(timpCredito)%></td>
                                  <td align="right"><%=nf.format(timpGarantia)%></td>
                                  <td align="right"><%=nf.format(timpGarantiaLib)%></td>
                                  <td align="right"><%=nf.format(timpIntereses)%></td>
                                </tr>
                              </table>
                           
                           </td>
                      </tr>
                      <tr>
                          <td align="center" colspan =6>&nbsp;</td>
                      </tr>
                      
                   </table>
</body>
</html>