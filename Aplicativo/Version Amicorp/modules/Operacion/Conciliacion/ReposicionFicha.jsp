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

   //Deposito

	String ficha="---";
	String folio="---";
   String fechaHr = "---";
	String fecha="---";
	String nomFideicomiso="---";
	String nomMoneda="---";
	String importe="---";
	String concepto="---";
   String personaMovto="---";
	String persona="---.";
	String tipoPersona="---";
	String subCta="---";
	String ctaCheques="---";
   
   //Retiro
   
   String formaLiq = "---";
   String clabe = "---";
   String plaza = "---";
   String rfc = "---";
   
   
   //Traspaso
   
	String subCtaD="---";
	String ctaChequesD="---";
  
  if(consulta.size()>0) 
{ 
    registro = (java.util.Map)consulta.get(0);       
    
    ficha=String.valueOf(registro.get("ficha"));     
    folio=String.valueOf(registro.get("folio"));     
    fechaHr=String.valueOf(registro.get("fechaHr"));
    fecha=String.valueOf(registro.get("fecha"));
    nomFideicomiso=String.valueOf(registro.get("nomFideicomiso"));
    nomMoneda=String.valueOf(registro.get("nomMoneda"));
    importe=String.valueOf(registro.get("importe"));
    concepto=String.valueOf(registro.get("concepto"));
    personaMovto=String.valueOf(registro.get("personaMovto"));
    persona=String.valueOf(registro.get("persona"));
    tipoPersona=String.valueOf(registro.get("tipoPersona"));
    subCta=String.valueOf(registro.get("subCta"));
    ctaCheques=String.valueOf(registro.get("ctaCheques"));
    subCtaD=String.valueOf(registro.get("subCtaD"));
    ctaChequesD=String.valueOf(registro.get("ctaChequesD"));
   
   
   //Retiro
   
    formaLiq=String.valueOf(registro.get("formaLiq"));
    plaza=String.valueOf(registro.get("plaza"));
    clabe=String.valueOf(registro.get("clabe"));
    rfc=String.valueOf(registro.get("rfc"));
}
%>
<HTML><HEAD>
<TITLE>Instrucciones - Servicios Fiduciarios</TITLE>
<META content="text/html; charset=windows-1252" http-equiv=Content-Type>
<META content="Página Principal" name=O>

<link href="css/fiducia_general.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">

