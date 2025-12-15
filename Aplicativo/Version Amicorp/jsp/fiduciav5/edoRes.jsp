<%@ page import="java.text.*,java.util.*,java.lang.*,java.io.*"%>

<jsp:useBean id="reporte" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="valida" class="com.nafin.negocio.nReporte"/>
<jsp:useBean id="edoRes" scope="page" class="com.nafin.negocio.edoResFormulas" />
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>

<%
String[] bitacora = new String[5];
String fechaCont=BD.getFecha();
String folioBit="";
int regBitacora=0;

try
	{
double subTotal1=0;
double subTotal2=0;
double subTotal3=0;
double subTotal4=0;
double subTotal5=0;
double total=0;
String fideicomiso="";
String periodo="";			
String apertura=""; 
DecimalFormat decFormat = new DecimalFormat("###,###,###,###,###,###,###,##0.00");
double sumInteCobra=0;
double sumVentas=0;
double sumComiCobra=0;
double sumDonativos=0;
double sumPrimaXgar =0;
double sumUdis =0;
double sumSAL_NUM_AUX1   =0;
double sumCambios1 =0;
double sumIngresos_por_servicio =0;
double sumCosPer = 0;
double sumCosAdmi = 0;
double sumEntregas_a_fideicom  = 0;
double sumGastos_administrativo  = 0;
double sumHonorarios = 0;
double sumImpDiver = 0;
double sumOtrosIng  = 0;
double sumAplicacion  = 0;
double sumQuebrantos = 0;
double sumOtros_Gastos  = 0;
double sumCastigos  = 0;
double sumAplicacion1  = 0;
double sumAfectacion  = 0;
double sum_5209 =0;
double sumCambios=0;
double sumRes_por_valuacion  = 0;
double sumIntePagado  = 0;
double sumComiPag  =0;
double sumDividendosPag=0;
double sumRES_NEG=0;//P
double sumCAMBIOS_NEG=0;//P
double sumEtiqueta_cambios=0;
double sumEtiqueta_resultados=0;
int j=0;
String tipoAdmin="";
String mensaje="";	
String[] meses={"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"};
int numFid=Integer.valueOf(request.getParameter("Fiso")).intValue();
int mes=Integer.valueOf(request.getParameter("Mes")).intValue();
int anio=Integer.valueOf(request.getParameter("Ano")).intValue();
String dia = ((mes==1||mes==3||mes==5||mes==7||mes==8||mes==10||mes==12)?"31":"30");
dia = ((mes==2&&anio%4==0)?"29":((mes==2)?"28":dia));
//int dia = Integer.valueOf(request.getParameter("Dia")).intValue();
String tabla = "saldos"+(request.getParameter("tipoReporte") == null ? "" : request.getParameter("tipoReporte"));

// firma 
boolean bfirma = request.getParameter("EjecutivoFirma")!=null;
String nom_firma = "";
String puesto_firma = "";

// REEXPRESADO ----
String monedaReexpresada = "Pesos";
boolean bReexpresado = request.getParameter("reexpresado")!=null;
monedaReexpresada = request.getParameter("moneda")!=null?request.getParameter("moneda").toString():monedaReexpresada;
boolean bExtranjera = monedaReexpresada.equals("Dolares Americanos");

monedaReexpresada = ((!bReexpresado&&bExtranjera)||(bReexpresado&&!bExtranjera)?"Moneda Nacional":"Dolares Americanos");
// ---------------

if(bfirma)
{
  String ejecutivoFirma = request.getParameter("EjecutivoFirma").toString();
  nom_firma = ejecutivoFirma;
  if(ejecutivoFirma.indexOf("-")>=0)
  {
    nom_firma = ejecutivoFirma.split("-")[0];
    puesto_firma = ejecutivoFirma.split("-")[1];
  }
}
// -----


//empresa------------

boolean bempresa = request.getParameter("Empresa")!=null;
String nom_empresa = "";

if(bempresa)
{
  nom_empresa = request.getParameter("Empresa").toString();
}
// ----------------


//incorporacion de la bitacora
 folioBit=BD.getFolio(2);
 System.out.println("Folio"+folioBit);
 bitacora[0]=fechaCont;
 bitacora[1]= folioBit;
 bitacora[2]="300";//(String)session.getValue("userid");
 bitacora[3]="Consulta del Estado de Resultados para el Fideicomiso "+numFid
 +" del Mes "+meses[mes-1].toUpperCase()+" del Anio "+anio;
 bitacora[4]="120.0.0.1";

 //regBitacora=BD.insertaBitacora(bitacora);	

//Valida si el fideicomiso tiene administracion propia o no
valida.setVtrIntDato1(numFid);//numero de contrato
valida.querySelect(10, tabla);
if(valida.hasData())
	tipoAdmin=valida.getVtrStrDato1().trim();
		
if(tipoAdmin.equals("NO"))
		{
reporte.setVtrIntDato1(numFid);//numero de contrato
reporte.setVtrIntDato2(mes);//mes del Reporte
reporte.setVtrIntDato3(anio);//año del Reportes

      if(bReexpresado)// REEXPRESADO
        reporte.querySelect(6, tabla);
      else
        reporte.querySelect(2, tabla);
		}
else
		{
		mensaje="El Reporte de Estado de Resultados<BR>No esta disponible<BR><BR>Para Fideicomisos con administración propia";
		}
if(tipoAdmin.equals("NO") && !reporte.hasData())
		{
	
		mensaje="No esta disponible<BR>El Reporte de Estado de Resultados<BR>De "+meses[mes-1]+" del "+anio;
		}

%>
<html>
<head>
<title>Estado de Resultados de <%=meses[mes-1]%> del <%=anio%>  Fideicomiso: <%=request.getParameter( "Fiso" )%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && reporte.hasData()==true ?"onLoad=\"window.print();window.close();\"":" "%>  oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">
<%
boolean encabezado=false;
if(reporte.hasData()==true)
	{
	fideicomiso=reporte.getVtrStrDato2().toUpperCase();
  apertura = reporte.getVtrStrDato3().toUpperCase();
  String añoApertura = apertura.substring(apertura.length()-4,apertura.length());
  String añoActual = String.valueOf(anio);//reporte.getVtrStrDato4().substring(reporte.getVtrStrDato4().length()-4,reporte.getVtrStrDato4().length());

	periodo= " DEL "+((añoApertura.equals(añoActual))?apertura.split(" DEL ")[0]:"1 DE ENERO")+" AL "+dia+" DE "+meses[mes-1].toUpperCase()+" DEL "+anio;//reporte.getVtrStrDato4();
  //periodo= " DEL MES DE "+meses[mes-1].toUpperCase()+" DEL "+anio;
do
	{
    reporte.setIndex(j);
	
  int sal_num_ctam = reporte.getVtrIntDato5(   );
	int sal_num_scta =  reporte.getVtrIntDato6(   );
	int sal_num_sscta = reporte.getVtrIntDato7(   );
	int sal_num_ssscta = reporte.getVtrIntDato8(  );
	int SAL_NUM_AUX1 = reporte.getVtrIntDato11(   );
	double SAL_NUM_AUX2 = reporte.getVtrDoubleDato12(  );
	double SAL_NUM_AUX3 = reporte.getVtrDoubleDato13(   );
	double sal_imp_saldo_act = reporte.getVtrDoubleDato14(  );

	// Cuentas y saldos
	edoRes.setValores( sal_num_ctam,  sal_num_scta,  sal_num_sscta,sal_num_ssscta, SAL_NUM_AUX2,  SAL_NUM_AUX3,  sal_imp_saldo_act  );					
	
    sumInteCobra=sumInteCobra+edoRes.InteCobra();//INTERESES COBRADOS
	sumVentas = sumVentas + edoRes.ventas();//VENTAS	
	sumComiCobra = sumComiCobra + edoRes.comiCobra();//COMISIONES COBRADAS
	sumIngresos_por_servicio= sumIngresos_por_servicio + edoRes.ingresos_por_servicio();
	sumDonativos= sumDonativos + edoRes.donativos();
	sumPrimaXgar = sumPrimaXgar + edoRes.primaXgar();
	sumUdis = sumUdis + edoRes.udis();
	sumRes_por_valuacion = sumRes_por_valuacion + edoRes.res_por_valuacion();		
	sum_5209 = sum_5209 + edoRes._5209();
	sumCambios = sumCambios + edoRes.Cambios();
	
	sumIntePagado =  sumIntePagado + edoRes.IntePagado();
	sumComiPag = sumComiPag + edoRes.comiPag();
	sumDividendosPag = sumDividendosPag + edoRes.dividendosPag();
	sumCambios1 = sumCambios1 + edoRes.cambios1();
	sumCosPer = sumCosPer + edoRes.cosPer();
	sumCosAdmi = sumCosAdmi + edoRes.cosAdmi();
	sumEntregas_a_fideicom = sumEntregas_a_fideicom + edoRes.entregas_a_fideicom();
	sumGastos_administrativo = sumGastos_administrativo + edoRes.gastos_administrativo();
	sumHonorarios = sumHonorarios + edoRes.honorarios();
	sumImpDiver = sumImpDiver + edoRes.impDiver();
	sumOtrosIng  = sumOtrosIng  + edoRes.otrosIng();
	sumAplicacion = sumAplicacion + edoRes.aplicacion();
	sumQuebrantos =  sumQuebrantos + edoRes.quebrantos();
	sumOtros_Gastos =  sumOtros_Gastos + edoRes.otros_Gastos();
	sumCastigos = sumCastigos + edoRes.castigos();
	sumAplicacion1 = sumAplicacion1 + edoRes.aplicacion1();
	sumAfectacion =  sumAfectacion +  edoRes.afectacion();

	
	j++;
	}
	while(j<reporte.getSize());
	System.out.println("cambios:"+sumCambios);
	sumEtiqueta_cambios =  sumEtiqueta_cambios + edoRes.etiqueta_cambios(sumCambios);
	sumEtiqueta_resultados =  sumEtiqueta_resultados + edoRes.etiqueta_resultados(sumRes_por_valuacion);
	//resultados por valuacion
	if(sumRes_por_valuacion<0 )
		 sumRES_NEG= sumRes_por_valuacion*-1;
	else
		 sumRES_NEG= 0 ;
	//CAMBIOS NEGATIVOS	 
	if(sumCambios<0 )
		 sumCAMBIOS_NEG= sumCambios;
	else
		 sumCAMBIOS_NEG= 0 ;	 
	 
	
%>


<table border='0' width='860' align="center" bordercolor='#000000' bgcolor='#FFFFFF'>
		<tr>
		<td>
			<table> 
				<tr>
					<td width='151' height='91'><div align='center'><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div></td>
				</tr>
			</table>
		</td>
		<td>
			<table >
				<tr>
					<td align="CENTER" style="font-family: Arial;	font-size: 16px;color: #000000;font-weight: bold;"><%=bempresa?nom_empresa:session.getAttribute("empresa_1")%></td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 12px;font-weight: bold;"><%=session.getAttribute("empresa_2")%></div></td>
				</tr>
       <tr> 
    <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" colspan="7">ESTADO 
      DE RESULTADOS <%=periodo%>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height='23' align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
      <%= fideicomiso%>
    </td>
  </tr>
  <tr>
    <td height='23' align="center" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;">
      FIDEICOMISO <%=numFid%>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</td>
</tr>
		</table> 

<table> 
				<tr>
					<td height='30'>&nbsp;</td>
				</tr>
			</table>
	  
<table width="860" border="0" align="center">
  
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;" > 
    <td align="center" colspan="5">(Importe en <%=monedaReexpresada%>)</td>
  </tr>

  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"> 
    <td width="53" >&nbsp;</td>
    <td width="419" >INGRESOS</td>
    <td width="208" >&nbsp;</td>
    <td width="191" >&nbsp;</td>
    <td width="73" >&nbsp;</td>
  </tr>
  <%//sumInteCobra PONER BANDERAS%>
  <% if(edoRes.bInteCobra)
  	{
	%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >INTERESES COBRADOS</td>
    <td >&nbsp; </td>
    <td  align="right"><%=decFormat.format(sumInteCobra)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%}
   if(edoRes.bVentas)
  	{
	%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"> 
    <td >&nbsp;</td>
    <td >VENTAS</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sumVentas)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
    <%}
   if(edoRes.bComiCobra)
  	{
	%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >COMISIONES COBRADAS</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sumComiCobra)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <%}
   if(edoRes.bIngresos_por_servicio)
  	{
	%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >INGRESOS POR SERVICIO</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sumIngresos_por_servicio)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   		<%}
  if(edoRes.bDonativos)
  		{
		%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"> 
    <td >&nbsp;</td>
    <td >DONATIVOS</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sumDonativos)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
 		<%}
  if(edoRes.bPrimaXgar)
  		{
		%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >PRIMAS POR GARANTIAS Y APOYOS OTROGADOS</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sumPrimaXgar)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   		<%}
  if(edoRes.bUdis)
  		{
		%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >INTERESES COBRADOS SOBRE VALORES GUBERNAMENTALES UDI'S</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sumUdis)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
       <%}
     
	 if (sumRes_por_valuacion<0)
	    {
		sumRes_por_valuacion=sumRes_por_valuacion * (-1);
		}
     else
	 	{
		sumRes_por_valuacion=0;
		edoRes.bRes_por_valuacion=false;
		}		
  if(edoRes.bRes_por_valuacion)
  		{
		%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >RESULTADO POR VALUACION</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sumRes_por_valuacion)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
       <%}
	 if (sumCambios<0)
	    {
		sumCambios=sumCambios * (-1);
		}
     else
	 	{
		sumCambios=0;
		edoRes.bCambios=false;
		}	
  if(edoRes.bCambios  )
  		{
		%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >CAMBIOS</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sumCambios)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
       <%}
  if(edoRes.b_5209)
  		{
		%>  
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >VALORIZACI&Oacute;N CUENTAS EN OTRAS MONEDAS</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sum_5209)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%}%>
    <%if(edoRes.bOtrosIng)
  		{%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >OTROS INGRESOS, BENEFICIOS Y RECUPERACIONES</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format(sumOtrosIng)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  	  <%} %>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"> 
    <td >&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td >&nbsp;</td>
    <td ><table width="100%">
        <td width="30%"></td>
        <td><hr size="1" noshade></td>
      </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td align="right">SUBTOTAL</td>
    <td >&nbsp;</td>
    <%
	subTotal1= sumInteCobra + sumVentas + sumComiCobra + sumIngresos_por_servicio + sumDonativos + sumPrimaXgar + sumUdis + sumRes_por_valuacion + sumCambios + sum_5209 + sumOtrosIng ;
	%>
    <td  align="right"><%=decFormat.format(subTotal1)%>&nbsp;</td>

    <td>&nbsp;</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td align="right">MENOS</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"> 
    <td >&nbsp;</td>
    <td >EGRESOS</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%
  subTotal2=sumIntePagado+sumComiPag+sumDividendosPag+sumEtiqueta_cambios+sumEtiqueta_resultados;  
   
  if(edoRes.bIntePagado) 
  	{%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >INTERESES PAGADOS</td>
    <td  align="right"><%=decFormat.format(sumIntePagado)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bComiPag && !edoRes.bEtiqueta_cambios  && !edoRes.bDividendosPag  && !edoRes.bEtiqueta_resultados?decFormat.format(subTotal2):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
    <%}
  if(edoRes.bComiPag) 
  	{%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >COMISIONES PAGADAS</td>
    <td  align="right"><%=decFormat.format(sumComiPag)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bEtiqueta_cambios  && !edoRes.bDividendosPag  && !edoRes.bEtiqueta_resultados?decFormat.format(subTotal2):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
     <%}
  if(edoRes.bDividendosPag) 
  	{%> 
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold; " > 
    <td >&nbsp;</td>
    <td >DIVIDENDOS PAGADOS</td>
    <td  align="right"><%=decFormat.format(sumDividendosPag)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bEtiqueta_cambios && !edoRes.bEtiqueta_resultados?decFormat.format(subTotal2):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
    <%}
  if(edoRes.bEtiqueta_cambios && sumEtiqueta_cambios!= 0 ) 
  	{%>  
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >CAMBIOS</td>
	<td  align="right"><%=decFormat.format(sumEtiqueta_cambios)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bEtiqueta_resultados?decFormat.format(subTotal2):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <%}
   
  if(edoRes.bEtiqueta_resultados && sumEtiqueta_resultados!=0) 
  	{
	%>
	
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >RESULTADO POR VALUACION</td>
    <td  align="right"><%=decFormat.format(sumEtiqueta_resultados)%>&nbsp;</td>
    <td  align="right"><%=decFormat.format(subTotal2)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <%}%>  
   <%if(edoRes.bComiPag || edoRes.bEtiqueta_cambios || edoRes.bDividendosPag || edoRes.bEtiqueta_resultados)
   		{%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td ><table width="100%">
        <td width="30%"></td>
        <td><hr size="1" noshade></td>
      </table></td>
    <td><table width="100%">
        <td width="30%"></td>
        <td><hr size="1" noshade></td>
      </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td align="right">SUBTOTAL</td>
    <td >&nbsp;</td>
    <td  align="right"><%=subTotal2==0?decFormat.format(0):decFormat.format(subTotal1-subTotal2)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td align="right">MENOS</td>
    <td >&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%}%>
  
   <%
	subTotal3=sumCosPer + sumCosAdmi + sumEntregas_a_fideicom + sumGastos_administrativo + sumHonorarios + sumCastigos + sumImpDiver;
	
	
    if(edoRes.bCosPer)
      {%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >COSTO DE PERSONAL</td>
    <td  align="right"><%=decFormat.format(sumCosPer)%>&nbsp;</td>
    <td  align="right"><%= !edoRes.bCosAdmi && !edoRes.bEntregas_a_fideicom && !edoRes.bGastos_administrativo && !edoRes.bHonorarios && !edoRes.bCastigos && !edoRes.bImpDiver?decFormat.format(subTotal3):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <%}
  if(edoRes.bCosAdmi)
  	{%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >GASTOS DE FIDEICOMISO</td>
    <td  align="right"><%=decFormat.format(sumCosAdmi)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bEntregas_a_fideicom && !edoRes.bGastos_administrativo && !edoRes.bHonorarios && !edoRes.bCastigos && !edoRes.bImpDiver?decFormat.format(subTotal3):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <%}
  if(edoRes.bEntregas_a_fideicom)
  	{%>  
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >ENTREGAS A FIDEICOMISARIOS O FIDEICOMITENTES</td>
    <td  align="right"><%=decFormat.format(sumEntregas_a_fideicom)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bGastos_administrativo && !edoRes.bHonorarios && !edoRes.bCastigos && !edoRes.bImpDiver?decFormat.format(subTotal3):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
     <%}
  if(edoRes.bGastos_administrativo)
  	{%>  
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >GASTOS ADMINISTRATIVOS UDI'S</td>
    <td  align="right"><%=decFormat.format(sumGastos_administrativo)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bHonorarios && !edoRes.bCastigos && !edoRes.bImpDiver?decFormat.format(subTotal3):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <%}
  if(edoRes.bHonorarios)
  	{%>   
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"> 
    <td >&nbsp;</td>
    <td >HONORARIOS</td>
    <td  align="right"><%=decFormat.format(sumHonorarios)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bCastigos && !edoRes.bImpDiver?decFormat.format(subTotal3):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <%}
  if(edoRes.bCastigos)
  	{%>   
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >CASTIGOS, DEPRECIACIONES Y AMORTIZACIONES</td>
    <td  align="right"><%=decFormat.format(sumCastigos)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bImpDiver?decFormat.format(subTotal3):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
     <%}
  if(edoRes.bImpDiver)
  	{%> 
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"> 
    <td >&nbsp;</td>
    <td >IMPUESTOS DIVERSOS</td>
    <td  align="right"><%=decFormat.format(sumImpDiver)%>&nbsp;</td>
    <td  align="right"><%=decFormat.format(subTotal3)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%}%>

  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td align="right">&nbsp;</td>
    <td ><table width="100%">
        <td width="30%"></td>
        <td><hr size="1" noshade></td>
      </table></td>
    <td align="right"><table width="100%">
        <td width="30%"></td>
        <td><hr size="1" noshade></td>
      </table></td>
    <td>&nbsp;</td>
  </tr>

  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td align="right">UTILIDAD (O PERDIDA) DE OPERACION:</td>
    <td >&nbsp;</td>
    <td  align="right"><%=decFormat.format((subTotal1-subTotal2)-subTotal3)%>&nbsp;</td>

    <td>&nbsp;</td>
  </tr>
   <%
	subTotal4= sumAplicacion;
	%>
