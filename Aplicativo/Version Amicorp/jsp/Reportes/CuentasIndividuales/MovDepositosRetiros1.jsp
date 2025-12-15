<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<jsp:useBean id="BD"  class="com.nafin.negocio.FiduciaBD"/>
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
    
    
    //Variables auxiliares para la lógica e impresión
    BigDecimal totsNiv3Depositos = new BigDecimal(0);
    BigDecimal totsNiv2Depositos = new BigDecimal(0);
    BigDecimal totsNiv1Depositos = new BigDecimal(0);
    BigDecimal totsNiv3Retiros = new BigDecimal(0);
    BigDecimal totsNiv2Retiros = new BigDecimal(0);
    BigDecimal totsNiv1Retiros = new BigDecimal(0);
    
    String nomN1EnCurso = "";
    String nomN2EnCurso = "";
    boolean primerNivel_1 = true;
    boolean primerNivel_2 = true;
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
                                <!--<tr><td style="font-weight:bolder; font-family: Arial; 10px;" align="center" width="89%">Resumen por <%=(nomNivel3=="")?"&nbsp;":nomNivel3%></td></tr>-->
                                <tr><td style="font-weight:bolder; font-family: Arial; 10px;" align="center" width="89%">Depósitos y retiros</td></tr>
                                <!--<tr>
                                     <td width= "90%" style="font-weight:bolder; font-family: Arial; 10px;" align="center"> &nbsp;<%= (fecInicial=="")?"&nbsp;":fecInicial%> al 
                                        <%= (fecFinal=="")?"&nbsp;":fecFinal%>
                                    </td>
                                    <td width= "10%">
                                        <td style="font-weight:bolder; font-family: Arial; 10px;"><%=BD.getFecha()%></td>
                                    </td>
                                </tr>-->
                               <tr><td>&nbsp;</td></tr>
                               <tr><td height="6px" colspan="2" valign="top"><hr size="4" noshade="noshade"></td></tr>      
                          </table>
                        
                      </td>
                 </tr>
         </table>
      </td>
    </tr>
    <tr>
        <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="center">&nbsp;</td>
    </tr>
    <tr>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="center">Fecha</td>
      <td width="150" style="font-weight:bolder; font-family: Arial; 10px;" align="center">Clave ID</td>
      <td width="300" style="font-weight:bolder; font-family: Arial; 10px;" align="center">&nbsp;</td>
      <td width="200" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Depósitos</td>
      <td width="200" style="font-weight:bolder; font-family: Arial; 10px;" align="right">Retiros</td>
    </tr>
    <tr><td colspan="5"><hr/></td></tr>
  <%
    for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
      registro = (java.util.Map)consulta.get(i);
      //Obtener datos de la BD
      fecha = (String)registro.get("rciFecha");
      numN1 = (BigDecimal)registro.get("rciNumN1");
      nomN1 = (String)registro.get("rciNomN1");
      numN2 = (BigDecimal)registro.get("rciNumN2");
      nomN2 = (String)registro.get("rciNomN2");
      numN3 = (BigDecimal)registro.get("rciNumN3");
      nomInvers = (String)registro.get("rciNomInvers");
      depositos = (BigDecimal)registro.get("rciDepositos");
      retiros = (BigDecimal)registro.get("rciRetiros");
      fecFinal = (String)registro.get("rciPeriodo");
      fecInicial= "01"+fecFinal.substring(3,10);
      
      
      if(!nomN1.equals(nomN1EnCurso)) //Primer Corte
      {
        i--;
        nomN1EnCurso = nomN1;
        primerNivel_2 = true;
        if(!primerNivel_1)
        {
  %>
          <tr>
            <td colspan="3">&nbsp;</td>
            <td colspan="2"><hr/></td>
          </tr>
          <tr>
            <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
            <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
            <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
            <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totsNiv3Depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv3Depositos)%></td>
            <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totsNiv3Retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv3Retiros)%></td>
          </tr>
          
          <tr><td colspan="5"><hr/></td></tr>
          <tr>
            <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
            <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
            <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
            <td style="font-weight:bolder; font-family: Arial; 10px;" align="right">$<%=(totsNiv2Depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv2Depositos)%></td>
            <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totsNiv2Retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv2Retiros)%></td>
          </tr>
  <%
          totsNiv2Depositos = new BigDecimal(0);
          totsNiv2Retiros = new BigDecimal(0);
          totsNiv3Depositos = new BigDecimal(0);
          totsNiv3Retiros = new BigDecimal(0);
        }
        else
          primerNivel_1 = false;
  %>
        <tr>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td align="center" style="font-weight:bolder; font-size:11pt;"><%=(numN1.intValue()==0)?"0":DecimalFormatUtils.getFormatedNumber("###,###", numN1)%></td>
          <td align="left" style="font-weight:bolder; font-size:11pt;"><%=(nomN1==""?"&nbsp;":nomN1)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
        </tr>
  <%
      } //Fin de Primer Corte
      else //Empieza else del Primer Corte
      {
        if(!nomN2.equals(nomN2EnCurso)) //Segundo Corte
        {
          i--;
          nomN2EnCurso = nomN2;
          if(!primerNivel_2)
          {
  %>
            <tr>
              <td colspan="3">&nbsp;</td>
              <td colspan="2"><hr/></td>
            </tr>
            <tr>
              <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
              <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
              <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
              <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totsNiv3Depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv3Depositos)%></td>
              <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totsNiv3Retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv3Retiros)%></td>
            </tr>
  <%
            totsNiv3Depositos = new BigDecimal(0);
            totsNiv3Retiros = new BigDecimal(0);
          }
          else
            primerNivel_2=false;
  %>
          <tr>
            <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
            <td align="center" style="font-weight:bolder; font-size:11pt;"><%=(numN2.intValue()==0)?"0":DecimalFormatUtils.getFormatedNumber("###,###", numN2)%></td>
            <td align="left" style="font-weight:bolder; font-size:11pt;"><%=(nomN2==""?"&nbsp;":nomN2)%></td>
            <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
            <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          </tr>
  <%
        }
        else //Else del Segundo Corte
        {
          totsNiv1Depositos = new BigDecimal(totsNiv1Depositos.doubleValue() + depositos.doubleValue());
          totsNiv1Retiros = new BigDecimal(totsNiv1Retiros.doubleValue() + retiros.doubleValue());
          totsNiv2Depositos = new BigDecimal(totsNiv2Depositos.doubleValue() + depositos.doubleValue());
          totsNiv2Retiros = new BigDecimal(totsNiv2Retiros.doubleValue() + retiros.doubleValue());
          totsNiv3Depositos = new BigDecimal(totsNiv3Depositos.doubleValue() + depositos.doubleValue());
          totsNiv3Retiros = new BigDecimal(totsNiv3Retiros.doubleValue() + retiros.doubleValue());
  %>
          <tr>
            <td style="font-weight; font-size:11pt;"><%=(fecha=="")?"&nbsp;":fecha%></td>
            <td align="center" style="font-weight; font-size:11pt;"><%=(numN3.intValue()==0)?"0":DecimalFormatUtils.getFormatedNumber("###,###", numN3)%></td>
            <td align="left" style="font-weight; font-size:11pt;"><%=(nomInvers==""?"&nbsp;":nomInvers)%></td>
            <td align="right" style="font-weight; font-size:11pt;"><%=(depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", depositos)%></td>
            <td align="right" style="font-weight; font-size:11pt;"><%=(retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", retiros)%></td>
          </tr>
  <%
        } //Else del Segundo Corte
      }//Else del Primer Corte
      
      //Si se trata del último resgistro, presentar la información del último Total
      if(i==(consulta.size()-1))
      {
  %>
        <tr>
          <td colspan="3">&nbsp;</td>
          <td colspan="2"><hr/></td>
        </tr>
        <tr>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totsNiv3Depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv3Depositos)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totsNiv3Retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv3Retiros)%></td>
        </tr>
        
        <tr><td>&nbsp;</td><td colspan="9"><hr size="7" noshade="noshade" ></td></tr>
        <tr>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right">$<%=(totsNiv2Depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv2Depositos)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totsNiv2Retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv2Retiros)%></td>
        </tr>
        
        <tr><td>&nbsp;</td><td colspan="9"><hr size="7" noshade="noshade" ></td></tr>
        <tr>
          <td style="font-weight:bolder; font-family: Arial; 10px;">Total General</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td style="font-weight:bolder; font-family: Arial; 10px;">&nbsp;</td>
          <td V align="right">$<%=(totsNiv1Depositos.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv1Depositos)%></td>
          <td style="font-weight:bolder; font-family: Arial; 10px;" align="right"><%=(totsNiv1Retiros.doubleValue()==0.0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totsNiv1Retiros)%></td>
        </tr>
  <%
      }
    }//Fin de las iteraciones para los registros
  %>
  </table>
  
  </body>
</html>