function imprimir()
{
window.print();
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
          <td width="11%"><img src="imagenes/logo.jpg" height="89" alt="<%=session.getAttribute("empresa_9")%>"></td>
          <td width="89%" align="center" bordercolor="#FFFFFF" class="subtitulo">DIRECCION 
            FIDUCIARIA <br>
            FICHA DE <%=ficha%>
          </td>
        </tr>
      </table></td>
  </tr>
  <tr bordercolor="#000000"> 
    <td ><hr size="2"></td>
  </tr>
  <tr bordercolor="#000000"> 
    <td  align="right" class="textoNegrita">Fecha: <%=fechaHr%> hrs.</td>
  </tr>
  <tr bordercolor="#000000">
    <td  align="right" class="textoNegrita">&nbsp;</td>
  </tr>
</table>
<table width="70%" border="0" align="center">
  <tr>
    <td align="center">
            <%if(ficha.equals("DEPÓSITO")){%>
                              <table width="100%"  border="1" bordercolor="#FFFFFF">
                                   <tr bordercolor="#000000" bgcolor="#CCCCCC"> 
                                     <td  class="subtitulo"  colspan="2">Folio de Operaci&oacute;n: <%=folio%> 
                                     </td>
                                   </tr>
                                   <tr bordercolor="#000000" bgcolor="#CCCCCC"> 
                                     <td  class="subtitulo"  colspan="2">Fecha de Operaci&oacute;n: <%=fecha%> 
                                     </td>
                                   </tr>
                                   <tr bordercolor="#000000"> 
                                     <td width="38%"  class="texto">Fideicomiso:</td>
                                     <td width="62%" class="texto"><%=nomFideicomiso%></td>
                                   </tr>
                                   <tr bordercolor="#000000"> 
                                     <td  class="texto"> Divisa:</td>
                                     <td  class="texto"> 
                                       <%=nomMoneda%>
                                     </td>
                                   </tr>
                                   <tr bordercolor="#000000"> 
                                     <td  class="texto"> Importe del deposito:</td>
                                     <td  class="texto"> 
                                       <%="$"+importe%>
                                     </td>
                                   </tr>
                                    <tr bordercolor="#000000"> 
                                     <td class="texto"> Concepto del deposito:</td>
                                     <td  class="texto"> 
                                       <%=concepto%>
                                     </td>
                                    <tr bordercolor="#000000"> 
                                     <td  class="texto" > Persona que deposita:</td>
                                     <td class="texto"> 
                                       <%=personaMovto%>
                                     </td>
                                   </tr>
                                   <tr bordercolor="#000000"> 
                                     <td  class="texto" > Tipo de Persona</td>
                                     <td class="texto"> 
                                       <%=tipoPersona%>
                                     </td>
                                   </tr>
                                    <tr bordercolor="#000000"> 
                                     <td  class="texto" > Persona</td>
                                     <td class="texto"> 
                                         <%=persona%>
                                     </td>
                                   </tr>
                                   <tr bordercolor="#000000">
                             <%if(true){%>
                                     <td  class="texto" > Abono a la Cta de Cheque No:</td>
                                     <td class="texto">
                                          <%=ctaCheques%>
                                     </td>
                              <%}else{%>
                                     <td  class="texto" > Abono al Contrato de Inversi&oacute;n No.:</td>
                                     <td class="texto"> 
                                        <%=ctaCheques%>
                                     </td>
                               <% }%>
                                   </tr>
                                    <tr bordercolor="#000000"> 
                                     <td  class="texto"> SubCta:</td>
                                     <td  class="texto"> <%=subCta%></td>
                                   </tr>
                              </table>
            
            <%}else if(ficha.equals("RETIRO")){%>
            
            
                                 <table width="100%"  border="1" bordercolor="#FFFFFF">
                                         <tr bordercolor="#006699"> 
                                           <td   colspan="2" bordercolor="#000000" bgcolor="#CCCCCC" class="subtitulo">Folio 
                                             de Operaci&oacute;n: <%=folio%></td>
                                         </tr>
                                         <tr bordercolor="#000000" bgcolor="#CCCCCC"> 
                                           <td  class="subtitulo"  colspan="2">Fecha de Operaci&oacute;n: <%=fecha%> 
                                           </td>
                                         </tr>        
                                         <tr bordercolor="#000000"> 
                                           <td class="texto" width="22%">Fideicomiso:</td>
                                           <td class="texto" width="58%"><%=nomFideicomiso%></td>
                                         </tr>
                                         <%if(true){%><!--CHEQUE DEL BANCO-->
                                               <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                                                 <td width="22%" class=texto> Retiro de Cuenta de Cheques:</td>
                                                 <td width="58%" class="texto"> 
                                                   <%=ctaCheques %>
                                                 </td>
                                               </tr>
                                         <%}else{%>
                                                <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                                                 <td width="22%" class=texto> Retiro del Contrato de Inversi&oacute;n:</td>
                                                 <td width="58%" class="texto"> 
                                                   <%=ctaCheques %>
                                                 </td>
                                               </tr>
                                         <%}%>    
                                         <tr bordercolor="#000000"> 
                                           <td  class="texto" width="22%"> Divisa:</td>
                                           <td  class="texto" width="58%"> 
                                             <%=nomMoneda%>
                                           </td>
                                         </tr>
                                                 
                                         <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                                           <td  class="texto" width="22%">Importe del retiro:</td>
                                           <td class="texto" width="58%"> 
                                             <%="$"+importe%>
                                           </td>
                                         </tr>
                                         <tr bordercolor="#000000" bgcolor="#FFFFFF" > 
                                           <td  class=texto width="22%"> Concepto del retiro: </td>
                                           <td class="texto" width="58%"> 
                                             <%=concepto%>
                                           </td>
                                         </tr>
                                         <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                                           <td  class=texto  width="22%">Forma de Liquidaci&oacute;n:</td>
                                           <td  class="texto" width="58%"> 
                                             <%=formaLiq%>
                                           </td>
                                         </tr>
                                      
                                         <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                                           <td  class=texto width="22%">N&uacute;mero de Cuenta:</td>
                                           <td  class="texto" width="58%"> 
                                             <%=clabe%>
                                           </td>
                                         </tr>
                                         <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                                           <td  class=texto width="22%">SubCuenta:</td>
                                           <td  class="texto" width="58%"> 
                                             <%=subCta%>
                                           </td>
                                         </tr>
                                         <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                                           <td  class=texto width="22%">Plaza:</td>
                                           <td class="texto" width="58%"> 
                                             <%=plaza%>
                                           </td>
                                         </tr>
                                         <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                                           <td  class=texto width="22%">Titular de la Cuenta:</td>
                                           <td  class="texto" width="58%"> 
                                             <%=persona%>
                                           </td>
                                         </tr>
                                         <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
                                           <td  class=texto width="22%">RFC:</td>
                                           <td  class="texto" width="58%"> 
                                             <%=rfc%>
                                           </td>
                                         </tr>
                                 </table>
            
            
            
            <%}else if(ficha.equals("TRASPASO")){%>
            
            
                                    <table width="70%" border="0" align="center">
                                      <tr> 
                                        <td align="center">
                                       <table width="100%" border="1" bordercolor="#FFFFFF">
                                            <tr bordercolor="#000000" bgcolor="#CCCCCC"> 
                                              <td colspan="3" h><b class="subtitulo">Folio de Operaci&oacute;n: 
                                                <%=folio%> </b></td>
                                            </tr>
                                            <tr bordercolor="#000000" bgcolor="#CCCCCC"> 
                                              <td colspan="3" h><b class="subtitulo">Fecha de Operaci&oacute;n:
                                                <%=fecha%> </b></td>
                                            </tr>
                                            <tr bordercolor="#000000"> 
                                              <td width="166"  class="texto">Fideicomiso:</td>
                                              <td width="368"  class="texto"><%=nomFideicomiso%></td>
                                            </tr>
                                            <tr bordercolor="#000000"> 
                                              <td class="texto">Cuenta&nbsp;Bancaria Origen:</td>
                                              <td class="texto"> 
                                                <%=ctaCheques %>
                                              </td>
                                            </tr>
                                            <tr bordercolor="#000000"> 
                                              <td class="texto">Subcuenta Origen:</td>
                                              <td class="texto"> 
                                                <%=subCta%>
                                              </td>
                                            </tr>
                                            <tr bordercolor="#000000"> 
                                              <td class="texto">Cuenta&nbsp;Bancaria Destino:</td>
                                              <td class="texto"> 
                                                <%=ctaChequesD%>
                                              </td>
                                            </tr>
                                             <tr bordercolor="#000000"> 
                                              <td class="texto">Subcuenta Destino:</td>
                                              <td class="texto"> 
                                                <%=subCtaD %>
                                              </td>
                                            </tr>
                                            <tr bordercolor="#000000"> 
                                              <td  class="texto"> Importe   del traspaso:</td>
                                              <td class="texto">
                                                <%="$"+importe%>
                                              </td>
                                            </tr>      
                                       </table>
            
            <%}%>
      </td>
  </tr>
  <tr> 
    <td align="center">
	<table width="100%" height="38">
        <tr> 
          <td >&nbsp;</td>
        </tr>
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
          <td class="textoNegrita" ><div align="center"><b><%=((mx.gob.nafin.fiduciario.common.beans.UserInfoBean)session.getAttribute("userInfo")).getNombre()%></b></div></td>
        </tr>
        <!--INICIO APROBO-->
        <tr> 
          <td >&nbsp;</td>
        </tr>
        <tr> 
          <td >&nbsp;</td>
        </tr>
          <tr> 
          <td class="textoNegrita" align="center">Autorizada por:</td>
        </tr>       
        <tr> 
          <td align="center">&nbsp;</td>
        </tr>
        <tr> 
          <td align="center"> _______________________</td>
        </tr>
        <tr> 
          <td class="textoNegrita" ><div align="center"><b><%=1==1?" ":(String)session.getAttribute("empresa_4")%></b></div></td>
        </tr>
       <tr> 
          <td >&nbsp;</td>
        </tr>
        <tr> 
          <td ><p class="subtitulo" align="justify">La aplicaci&oacute;n de este 
              dep&oacute;sito est&aacute; sujeta a la recepci&oacute;n de los 
              recursos en la cuenta indicada y a su notificaci&oacute;n por este 
              medio, a m&aacute;s tardar a las 11:00 horas de su fecha, con el fin de que se refleje en el saldo en el dia habil siguiente. </p>
            <p class="subtitulo" align="justify">Los dep&oacute;sitos recibidos y notificados despu&eacute;s de ese horario se invertir&aacute;n al siguiente d&iacute;a h&aacute;bil.
        </tr>
        <tr> 
          <td >&nbsp;</td>
        </tr>
        <tr> 
          <td  class="texto" align="center"> <input type="button" name="Imprimir"  class="boton" value="Imprimir"   onClick="javascript:imprimir()" > 
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</BODY>
</HTML>