<% 
	 if(edoRes.bAplicacion)
  		{%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >APLICACION REMANENTES</td>
    <td align="right"><%=decFormat.format(((-1)*sumAplicacion))%>&nbsp;</td>

    <td  align="right"><%=decFormat.format(((-1)*sumAplicacion))%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%}%>
  <%
  if(edoRes.bAplicacion)
  		{%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
   
    <td align="right">SUBTOTAL</td>
    <td >&nbsp;</td>
    <td  align="right"><%=subTotal4==0?decFormat.format(0):decFormat.format(((subTotal1-subTotal2) - subTotal3) + subTotal4)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%
  if(subTotal4>0) {%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"  > 
    <td >&nbsp;</td>
    <td align="right">MENOS</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  	 				<%}
    }%>
   <%
	subTotal5=sumQuebrantos + sumOtros_Gastos + sumAfectacion;
	
   %>
   <%if(edoRes.bQuebrantos)
   		{%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >UTILIDADES / PERDIDAS</td>
    <td  align="right"><%=decFormat.format(sumQuebrantos)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bOtros_Gastos && !edoRes.bAfectacion?decFormat.format(subTotal5):""%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  		<%}
	if(edoRes.bOtros_Gastos)
   		{%>	
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >OTROS GASTOS DE OPERACION</td>
    <td  align="right"><%=decFormat.format(sumOtros_Gastos)%>&nbsp;</td>
    <td  align="right"><%=!edoRes.bAfectacion?decFormat.format(subTotal5):""%>&nbsp;</td>
    <td >&nbsp;</td>
  </tr>
  		<%}
	if(edoRes.bAfectacion)
   		{%>  
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >AFECTACION PARA LA CONSTITUCION DE PROVISIONES</td>
    <td  align="right"><%=decFormat.format(sumAfectacion)%>&nbsp;</td>
    <td  align="right"><%=decFormat.format(subTotal5)%>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <%}%>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" >
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td height="2"><table width="100%" height="2"><td width="30%"></td><td width="70%"><hr size="1" noshade></td></table></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;"> 
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <%
	total=(((subTotal1-subTotal2)-subTotal3)+subTotal4)-subTotal5;
	%>
    <td  align="right"><%=total>0?"RESULTADO NETO":"RESULTADO NETO"%> &nbsp;</td>
    <td  align="right"><%=decFormat.format(total)%>&nbsp;</td>

    <td>&nbsp;</td>
  </tr>
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <%if(bfirma) 
  {
  %>
    <tr> 
      <td align="center" height="150" style="font-family: Arial;	font-size: 12px;color: #000000;" colspan="5" valign="bottom">
          <hr width="35%"/>
      </td>
    </tr>
    <tr> 
      <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000; font-weight:bolder;" colspan="8">	
        <%=nom_firma%>
      </td>
    </tr>
    <tr> 
      <td align="center" style="font-family: Arial;	font-size: 12px;color: #000000; font-weight:bolder;" colspan="8">	
        <%=puesto_firma%>
      </td>
    </tr>
  <%}%>
  
  <tr style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" > 
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>



<%
}
else
	{%>

	<%}%>

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