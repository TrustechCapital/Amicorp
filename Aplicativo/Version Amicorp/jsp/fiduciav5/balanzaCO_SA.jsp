<!--balanzaCO_SA.jsp-->
<jsp:useBean id="bal" class="com.nafin.negocio.balanzaComprob"/>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="nConsultas" class="com.nafin.negocio.nConsultas"/>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="nafin.css" type="text/css">
<%
String[] meses={"","ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE","",""};
String[] bitacora = new String[5];
String fechaCont=BD.getFecha();
Calendar calend = Calendar.getInstance();
String folioBit="";
int regBitacora=0;
int mesTxt =(request.getParameter("Mes") == null || request.getParameter("Mes").equals("0")? 1 + calend.getTime().getMonth():Integer.parseInt(request.getParameter("Mes")));
String periodo = "Balanza de Comprobacion";
if(!meses[mesTxt].equals("")) periodo += " de " + meses[mesTxt] + " del " +(request.getParameter("Ano") == null || request.getParameter("Ano").equals("0")?1900+(request.getParameter("Ano") == null || request.getParameter("Ano").equals("0")?calend.getTime().getYear():Integer.parseInt(request.getParameter("Ano"))):Integer.parseInt(request.getParameter("Ano")));
%>
<title><%=periodo%> Fideicomiso: <%=request.getParameter("Fiso")%></title>

<style type="text/css">
<!--
	.style14 {
				font-size: 16px;
				font-weight: bold;
				font-family: Verdana, Arial, Helvetica, sans-serif;
			 }
	.style15 {
				font-family: Verdana, Arial, Helvetica, sans-serif;
				font-size: 12px;
				font-weight: bold;
			 }
	.style16 {font-family: Arial, Helvetica, sans-serif}
	.style18 {
				font-size: 12px;
				font-weight: bold;
				font-family: Arial, Helvetica, sans-serif;
			 }
	.error   {
	       font-family: Arial, Helvetica, Verdana;	
				 font-size: 14px;color: #006699;
				 font-weight: bold;
			 }	 		 
.style26 {font-size: xx-small}
body,td,th {
	font-size: xx-small;
}
-->
</style>
<script language="javascript">

	function ventanaError( mensajeError ) {
	   document.write("<center>");
	   document.write("<table border='0'>");
	   document.write("<tr><td>&nbsp;</td></tr>");
	   document.write("<tr><td>&nbsp;</td></tr>");
	   document.write("<tr><td>&nbsp;</td></tr>");
	   document.write("<tr><td class='error'>El Reporte de la Balanza de Comprobacion</td></tr>");
	   document.write("<tr><td class='error'>No esta Disponible</td></tr>");
	   document.write("<tr><td class='error'>&nbsp;</td></tr>");
	   document.write("<tr><td class='error'>" + mensajeError + "</td></tr>");
	   document.write("<tr><td class='error'>&nbsp;</td></tr>");
	   document.write("<tr><td><input class='boton' type='button' value='Cerrar' onClick='window.close()'/></td></tr>");	
	}
</script>
</head>
<% 

int noCuenta = Integer.parseInt(request.getParameter("Fiso"));
int anio = (request.getParameter("Ano") == null || request.getParameter("Ano").equals("0")?1900+calend.getTime().getYear():Integer.parseInt(request.getParameter("Ano")));
int mes  =(request.getParameter("Mes") == null || request.getParameter("Mes").equals("0")? 1 + calend.getTime().getMonth():Integer.parseInt(request.getParameter("Mes")));
String tabla = "saldos"+(request.getParameter("tipoReporte") == null ? "" : request.getParameter("tipoReporte"));

// REEXPRESADO ----
String monedaReexpresada = "Pesos";
boolean bReexpresado = request.getParameter("reexpresado")!=null;
monedaReexpresada = request.getParameter("moneda")!=null?request.getParameter("moneda").toString():monedaReexpresada;
boolean bExtranjera = monedaReexpresada.equals("Dolares Americanos");

monedaReexpresada = ((!bReexpresado&&bExtranjera)||(bReexpresado&&!bExtranjera)?"Moneda Nacional":"Dolares Americanos");
// ---------------

Vector datos;

if(bReexpresado)// REEXPRESADO
  datos = bal.generaBalanzaComReexpresada( noCuenta, anio, mes, tabla );
else
  datos = bal.generaBalanzaCom( noCuenta, anio, mes, tabla );

%>

<body <%=request.getParameter("bImprimir")!=null && request.getParameter("bImprimir").trim().equals("1") && !datos.isEmpty()==true ?"onLoad=\"window.print();window.close();\"":" " %> oncontextmenu="return false" onkeydown="return false"   onmousemove ="return false" onselectstart ="return false" onclick="return false">

    <%
	    int numeroFiso = Integer.parseInt(request.getParameter("Fiso"));

          
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
		 bitacora[3]="Consulta de la Balanza de Comprobacion para el Fideicomiso "+numeroFiso
		 +" del Mes "+meses[mes].toUpperCase()+" del Anio "+anio;
		 bitacora[4]="120.0.0.1";
		
		 //regBitacora=BD.insertaBitacora(bitacora);	
	    
		if(bal.tieneAdministracion( numeroFiso ).booleanValue() ) {
	%>
	         <script language="javascript"> 
			     var mensajeError = "Por ser Fideicomiso con Administracion, la consulta solicitada no cotiene información"; 
				 ventanaError( mensajeError ); 
			 </script>   
	<% } else { 
				Vector sumas = bal.generaSumas( noCuenta, anio, mes, tabla);
				if( datos.isEmpty() ) {
	%>
				       <script language="javascript"> 
								var mensajeError = "El Mes solicitado no contiene informacion"; 
							ventanaError( mensajeError );
						</script>
							
	<%			
	             } else {
    %>
          
	<% 
		     String mesCompleto = meses[mes];
		     int paginas = ( bal.obtenPaginas( noCuenta, anio, mes, tabla ).intValue() );
		     int pagina; 
			   int pag;
         String nombreFideicomiso="";

       
        nConsultas.setVtrIntDato1(Integer.parseInt(request.getParameter("Fiso").toString()));//
        nConsultas.querySelect(46);
        if(nConsultas.hasData())
        {
           nombreFideicomiso = nConsultas.getVtrStrDato1();
        }
       
		     for ( pagina = 1; pagina <= paginas; pagina++ )  {
			      if( pagina == paginas){ pag = 1; } else { pag = 0; }
			      if (pagina==1 || request.getParameter("bImprimir")!=null) 
				     out.println(bal.escribeEncabezado( (String)request.getParameter("Fiso"), String.valueOf(anio), mesCompleto, pag, nombreFideicomiso,(bempresa?nom_empresa:session.getAttribute("empresa_1").toString()),session.getAttribute("empresa_2").toString(),monedaReexpresada));
				  	 out.println(bal.escribeBalanza( datos, pagina )); 
			  }	  
		  %>
		  
		  <tr>
           <td height="30"  colspan="10" class="textohome2"><div align="center"><span class="style26">SUMAS</span></div></td>
             <% out.println(bal.escribeSumasBalanza( sumas )); %>   
         </tr>
		 <tr width="900" style="font-family: Arial;	font-size: 9px;color: #000000;" > 
    		<td width="25" colspan="2">&nbsp;</td>
   		   <td  colspan="11" align="center"><p align="justify">&nbsp; </p></td>
    		</tr><tr><td align="center" style="font-family: Arial;	font-size: 9px;color: #000000;" colspan="14">&nbsp;</td>
  			</tr>
  </table> 
		
<%
     }
 } //La llave del ultimo else	
%>

</body>
</html>
