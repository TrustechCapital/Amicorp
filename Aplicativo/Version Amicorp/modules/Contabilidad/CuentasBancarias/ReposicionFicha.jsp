<!--
/*
  @Autor:Inscitech
  @Creado: Junio 2008
*/
-->

<%@ page import="java.util.*,java.text.*"%>
<%   
   
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;

   String captura = ((mx.gob.nafin.fiduciario.common.beans.UserInfoBean)session.getAttribute("userInfo")).getNombre();
	String folio="---";
   String fechaHr = "---";
	String nomFideicomiso="---";
   String nomBanco = "---";
   String clabe = "---";
   String persona = "---";
   String rfc = "---";
   String email = "---";
   
   
   //Traspaso
   
	String subCtaD="---";
	String ctaChequesD="---";
  
  if(consulta.size()>0) 
{ 
    registro = (java.util.Map)consulta.get(0);       
    
    folio=String.valueOf(registro.get("folio"));     
    fechaHr=String.valueOf(registro.get("fechaHr"));
    nomFideicomiso=String.valueOf(registro.get("nomFideicomiso"));
    nomBanco=String.valueOf(registro.get("nomBanco"));
    clabe=String.valueOf(registro.get("clabe"));
    persona=String.valueOf(registro.get("persona"));
    rfc=String.valueOf(registro.get("rfc"));
    email=String.valueOf(registro.get("email"));
}
%>
<HTML>
<HEAD>

<TITLE>Opciones - Solicitud de Alta de Cuenta CLABE</TITLE>

<META content="text/html; charset=windows-1252" http-equiv=Content-Type>
<META content="P�gina Principal" name=O>
<link href="css/fiducia_general.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
function instrucciones()
	{
	parent.location="FI_Opciones.jsp";
	}

function imprimir()
	{
	window.print();
	parent.location="FI_Opciones.jsp";
	}

</script>
<script> 
function window.onbeforeprint()
{ 
Imprimir.style.visibility = 'hidden';
Salir.style.visibility = 'hidden'; 
} 
function window.onafterprint(){ 
Imprimir.style.visibility = 'visible';
Salir.style.visibility = 'visible'; 
}
</script> 
</HEAD>
<BODY vLink=#052206 leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">
<table border="0" width="90%" align="center">
  <tr bordercolor="#000000"> 
    <td  ><hr size="2"></td>
  </tr>
  <tr bordercolor="#000000"> 
    <td align="right" class="textoNegrita"><table width="100%" border="0" height="79">
        <tr bordercolor="#000000"> 
          <td width="11%"><img src="imagenes/logo.jpg" height="89"></td>
          <td width="89%" align="center" bordercolor="#FFFFFF" class="subtitulo">DIRECCION 
            FIDUCIARIA <br>
            <%="FICHA DE CUENTA CLABE"%> 
          </td>
        </tr>
      </table></td>
  </tr>
  <tr bordercolor="#000000"> 
    <td ><hr size="2"></td>
  </tr>
  <tr bordercolor="#000000"> 
    <td  align="right" class="textoNegrita">Fecha: <%=fechaHr%></td>
  </tr>
  <tr bordercolor="#000000">
    <td  align="right" class="textoNegrita">&nbsp;</td>
  </tr>
</table>
<table width="70%" border="0" align="center">
  <tr> 
    <td align="center"> 
	<table width="100%"  border="1" bordercolor="#FFFFFF">
        <tr bordercolor="#006699"> 
          <td   colspan="2" bordercolor="#000000" bgcolor="#CCCCCC" class="subtitulo">Folio: 
            <%=folio%></td>
        </tr>
        <tr bordercolor="#000000"> 
          <td class="texto">Fidecomiso:</td>
          <td class="texto"><%=nomFideicomiso%></td>
        </tr>
        <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
          <td width="37%" class=texto> <%="Capturada:"%>&nbsp;&nbsp; </td>
          <td width="63%" class="texto"> <%=captura%> 
          </td>
        </tr>
        <tr bordercolor="#000000" bgcolor="#FFFFFF"> 

          <td height="29" colspan="2"  align="center" class=texto>DATOS CUENTA CLABE</td>

        </tr>
		 <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                          <td  class=texto> Banco donde radica la cuenta:&nbsp;&nbsp;</td>
                          <td  class="texto"><%=nomBanco%> </td>
        </tr>
        <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
          <td  class=texto>N&uacute;mero de Cuenta:&nbsp;&nbsp;</td>
          <td class="texto" ><%=clabe%> </td>
        </tr>
  
        <tr bordercolor="#000000" bgcolor="#FFFFFF" > 
          <td  class=texto > Titular de la Cuenta:&nbsp;&nbsp;</td>
          <td class="texto" ><%=persona%> </td>
        </tr>

        <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
          <td  class=texto  >RFC:&nbsp;&nbsp;</td>
          <td  class="texto" ><%=rfc%> </td>
        </tr>

        <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
          <td  class=texto  >Correo electronico:&nbsp;&nbsp;</td>
          <td  class="texto" ><%=email%></td>
        </tr>
       

      </table></td>
  </tr>
  <tr> 
    <td align="center"> 
	<table width="100%" >
        <tr> 
          <td >&nbsp;</td>
        </tr>
        <tr> 

        <tr> 
           <td class="textoNegrita" align="center"><%="Expedida"%> por:</td>
        </tr>
        <tr> 
          <td align="center">&nbsp;</td>
        </tr>
        <tr> 
          <td align="center"> _______________________</td>
        </tr>
        <tr> 
          <td class="textoNegrita" ><div align="center"><b><%=captura%></b></div></td>
        </tr>

        <tr> 
          <td > 
            <table border="0" width="98%">
              <tr> 
                <td align="justify"  class="subtitulo" > <p> Recuerde que el alta 
                    de la cuenta al fideicomiso est&aacute; sujeta a su verificaci&oacute;n 
                    con su banco y este tr&aacute;mite podr&aacute; tardar hasta 
                    3 d&iacute;as h&aacute;biles</p></td>
              </tr>
              <tr> 
                <td> <p   align="CENTER" class="alerta"> &nbsp; 
                  </p>
                  </td>
              </tr>
            </table>
            <p class="subtitulo" align="justify">&nbsp; </p>
          </td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
          <td  align="center"> <input type="button" name="Imprimir"  class="boton" value="Imprimir"   onClick="javascript:imprimir()" > 
        </tr>
      </table></td>
  </tr>
</table>


</BODY>
</HTML>