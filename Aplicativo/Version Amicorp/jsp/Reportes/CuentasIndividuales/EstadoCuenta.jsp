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
    double existeParticipacion=0.0;    
    
    
    //Variables auxiliares para la lógica e impresión
    BigDecimal totDepositos = new BigDecimal(0);
    BigDecimal totRetiros = new BigDecimal(0);
    BigDecimal totIntereses = new BigDecimal(0);
    BigDecimal totIsr = new BigDecimal(0);
    BigDecimal totParticipacion = new BigDecimal(0);
    BigDecimal totSaldoFinal = new BigDecimal(0);
    
    
    if(consulta.size() > 0) {
      registro = (java.util.Map)consulta.get(0);
      nomNivel3 = (String)registro.get("rciNomNivel3");
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
      fecInicial= "01"+fecFinal.substring(6,fecFinal.length());
      
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
                                <% if(nomNivel3!=null) {%>
                                <tr><td style="font-weight:bolder; font-family: Arial; 10px;" align="center" width="89%">Estado&nbsp;de&nbsp;Cuenta por <%=(nomNivel3=="")?"&nbsp;":nomNivel3%></td></tr>
                                <%}%>
                                <tr>
                                     <td width= "90%" style="font-weight:bolder; font-family: Arial; 10px;" align="center"> DEL <%= (fecInicial=="")?"&nbsp;":fecInicial%>  
                                        <%= (fecFinal=="")?"&nbsp;":fecFinal%>
                                    </td>
                                    <td style="font-weight:bolder; font-family: Arial; 10px;"><%=BD.getFecha()%></td>
                                </tr>
                               <tr><td>&nbsp;</td></tr>    
                          </table>
                        
                      </td>
                 </tr>
         </table>
      </td>
    </tr>
    
    <tr><td colspan="9" style="font-weight:bolder; font-family: Arial; 10px;">Fideicomiso: <%=(numFideicomiso.intValue()!=0)?numFideicomiso.toString():"&nbsp;"%> .- <%=(nomFideicomiso=="")?"&nbsp;":nomFideicomiso%>.</td></tr>
    <tr><td colspan="9">&nbsp;</td></tr>
    <%if(nomNivel1!=null&&nomNivel2==null){%>
    <tr><td colspan="9" style="font-weight:bolder; font-family: Arial;font-size:11pt;"><%=(nomNivel1=="")?"&nbsp;":nomNivel1%>: <%=(numN1.intValue()!=0)?numN1.toString():"&nbsp;"%> - <%=(nomN1=="")?"&nbsp;":nomN1%></td></tr>
    <%}
    else if(nomNivel2!=null&&nomNivel3==null){%>
    <tr><td colspan="9" style="font-weight:bolder;font-family: Arial; font-size:11pt;"><%=(nomNivel1=="")?"&nbsp;":nomNivel1%>: <%=(numN1.intValue()!=0)?numN1.toString():"&nbsp;"%> - <%=(nomN1=="")?"&nbsp;":nomN1%></td></tr>
    <tr><td colspan="9" style="font-weight:bolder; font-family: Arial;font-size:11pt;"><%=(nomNivel2==null)?"&nbsp;":nomNivel2%>: <%=numN2==null?"&nbsp;":(numN2.intValue()!=0)?numN2.toString():"&nbsp;"%> - <%=(nomN2=="")?"&nbsp;":nomN2%></td></tr>
    <%
    }
    else if(nomNivel3!=null){
    %>
    <tr><td colspan="9" style="font-weight:bolder;font-family: Arial; font-size:11pt;"><%=(nomNivel1=="")?"&nbsp;":nomNivel1%>: <%=(numN1.intValue()!=0)?numN1.toString():"&nbsp;"%> - <%=(nomN1=="")?"&nbsp;":nomN1%></td></tr>
    <tr><td colspan="9" style="font-weight:bolder; font-family: Arial;font-size:11pt;"><%=(nomNivel2==null)?"&nbsp;":nomNivel2%>: <%=numN2==null?"&nbsp;":(numN2.intValue()!=0)?numN2.toString():"&nbsp;"%> - <%=(nomN2=="")?"&nbsp;":nomN2%></td></tr>
    <tr><td colspan="9" style="font-weight:bolder; font-family: Arial;font-size:11pt;"><%=(nomNivel3==null)?"&nbsp;":nomNivel3%>: <%=numN3==null?"&nbsp;":(numN3.intValue()!=0)?numN3.toString():"&nbsp;"%> - <%=(nomInvers=="")?"&nbsp;":nomInvers%></td></tr>
    <%    
    }%>
    <tr><td colspan="9">&nbsp;</td></tr>
    <tr>
      <td width="80" style="font-weight:bolder; font-family: Arial; 10px;" align="center">Fecha</td>
      <td width="130" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Tasa</td>
      <td width="130" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Depósitos</td>
      <td width="130" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Retiros</td>
      <td width="130" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Intereses</td>
      <td width="130" style="font-weight:bolder; font-family: Arial; 10px;" align="right">ISR</td>
      <%if(existeParticipacion!=0 && numN1.intValue()!=34){%>  
      <td width="180" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Saldo Parcial</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Partici.</td>
      <%}%>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Saldo Final</td>
    </tr>
  <%  
    for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
      registro = (java.util.Map)consulta.get(i);
      //Obtener datos de la BD
      fecha = (String)registro.get("rciFecha");
      tasa = (BigDecimal)registro.get("rciTasa");
      depositos = (BigDecimal)registro.get("rciDepositos");
      retiros = (BigDecimal)registro.get("rciRetiros");
      intereses = (BigDecimal)registro.get("rciIntereses");
      isr = (BigDecimal)registro.get("rciIsr");
      saldoParcial = (BigDecimal)registro.get("rciSaldoParcial");
      participacion = (BigDecimal)registro.get("rciParticipacion");
      saldoFinal = (BigDecimal)registro.get("rciSaldoFinal");
      
      //Hacer las sumas para mostrar los totales
      totDepositos = new BigDecimal(totDepositos.doubleValue() + depositos.doubleValue());
      totRetiros = new BigDecimal(totRetiros.doubleValue() + retiros.doubleValue());
      totIntereses = new BigDecimal(totIntereses.doubleValue() + intereses.doubleValue());
      totIsr = new BigDecimal(totIsr.doubleValue() + isr.doubleValue());
      totParticipacion = new BigDecimal(totParticipacion.doubleValue() + participacion.doubleValue());
      totSaldoFinal = new BigDecimal(saldoFinal.doubleValue());
      //totSaldoFinal = new BigDecimal(totSaldoFinal.doubleValue()+saldoFinal.doubleValue());
      if(!(saldoFinal.doubleValue()==0.0)){
  %>
      <tr>
        <td style="font-weight;font-family: Arial; font-size:11pt;"><%=fecha%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(tasa.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", tasa)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", depositos)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", retiros)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(intereses.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", intereses)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(isr.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", isr)%></td>
       <%if(existeParticipacion!=0 && numN1.intValue()!=34){%> 
        <td style="font-weight; font-family: Arial;font-size:11pt;" align="right"><%=(saldoParcial.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", saldoParcial)%></td>
        <td style="font-weight;font-family: Arial; font-size:11pt;" align="right"><%=(participacion.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", participacion)%></td>
       <%}%>
        <td style="font-weight; font-family: Arial;font-size:11pt;" align="right"><%=(saldoFinal.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", saldoFinal)%></td>
      </tr>
  <%
      //Si se trata del último resgistro, presentar la información del último sub-total
      }
      if(i==(consulta.size()-1))
      {
  %>
        <tr><td colspan="9">&nbsp;</td></tr>
        <tr><td>&nbsp;</td><td colspan="9"><hr size="7" noshade="noshade" ></td></tr>
        <tr>
          <td style="font-weight:bolder; font-family: Arial; 10px;" height="2">Totales</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right" height="2">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right" height="2"><%=(totDepositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totDepositos)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right" height="2"><%=(totRetiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totRetiros)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right" height="2"><%=(totIntereses.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totIntereses)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right" height="2"><%=(totIsr.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totIsr)%></td>
        <%if(existeParticipacion!=0 && numN1.intValue()!=34){%> 
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right" height="2">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right" height="2"><%=(totParticipacion.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totParticipacion)%></td>
        <%}%>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right" height="2"><%=(totSaldoFinal.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totSaldoFinal)%></td>
        </tr>
  <%
      }
    }//Fin de las iteraciones para los registros
  %>
  </table>
  
  </body>
</html>