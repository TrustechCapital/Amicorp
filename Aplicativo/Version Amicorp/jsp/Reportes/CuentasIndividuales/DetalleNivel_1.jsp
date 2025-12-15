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
    //subtotales
    BigDecimal subTotNoInvers = new BigDecimal(0);
    BigDecimal subTotSaldoAnt = new BigDecimal(0);
    BigDecimal subTotDepositos = new BigDecimal(0);
    BigDecimal subTotRetiros = new BigDecimal(0);
    BigDecimal subTotIntereses = new BigDecimal(0);
    BigDecimal subTotIsr = new BigDecimal(0);
    BigDecimal subTotParticipacion = new BigDecimal(0);
    BigDecimal subTotSaldoFinal = new BigDecimal(0);
    BigDecimal numN1Aux = new BigDecimal(0);
    BigDecimal acn1 = new BigDecimal(1);  // A cambiado de valor numN1 ? 0 = no, 1 = si
    
    //Variables auxiliares para la lógica e impresión
    BigDecimal totSaldoAnt = new BigDecimal(0);
    BigDecimal totDepositos = new BigDecimal(0);
    BigDecimal totRetiros = new BigDecimal(0);
    BigDecimal totIntereses = new BigDecimal(0);
    BigDecimal totIsr = new BigDecimal(0);
    BigDecimal totParticipacion = new BigDecimal(0);
    BigDecimal totSaldoFinal = new BigDecimal(0);
    BigDecimal ctrEncabezado = new BigDecimal(0);
    
    
    if(consulta.size() > 0) {
     
      registro = (java.util.Map)consulta.get(0);
      numFideicomiso = (BigDecimal)registro.get("rciNumFideicomiso");
      nomFideicomiso = (String)registro.get("rciNomFideicomiso");
      nomNivel1 = (String)registro.get("rciNomNivel1");
      nomNivel2 = (String)registro.get("rciNomNivel2");
      nomNivel3 = (String)registro.get("rciNomNivel3");
      
      numN1 = (BigDecimal)registro.get("rciNumN1");
      numN1Aux = new BigDecimal(numN1.doubleValue());
      
      numN2 = (BigDecimal)registro.get("rciNumN2");
      numN3 = (BigDecimal)registro.get("rciNumN3");
      //nomN1 = (String)registro.get("rciNomN1");
      nomN2 = (String)registro.get("rciNomN2");
      nomInvers = (String)registro.get("rciNomInvers");
      fecFinal = (String)registro.get("rciPeriodo");
      fecInicial= "01/"+fecFinal.substring(3,10);
      numN1Aux = (BigDecimal)registro.get("rciNumN1");
      
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
                                <tr><td style="font-weight:bolder;font-family: Arial;" align="center" width="89%">Detalle por <%=(nomNivel1=="")?"&nbsp;":nomNivel1%></td></tr>
                                <tr>
                                     <td width= "90%" style="font-weight:bolder;font-family: Arial;" align="center"> DEL <%= (fecInicial=="")?"&nbsp;":fecInicial%> 
                                        <%= (fecFinal=="")?"&nbsp;":fecFinal%>
                                    </td>
                                    <td style="font-weight:bolder;font-family: Arial;"><%=BD.getFecha()%></td>
                                </tr>
                               <tr><td>&nbsp;</td></tr>
                               <tr><td height="6px" colspan="2" valign="top"><hr size="4" noshade="noshade"></td></tr>
                          </table>
                        
                      </td>
                 </tr>
         </table>
      </td>
    </tr>
    <tr><td colspan="8">&nbsp;</td></tr>
    <tr><td colspan="8" style="font-weight:bolder; font-family: Arial; 10px;">Fideicomiso: <%=(numFideicomiso.intValue()!=0)?numFideicomiso.toString():"&nbsp;"%> .- <%=(nomFideicomiso=="")?"&nbsp;":nomFideicomiso%>.</td></tr>
    <tr><td colspan="8">&nbsp;</td></tr>
    <!--<tr>
      <td width="200" style="font-weight:bolder; font-family: Arial; 10px;" align="center"><%=(nomNivel3=="")?"&nbsp;":(nomNivel3==null)?"&nbsp;":nomNivel3%></td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Saldo Ant.</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Depósitos</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Retiros</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Intereses</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">ISR</td>
      <%if(existeParticipacion!=0){%>  
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Partici.</td>
      <%}%>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Saldo Final</td>
    </tr>-->
  <%  
    for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
      registro = (java.util.Map)consulta.get(i);
      //Obtener datos de la BD
      
      //controlando el valor del nivel 1
      if(acn1.intValue()==1){
         //numN1 = new BigDecimal(numN1.intValue());
         numN1 = (BigDecimal)registro.get("rciNumN1");
         acn1 = new BigDecimal(0);
      } else {
          numN1 = (BigDecimal)registro.get("rciNumN1");
      }
     
      
      numN3 = (BigDecimal)registro.get("rciNumN3");
      nomInvers = (String)registro.get("rciNomInvers");
      saldoAnt = (BigDecimal)registro.get("rciSaldoAnt");
      depositos = (BigDecimal)registro.get("rciDepositos");
      retiros = (BigDecimal)registro.get("rciRetiros");
      intereses = (BigDecimal)registro.get("rciIntereses");
      isr = (BigDecimal)registro.get("rciIsr");
      participacion = (BigDecimal)registro.get("rciParticipacion");
      saldoFinal = (BigDecimal)registro.get("rciSaldoFinal");
      nomN1 = (String)registro.get("rciNomN1");
      
      //Hacer las sumas para mostrar los totales
      totSaldoAnt = new BigDecimal(totSaldoAnt.doubleValue() + saldoAnt.doubleValue());
      totDepositos = new BigDecimal(totDepositos.doubleValue() + depositos.doubleValue());
      totRetiros = new BigDecimal(totRetiros.doubleValue() + retiros.doubleValue());
      totIntereses = new BigDecimal(totIntereses.doubleValue() + intereses.doubleValue());
      totIsr = new BigDecimal(totIsr.doubleValue() + isr.doubleValue());
      totParticipacion = new BigDecimal(totParticipacion.doubleValue() + participacion.doubleValue());
      totSaldoFinal = new BigDecimal(totSaldoFinal.doubleValue() + saldoFinal.doubleValue());
      
      
      if(numN1.equals(numN1Aux)){  // MOSTRAR SOLO EL DETALLE 
              if(!(saldoFinal.doubleValue()==0.0)){ 
                 if(ctrEncabezado.intValue()==0){
                 ctrEncabezado=new BigDecimal(ctrEncabezado.intValue() + 1); //rompiendo la condicion
            %>
                    <tr><td style="font-weight; font-size:9pt;" colspan="8" align="center">&nbsp;</td></tr>
                    <tr><td style="font-weight:bolder; font-family: Arial; 12px;" colspan="8" align="center"><%=(nomN1)==null?"&nbsp;":nomN1%></td></tr>
                    <tr><td style="font-weight; font-size:9pt;" colspan="8" align="center">&nbsp;</td></tr>
                    <tr><td style="font-weight; font-size:9pt;" colspan="8" align="center">&nbsp;</td></tr>
                    <tr>
                          <td width="200" style="font-weight:bolder; font-family: Arial; 10px;" align="center"><%=(nomNivel3=="")?"&nbsp;":(nomNivel3==null)?"&nbsp;":nomNivel3%></td>
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
                 }
            %>
                <tr>
                  <td style="font-weight;font-family: Arial; font-size:9pt;" width="25%"><%=(nomInvers=="")?"&nbsp;":nomInvers%></td>
                  <td align="right" style="font-weight;font-family: Arial; font-size:11pt;"><%=(saldoAnt.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", saldoAnt)%></td>
                  <td align="right" style="font-weight;font-family: Arial; font-size:11pt;"><%=(depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", depositos)%></td>
                  <td align="right" style="font-weight;font-family: Arial; font-size:11pt;"><%=(retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", retiros)%></td>
                  <td align="right" style="font-weight;font-family: Arial; font-size:11pt;"><%=(intereses.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", intereses)%></td>
                  <td align="right" style="font-weight;font-family: Arial; font-size:11pt;"><%=(isr.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", isr)%></td>
                  <%if(existeParticipacion!=0){%>  
                  <td align="right" style="font-weight;font-family: Arial; font-size:11pt;"><%=(participacion.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", participacion)%></td>
                  <%}%>
                  <td align="right" style="font-weight;font-family: Arial; font-size:11pt;"><%=(saldoFinal.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", saldoFinal)%></td>  
                </tr>
            <%
                 //para sacar subtotales por nivel
                  subTotSaldoAnt = new BigDecimal(subTotSaldoAnt.doubleValue() + saldoAnt.doubleValue());
                  subTotDepositos = new BigDecimal(subTotDepositos.doubleValue() + depositos.doubleValue());
                  subTotRetiros = new BigDecimal(subTotRetiros.doubleValue() + retiros.doubleValue());
                  subTotIntereses = new BigDecimal(subTotIntereses.doubleValue() + intereses.doubleValue());
                  subTotIsr = new BigDecimal(subTotIsr.doubleValue() + isr.doubleValue());
                  subTotParticipacion = new BigDecimal(subTotParticipacion.doubleValue() + participacion.doubleValue());
                  subTotSaldoFinal = new BigDecimal(subTotSaldoFinal.doubleValue() + saldoFinal.doubleValue());
                 
          }
      }
      
      
      else { // MOSTRAR SUBTOTALES
                ctrEncabezado=new BigDecimal(0);//variable que controla que no se repita el encabezado nivel 1, si llego a este punto es que viene otro encabezado
                numN1Aux=(BigDecimal)registro.get("rciNumN1");
               acn1 = new BigDecimal(1);
               i=i-1;
               //if(!(saldoFinal.doubleValue()==0.0)){
        %>
           <tr>
                <td style="font-weight:bolder; font-family: Arial; 10px;">Subtotales</td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotSaldoAnt.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotSaldoAnt)%><hr/></td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotDepositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotDepositos)%><hr/></td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotRetiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotRetiros)%><hr/></td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotIntereses.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotIntereses)%><hr/></td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotIsr.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotIsr)%><hr/></td>
                <%if(existeParticipacion!=0){%>  
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotParticipacion.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotParticipacion)%><hr/></td>
                <%}%>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotSaldoFinal.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotSaldoFinal)%><hr/></td>
              </tr>
      <%
                //SE INICIALIZAN LOS SUBTOTALES PARA EL SIGUIENTE NIVEL
                subTotSaldoAnt = new BigDecimal(0);
                subTotDepositos = new BigDecimal(0);
                subTotRetiros = new BigDecimal(0);
                subTotIntereses = new BigDecimal(0);
                subTotIsr = new BigDecimal(0);
                subTotParticipacion =new BigDecimal(0);
                subTotSaldoFinal =new BigDecimal(0);
       //}
    } 
              
              
              
      //Si se trata del último resgistro, presentar la información de los ultimos subtotales y del gran Total
      if(i==(consulta.size()-1)){
         %>
         
                
                <tr>
                <td style="font-weight:bolder; font-family: Arial; 10px;">Subtotales</td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotSaldoAnt.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotSaldoAnt)%><hr/></td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotDepositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotDepositos)%><hr/></td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotRetiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotRetiros)%><hr/></td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotIntereses.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotIntereses)%><hr/></td>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotIsr.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotIsr)%><hr/></td>
                <%if(existeParticipacion!=0){%>  
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotParticipacion.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotParticipacion)%><hr/></td>
                <%}%>
                <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(subTotSaldoFinal.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotSaldoFinal)%><hr/></td>
                </tr>
                
                
                <tr><td colspan="8">&nbsp;</td></tr>
                <tr><td>&nbsp;</td><td colspan="9"><hr size="7" noshade="noshade" ></td></tr>
                <tr>
                  <td style="font-weight:bolder; font-family: Arial; 10px;" width="25%">Totales</td>
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