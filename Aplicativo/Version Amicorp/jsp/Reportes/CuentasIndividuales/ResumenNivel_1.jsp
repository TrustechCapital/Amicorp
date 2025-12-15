<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
<jsp:useBean id="nConsultas" class="com.nafin.negocio.nConsultas"/>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>REPORTE CUENTAS INDIVIDUALES</title>
  </head>
  <body>
  
  <%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    BigDecimal secuencial = new BigDecimal(0);
    BigDecimal numFideicomiso = new BigDecimal(0);
    String nomFideicomiso = "";
    String periodo = "";
    String fecha = "";
    String nomNivel1 = "";
    String nomNivel2 = "";
    String nomNivel3 = "";
    String nomInvers = "";
    BigDecimal numN1 = new BigDecimal(0);
    BigDecimal numN2 = new BigDecimal(0);
    BigDecimal numN3 = new BigDecimal(0);
    String nomN1 = "";
    String nomN2 = "";
    BigDecimal numInver = new BigDecimal(0);
    BigDecimal saldoAnt = new BigDecimal(0);
    BigDecimal tasa = new BigDecimal(0);
    BigDecimal depositos = new BigDecimal(0);
    BigDecimal retiros = new BigDecimal(0);
    BigDecimal intereses = new BigDecimal(0);
    BigDecimal isr = new BigDecimal(0);
    BigDecimal saldoParcial = new BigDecimal(0);
    BigDecimal participacion = new BigDecimal(0);
    BigDecimal saldoFinal = new BigDecimal(0);
    String fecFinal = "";
    String fecInicial = "";
    String inversionista="";
    String inversionistaAux="";
    double existeParticipacion=0.0; 
    
    
    //Variables auxiliares para la lógica e impresión
    BigDecimal totNoInvers = new BigDecimal(0);
    BigDecimal totSaldoAnt = new BigDecimal(0);
    BigDecimal totDepositos = new BigDecimal(0);
    BigDecimal totRetiros = new BigDecimal(0);
    BigDecimal totIntereses = new BigDecimal(0);
    BigDecimal totIsr = new BigDecimal(0);
    BigDecimal totParticipacion = new BigDecimal(0);
    BigDecimal totSaldoFinal = new BigDecimal(0);
    
    if(consulta.size() > 0) {
    
    
    
      registro = (java.util.Map)consulta.get(0);
      numFideicomiso = (BigDecimal)registro.get("rciNumFideicomiso");
      nomFideicomiso = (String)registro.get("rciNomFideicomiso");
      nomNivel1 = (String)registro.get("rciNomNivel1");
      nomNivel2 = (String)registro.get("rciNomNivel2");
      nomNivel3 = (String)registro.get("rciNomNivel3");
      numN1 = (BigDecimal)registro.get("rciNumN1");
      numN2 = (BigDecimal)registro.get("rciNumN2");
      numN3 = (BigDecimal)registro.get("rciNumN3");
      nomN1 = (String)registro.get("rciNomN1");
      nomN2 = (String)registro.get("rciNomN2");
      nomInvers = (String)registro.get("rciNomInvers");
      fecFinal = (String)registro.get("rciPeriodo");
      fecFinal = fecFinal = (String)registro.get("rciPeriodo");
      fecInicial= "01/"+fecFinal.substring(3,10);
      
      
       //llamando el query para obtener la clave del inversionista virtual
       if (numFideicomiso.equals("567")){
      nConsultas.setVtrIntDato1(numFideicomiso.intValue());//fideicomiso
      nConsultas.setVtrIntDato2(numFideicomiso.intValue());//fideicomiso
      nConsultas.querySelect(51);
      if(nConsultas.getSize()>0)
        inversionistaAux=nConsultas.getVtrStrDato1(); 
      }
      else
        inversionistaAux="34";
        
      nConsultas.setVtrIntDato1(numFideicomiso.intValue());//fideicomiso
      nConsultas.querySelect(53);
      if(nConsultas.getSize()>0)
        existeParticipacion=nConsultas.getVtrDoubleDato1();
    }
  %>
  
  <table border="0" cellspacing="0" cellpadding="0">
 <tr>
      <td colspan="9">
        <table border="0" cellspacing="0" cellpadding="0" width="100%" height="127px">
                  <tr>
                      <td width="=30%" height="100%" valign="top">
                        <div align="left"><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg" ></div>
                      </td>
                      <td width="70%">
                          <table width="100%" height="100%">
                                 <tr><td style="font-weight:bolder; font-family: Arial; 10px;" align="center" width="89%"><font size=3><%=session.getAttribute("empresa_1")%></font></td></tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr><td style="font-weight:bolder; font-family: Arial; 10px;" align="center" width="89%"><%=session.getAttribute("empresa_2")%></td></tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr><td style="font-weight:bolder; font-family: Arial; 10px;" align="center" width="89%">Resumen por <%=(nomNivel1=="")?"&nbsp;":nomNivel1%></td></tr>
                                <tr>
                                     <td width= "90%" style="font-weight:bolder; font-family: Arial; 10px;" align="center">DEL <%= (fecInicial=="")?"&nbsp;":fecInicial%> 
                                        <%= (fecFinal=="")?"&nbsp;":fecFinal%>
                                    </td>
                                    
                                       <td style="font-weight:bolder; font-family: Arial; 10px;"><%=BD.getFecha()%></td>
                                   
                                </tr>
                               <tr><td>&nbsp;</td></tr>
                               <tr><td height="6px" colspan="2" valign="top"><hr size="4" noshade="noshade"></td></tr>      
                          </table>
                        
                      </td>
                 </tr>
         </table>
      </td>
    </tr>
    <tr><td colspan="9" >&nbsp;</td></tr>
    <tr><td colspan="9" style="font-weight:bolder; font-family: Arial; 7px;">Fideicomiso: <%=(numFideicomiso.intValue()!=0)?numFideicomiso.toString():"&nbsp;"%> .- <%=(nomFideicomiso=="")?"&nbsp;":nomFideicomiso%>.</td></tr>
    <tr><td colspan="9" >&nbsp;</td></tr>
    <tr><td colspan="9" >&nbsp;</td></tr>
    <tr>
      <td width="200" style="font-weight:bolder; font-family: Arial; 10px;" align="center"><%=(nomNivel1=="")?"&nbsp;":nomNivel1%></td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">No. Invers.</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Saldo Ant.</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Depósitos</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Retiros</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Intereses</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">ISR</td>
      <%if(existeParticipacion!=0){%> 
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Partici.</td>
      <%}%>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Saldo Final</td>
    </tr>
  <%  
    for(int i = 0; i < consulta.size(); i++) {  //Para cada registro     
      registro = (java.util.Map)consulta.get(i);
      //Obtener datos de la BD
      numN1 = (BigDecimal)registro.get("rciNumN1");
      nomN1 = (String)registro.get("rciNomN1");
      numInver = (BigDecimal)registro.get("rciNumInver");
      saldoAnt = (BigDecimal)registro.get("rciSaldoAnt");
      depositos = (BigDecimal)registro.get("rciDepositos");
      retiros = (BigDecimal)registro.get("rciRetiros");
      intereses = (BigDecimal)registro.get("rciIntereses");
      isr = (BigDecimal)registro.get("rciIsr");
      participacion = (BigDecimal)registro.get("rciParticipacion");
      saldoFinal = (BigDecimal)registro.get("rciSaldoFinal");
      inversionista=(String)registro.get("claveInversionista");
      inversionistaAux=inversionistaAux.substring(0,2);
      inversionista=inversionista.substring(0,2);
      //Hacer las sumas para mostrar los totales
       if(!((inversionistaAux.substring(0,2).equals(inversionista.substring(0,2)))&&numFideicomiso.toString().equals("567"))||!numFideicomiso.toString().equals("567")){
      totNoInvers = new BigDecimal(totNoInvers.intValue() + numInver.intValue());
      totSaldoAnt = new BigDecimal(totSaldoAnt.doubleValue() + saldoAnt.doubleValue());
      totDepositos = new BigDecimal(totDepositos.doubleValue() + depositos.doubleValue());
      totRetiros = new BigDecimal(totRetiros.doubleValue() + retiros.doubleValue());
      totIntereses = new BigDecimal(totIntereses.doubleValue() + intereses.doubleValue());
      totIsr = new BigDecimal(totIsr.doubleValue() + isr.doubleValue());
      totParticipacion = new BigDecimal(totParticipacion.doubleValue() + participacion.doubleValue());
     
          totSaldoFinal = new BigDecimal(totSaldoFinal.doubleValue() + saldoFinal.doubleValue());
          if(!(saldoFinal.doubleValue()==0.0)){
  %>
      <tr>
        <td style="font-weight:bolder;font-family: Arial; font-size:9pt;" width="25%"><%=(numN1.intValue()!=0)?numN1.toString():"&nbsp;"%>.- <%=(nomN1=="")?"&nbsp;":nomN1%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(numInver.intValue()==0)?"0":DecimalFormatUtils.getFormatedNumber("###,###", numInver)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(saldoAnt.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", saldoAnt)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", depositos)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", retiros)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(intereses.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", intereses)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(isr.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", isr)%></td>
      <%if(existeParticipacion!=0){%> 
        <td style="font-weight; font-family: Arial;font-size:11pt;" align="right"><%=(participacion.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", participacion)%></td>
      <%}%>
        <td style="font-weight; font-family: Arial;font-size:11pt;" align="right"><%=(saldoFinal.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", saldoFinal)%></td>
      </tr>
  <%
      //Si se trata del último resgistro, presentar la información del último Total
      }
      }
      if(i==(consulta.size()-1))
      {
       
  %>
        <tr><td colspan="9">&nbsp;</td></tr>
        <tr><td>&nbsp;</td><td colspan="9"><hr size="7" noshade="noshade" ></td></tr>
        <tr>
          <td style="font-weight:bolder; font-family: Arial; 10px;" width="25%">Totales</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totNoInvers.intValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###", totNoInvers)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totSaldoAnt.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totSaldoAnt)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totDepositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totDepositos)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totRetiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totRetiros)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totIntereses.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totIntereses)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totIsr.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totIsr)%></td>
          <%if(existeParticipacion!=0){%>  
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totParticipacion.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totParticipacion)%></td>
          <%}%>  
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totSaldoFinal.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totSaldoFinal)%></td>
        </tr>
  <%
    
      }
    }//Fin de las iteraciones para los registros
  %>
  </table> 
  
  </body>
</html>