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
    
 //nuevos   
    BigDecimal numContrato= new BigDecimal(0);
    String nomContrato="";
    String Fecha="";
    BigDecimal folioOper= new BigDecimal(0);
    BigDecimal col1= new BigDecimal(0);
    BigDecimal col2= new BigDecimal(0);
    BigDecimal col3= new BigDecimal(0);
    BigDecimal col4= new BigDecimal(0);
    BigDecimal col5= new BigDecimal(0);
    String etiquetas="";
    int iCtaOrden=0;
    String FechaAnt="";

  
String fideicomiso="";
String periodo="";					

String mensaje="";	
String[] meses={" ","Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};

//se valida si hay informacion en la tabla
  if(consulta.size()>0)
  {
    registro = (java.util.Map)consulta.get(1);
    numContrato=(BigDecimal)registro.get("patiIdFideicomiso");
    nomContrato=(String)registro.get("patiNomFideicomiso");
    sPeriodo=(String)registro.get("patiIdFecha");
    

   
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

int contadorRepetidas=0;
int contadorRepetidas2=0;

%>

<html>
<head>
<title>ESTADO DE  VARIACIONES DEL PATRIMONIO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && balance.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">
<table width="960" border="0" align="center">
<tr><td><hr width="960" size="1"> </td></tr>
</table>


<table border='0' bordercolor='#000000' bgcolor='#FFFFFF' >
		<tr>		
		<td>
			<table width='900'>
				<tr>
					<td align="CENTER"  style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_1")%></td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Verdana, Arial, Helvetica;	font-size: 12px;color: #000000;font-weight: bold;"><%=session.getAttribute("empresa_2")%></div></td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">ESTADO DE  VARIACIONES DEL PATRIMONIO</div></td>
				</tr>
				<tr><td height='23'>&nbsp;</td></tr>
        <tr><td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"><%=nomContrato%></td></tr>
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
	
          <P>&nbsp;</P>

           <table width="960"  border="0" align="center" bgcolor="#CCCCCC" style="font-family: Arial;	font-size: 13px;color: #000000;font-weight: bold;">
            <tr>
                <td align="center" width="350">&nbsp;</td>
                <td align="right" width="150">Patrimonio Fideicomitido</td>
                <td align="right" width="150">Aplicaciones Patrimoniales</td>
                <td align="right" width="150">Resultado Neto </td>
                <td align="right" width="150">Revaluación de Patrimonio </td>
                <td align="right" width="150">Total Patrimonio </td>
            </tr>
</table>
<table width="960"  border="0" align="center">
      <%
           for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
              String etiTemp="";
              String campo2="";
              String campo3="";
              String campo4="";
              String campo5="";
              String campo1="";
              Fecha =(String)registro.get("patiIdFecha");
              folioOper = (BigDecimal)registro.get("patiIdSecuencial");
              col1 = (BigDecimal)registro.get("patiCol1");
              col2 = (BigDecimal)registro.get("patiCol2");
              col3 = (BigDecimal)registro.get("patiCol3");
              col4 = (BigDecimal)registro.get("patiCol4");
              col5 = (BigDecimal)registro.get("patiCol5");
              etiquetas=(String)registro.get("patiConcepto"); 
              
              if(etiquetas.equals("0")){etiTemp="&nbsp;";}else{etiTemp=etiquetas;}
              
              if(col1.intValue()!=0){campo1=DecimalFormatUtils.getFormatedNumber("###,###.00", col1);}else{campo1="&nbsp;";}
              if(col2.intValue()!=0){campo2=DecimalFormatUtils.getFormatedNumber("###,###.00", col2);}else{campo2="&nbsp;";}
              if(col3.intValue()!=0){campo3=DecimalFormatUtils.getFormatedNumber("###,###.00", col3);}else{campo3="&nbsp;";}
              if(col4.intValue()!=0){campo4=DecimalFormatUtils.getFormatedNumber("###,###.00", col4);}else{campo4="&nbsp;";}
              if(col5.intValue()!=0){campo5=DecimalFormatUtils.getFormatedNumber("###,###.00", col5);}else{campo5="&nbsp;";}
              
             %>               
          <tr style="font-family: Arial;	font-size: 10px;color: #000000;">
            <td align="left" width="350" ><%=etiTemp%></td>
            <td align="right" width="150" ><%=campo1%></td>                
            <td align="right" width="150" ><%=campo2%></td>                                
            <td  align="right" width="150" ><%=campo3%></td>                
            <td  align="right" width="150" ><%=campo5%></td>
            <td  align="right" width="150" ><%=campo4%></td>
          </tr>   
      <% } %>
    </table>

		
         

</body>
</html>