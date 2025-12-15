<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  <body>
  
  <%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    String conAdmon = "";
    String fisoOContrato = "";
    String tipoNegocio = "";
    BigDecimal numContrato = new BigDecimal(-1);
    String nomContrato = "";
    String encCtam = "";
    String encScta = "";
    String encSscta = "";
    String encCuenta = "";
    BigDecimal saldoInicial = new BigDecimal(-1);
    BigDecimal cargos = new BigDecimal(-1);
    BigDecimal abonos = new BigDecimal(-1);
    BigDecimal saldoActual = new BigDecimal(-1);
    
    //Variables auxiliares para llevara  cabo los cortes
    String EncSctaEnCurso = "PRIMER_REGISTRO";
    String EncSsctaEnCurso = "PRIMER_REGISTRO";
    
    //Variables auxiliares para la lógica e impresión
    BigDecimal subTotalMandatosConSaldoInicial = new BigDecimal(0);
    BigDecimal subTotalMandatosConCargos = new BigDecimal(0);
    BigDecimal subTotalMandatosConAbonos = new BigDecimal(0);
    BigDecimal subTotalMandatosConSaldoActual = new BigDecimal(0);
    
    BigDecimal subTotalMandatosSinSaldoInicial = new BigDecimal(0);
    BigDecimal subTotalMandatosSinCargos = new BigDecimal(0);
    BigDecimal subTotalMandatosSinAbonos = new BigDecimal(0);
    BigDecimal subTotalMandatosSinSaldoActual = new BigDecimal(0);
    
    BigDecimal subTotalFideicomisosConSaldoInicial = new BigDecimal(0);
    BigDecimal subTotalFideicomisosConCargos = new BigDecimal(0);
    BigDecimal subTotalFideicomisosConAbonos = new BigDecimal(0);
    BigDecimal subTotalFideicomisosConSaldoActual = new BigDecimal(0);
    
    BigDecimal subTotalFideicomisosSinSaldoInicial = new BigDecimal(0);
    BigDecimal subTotalFideicomisosSinCargos = new BigDecimal(0);
    BigDecimal subTotalFideicomisosSinAbonos = new BigDecimal(0);
    BigDecimal subTotalFideicomisosSinSaldoActual = new BigDecimal(0);
    
    BigDecimal totalSubtotalesConSinSaldoInicial = new BigDecimal(0);
    BigDecimal totalSubtotalesConSinCargos = new BigDecimal(0);
    BigDecimal totalSubtotalesConSinAbonos = new BigDecimal(0);
    BigDecimal totalSubtotalesConSinSaldoActual = new BigDecimal(0);
    
    BigDecimal totalTotalesSaldoInicial = new BigDecimal(0);
    BigDecimal totalTotalesCargos = new BigDecimal(0);
    BigDecimal totalTotalesAbonos = new BigDecimal(0);
    BigDecimal totalTotalesSaldoActual = new BigDecimal(0);
    
    BigDecimal auxiliar = new BigDecimal(0);
    String tipoNegocioAnterior = "PRIMER_REGISTRO";
  %>
  
  
  <table border='0' bordercolor='#000000' bgcolor='#FFFFFF' >
		<tr>		
		<td>
			<table width='738'>
				<tr>
					<td align="CENTER" class='style15'><span class="style14">PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.</span></td>
				</tr>
				<tr>
					<td><div align='center' class='style15'>DIVISION FIDUCIARIA</div></td>
				</tr>
				<tr>
        <td><div align='center' class='style15'><span class='style16'>BALANZA DE CUENTAS DE ORDEN</span></div></td>
      </tr>
      <tr><td height='23'>&nbsp;</td></tr>
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
  

  <table border="0" cellspacing="0" cellpadding="0">
    <tr>
      <th>CTAM</th>
      <th>S1</th>
      <th>S2</th>
      <th colspan="2">&nbsp;</th>
      <th colspan="2">DESCRIPCION</th>
      <th width="200">SALDO ANTERIOR</th>
      <th width="200">CARGO</th>
      <th width="200">ABONO</th>
      <th width="200">SALDO ACTUAL</th>
    </tr>
    <tr><td colspan="11">&nbsp;</td></tr>
  <%
    for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
      registro = (java.util.Map)consulta.get(i);
      //Obtener datos de la BD
      conAdmon = (String)registro.get("ctoTipoAdmon");
      fisoOContrato = (String)registro.get("ctoCveTipoNeg");
      tipoNegocio = (String)registro.get("rcmTipoNegocio");
      numContrato = (BigDecimal)registro.get("rcmNumContrato");
      nomContrato = (String)registro.get("rcmNomContrato");
      encCtam = (String)registro.get("rcmEncCtam");
      encScta = (String)registro.get("rcmEncScta");
      encSscta = (String)registro.get("rcmEncSscta");
      encCuenta = (String)registro.get("rcmEncCuenta");
      saldoInicial = (BigDecimal)registro.get("rcmSini");
      cargos = (BigDecimal)registro.get("rcmCargos");
      abonos = (BigDecimal)registro.get("rcmAbonos");
      saldoActual = (BigDecimal)registro.get("rcmSact");
      
      if(!encScta.equals(EncSctaEnCurso)) { //Primer corte: RCM_ENC_SCTA
        
        if(!EncSctaEnCurso.equals("PRIMER_REGISTRO") || EncSctaEnCurso.equals("ULTIMO_REGISTRO")) { //Si no es la primera vez que ingresa, colocar el TOTAL de SUBTOTALES
  %>
          <tr><td colspan="11">&nbsp;</td></tr>
          <tr><td colspan="11">&nbsp;</td></tr>
          <tr>
            <td colspan="4">&nbsp;</td>
            <td width="100" style="font-weight:bolder"><%=tipoNegocioAnterior%></td>
            <td width="30">&nbsp;</td>
            <td style="font-weight:bolder">TOTALES:</td>
            <td align="right"><%=(totalSubtotalesConSinSaldoInicial.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalSubtotalesConSinSaldoInicial)%></td>
            <td align="right"><%=(totalSubtotalesConSinCargos.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalSubtotalesConSinCargos)%></td>
            <td align="right"><%=(totalSubtotalesConSinAbonos.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalSubtotalesConSinAbonos)%></td>
            <td align="right"><%=(totalSubtotalesConSinSaldoActual.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalSubtotalesConSinSaldoActual)%></td>
          </tr>
          <tr>
            <td colspan="6">&nbsp;</td>
              <td>TOTAL CUENTA:</td>
              <td align="right"><%=(totalSubtotalesConSinSaldoInicial.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalSubtotalesConSinSaldoInicial)%></td>
              <td align="right"><%=(totalSubtotalesConSinCargos.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalSubtotalesConSinCargos)%></td>
              <td align="right"><%=(totalSubtotalesConSinAbonos.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalSubtotalesConSinAbonos)%></td>
              <td align="right"><%=(totalSubtotalesConSinSaldoActual.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalSubtotalesConSinSaldoActual)%></td>
          </tr>
          <tr><td colspan="11">&nbsp;</td></tr>
          <tr><td colspan="11">&nbsp;</td></tr>
          <tr><td colspan="11">&nbsp;</td></tr>
  <%
          //Incrementar los TOTALES FINALES
          totalTotalesSaldoInicial = new BigDecimal(totalTotalesSaldoInicial.doubleValue()+totalSubtotalesConSinSaldoInicial.doubleValue());
          totalTotalesCargos = new BigDecimal(totalTotalesCargos.doubleValue()+totalSubtotalesConSinCargos.doubleValue());
          totalTotalesAbonos = new BigDecimal(totalTotalesAbonos.doubleValue()+totalSubtotalesConSinAbonos.doubleValue());
          totalTotalesSaldoActual = new BigDecimal(totalTotalesSaldoActual.doubleValue()+totalSubtotalesConSinSaldoActual.doubleValue());
          //Volver a ceros los Totales de los Subtotales
          totalSubtotalesConSinSaldoInicial = new BigDecimal(0);
          totalSubtotalesConSinCargos = new BigDecimal(0);
          totalSubtotalesConSinAbonos = new BigDecimal(0);
          totalSubtotalesConSinSaldoActual = new BigDecimal(0);
        }//Fin de colocar TOTAL de SUBTOTALES
        
        
        if(!EncSctaEnCurso.equals("ULTIMO_REGISTRO")) {//Si no es el último registro, Imprimir encabezados siguientes
          i--;
          EncSsctaEnCurso = "PRIMER_REGISTRO";
  %>
          <tr>
            <td colspan="4" style="font-weight:bolder"><%=tipoNegocio%></td>
            <td colspan="7">&nbsp;</td>
          </tr>
  <%
        }//Fin de if no ULTIMO_REGISTRO
        else { //Si ya es el ULTIMO_REGISTRO
  %>
          <tr>
            <td colspan="6">&nbsp;</td>
              <td>TOTALES GENERALES:</td>
              <td align="right"><%=(totalTotalesSaldoInicial.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalTotalesSaldoInicial)%></td>
              <td align="right"><%=(totalTotalesCargos.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalTotalesCargos)%></td>
              <td align="right"><%=(totalTotalesAbonos.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalTotalesAbonos)%></td>
              <td align="right"><%=(totalTotalesSaldoActual.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totalTotalesSaldoActual)%></td>
          </tr>
  <%
        } //Fin de si se trata del ULTIMO_REGISTRO
        
        EncSctaEnCurso = encScta;
      }
      else { //Primer else
        if(!encSscta.equals(EncSsctaEnCurso)) { //Segundo corte: RCM_ENC_SSCTA
          
          if(!EncSsctaEnCurso.equals("PRIMER_REGISTRO") || EncSsctaEnCurso.equals("ULTIMO_REGISTRO")) { //Si no es la primera vez que ingresa, colocar los SUBTOTALES
  %>
            <tr><td colspan="11">&nbsp;</td></tr>
  <%
            if(subTotalMandatosConSaldoInicial.intValue()!=0 || subTotalMandatosConCargos.intValue()!=0 || subTotalMandatosConAbonos.intValue()!=0 || subTotalMandatosConSaldoActual.intValue()!=0) {//Si existe un subtotal para MANDATOS CON ADMINISTRACION
  %>
            <tr>
              <td colspan="6">&nbsp;</td>
              <td>SUBTOTAL MANDATOS CON:</td>
              <td align="right"><%=(subTotalMandatosConSaldoInicial.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalMandatosConSaldoInicial)%></td>
              <td align="right"><%=(subTotalMandatosConCargos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalMandatosConCargos)%></td>
              <td align="right"><%=(subTotalMandatosConAbonos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalMandatosConAbonos)%></td>
              <td align="right"><%=(subTotalMandatosConSaldoActual.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalMandatosConSaldoActual)%></td>
            </tr>
  <%
            }//Fin de impresión del subtotal MANDATOS CON ADMINISTRACION
            if(subTotalMandatosSinSaldoInicial.intValue()!=0 || subTotalMandatosSinCargos.intValue()!=0 || subTotalMandatosSinAbonos.intValue()!=0 || subTotalMandatosSinSaldoActual.intValue()!=0) {//Si existe un subtotal para MANDATOS SIN ADMINISTRACION
  %>
            <tr>
              <td colspan="6">&nbsp;</td>
              <td>SUBTOTAL MANDATOS SIN:</td>
              <td align="right"><%=(subTotalMandatosSinSaldoInicial.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalMandatosSinSaldoInicial)%></td>
              <td align="right"><%=(subTotalMandatosSinCargos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalMandatosSinCargos)%></td>
              <td align="right"><%=(subTotalMandatosSinAbonos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalMandatosSinAbonos)%></td>
              <td align="right"><%=(subTotalMandatosSinSaldoActual.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalMandatosSinSaldoActual)%></td>
            </tr>
  <%
            }//Fin de impresión del subtotal MANDATOS SIN ADMINISTRACION
            if(subTotalFideicomisosConSaldoInicial.intValue()!=0 || subTotalFideicomisosConCargos.intValue()!=0 || subTotalFideicomisosConAbonos.intValue()!=0 || subTotalFideicomisosConSaldoActual.intValue()!=0) {//Si existe un subtotal para FIDEICOMISOS CON ADMINISTRACION
  %>
            <tr>
              <td colspan="6">&nbsp;</td>
              <td>SUBTOTAL FISOS CON:</td>
              <td align="right"><%=(subTotalFideicomisosConSaldoInicial.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomisosConSaldoInicial)%></td>
              <td align="right"><%=(subTotalFideicomisosConCargos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomisosConCargos)%></td>
              <td align="right"><%=(subTotalFideicomisosConAbonos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomisosConAbonos)%></td>
              <td align="right"><%=(subTotalFideicomisosConSaldoActual.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomisosConSaldoActual)%></td>
            </tr>
  <%
            }//Fin de impresión del subtotal FIDEICOMISOS CON ADMINISTRACION
            if(subTotalFideicomisosSinSaldoInicial.intValue()!=0 || subTotalFideicomisosSinCargos.intValue()!=0 || subTotalFideicomisosSinAbonos.intValue()!=0 || subTotalFideicomisosSinSaldoActual.intValue()!=0) {//Si existe un subtotal para FIDEICOMISOS SIN ADMINISTRACION
  %>
            <tr>
              <td colspan="6">&nbsp;</td>
              <td>SUBTOTAL FISOS SIN:</td>
              <td align="right"><%=(subTotalFideicomisosSinSaldoInicial.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomisosSinSaldoInicial)%></td>
              <td align="right"><%=(subTotalFideicomisosSinCargos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomisosSinCargos)%></td>
              <td align="right"><%=(subTotalFideicomisosSinAbonos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomisosSinAbonos)%></td>
              <td align="right"><%=(subTotalFideicomisosSinSaldoActual.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomisosSinSaldoActual)%></td>
            </tr>
  <%
            }//Fin de impresión del subtotal FIDEICOMISOS SIN ADMINISTRACION
            
  %>
            <tr> <!--Imprimiendo el SUBTOTAL de MANDATOS y FIDEICOMISOS tanto CON y SIN ADMINISTRACION. Y sumando el total de Subtotales-->
              <td colspan="6">&nbsp;</td>
              <td>SUBTOTAL:</td>
              <%auxiliar=new BigDecimal(subTotalMandatosConSaldoInicial.doubleValue()+subTotalMandatosSinSaldoInicial.doubleValue()+subTotalFideicomisosConSaldoInicial.doubleValue()+subTotalFideicomisosSinSaldoInicial.doubleValue());
                totalSubtotalesConSinSaldoInicial=new BigDecimal(totalSubtotalesConSinSaldoInicial.doubleValue()+auxiliar.doubleValue());%>
              <td align="right"><%=(auxiliar.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", auxiliar)%></td>
              <%auxiliar=new BigDecimal(subTotalMandatosConCargos.doubleValue()+subTotalMandatosSinCargos.doubleValue()+subTotalFideicomisosConCargos.doubleValue()+subTotalFideicomisosSinCargos.doubleValue());
                totalSubtotalesConSinCargos=new BigDecimal(totalSubtotalesConSinCargos.doubleValue()+auxiliar.doubleValue());%>
              <td align="right"><%=(auxiliar.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", auxiliar)%></td>
              <%auxiliar=new BigDecimal(subTotalMandatosConAbonos.doubleValue()+subTotalMandatosSinAbonos.doubleValue()+subTotalFideicomisosConAbonos.doubleValue()+subTotalFideicomisosSinAbonos.doubleValue());
                totalSubtotalesConSinAbonos=new BigDecimal(totalSubtotalesConSinAbonos.doubleValue()+auxiliar.doubleValue());%>
              <td align="right"><%=(auxiliar.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", auxiliar)%></td> 
              <%auxiliar=new BigDecimal(subTotalMandatosConSaldoActual.doubleValue()+subTotalMandatosSinSaldoActual.doubleValue()+subTotalFideicomisosConSaldoActual.doubleValue()+subTotalFideicomisosSinSaldoActual.doubleValue());
                totalSubtotalesConSinSaldoActual=new BigDecimal(totalSubtotalesConSinSaldoActual.doubleValue()+auxiliar.doubleValue());%>
              <td align="right"><%=(auxiliar.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", auxiliar)%></td>
            </tr>
            <tr><td colspan="11">&nbsp;</td></tr>
            <tr><td colspan="11">&nbsp;</td></tr>
  <%
            
          }//Fin de colocar los SUBTOTALES
          
          if(!EncSsctaEnCurso.equals("ULTIMO_REGISTRO")) {//Si no es el último registro, Imprimir encabezados siguientes
            i--;
            
            //Limpiar las variables de los subtotales
            subTotalMandatosConSaldoInicial = new BigDecimal(0);
            subTotalMandatosConCargos = new BigDecimal(0);
            subTotalMandatosConAbonos = new BigDecimal(0);
            subTotalMandatosConSaldoActual = new BigDecimal(0);
            
            subTotalMandatosSinSaldoInicial = new BigDecimal(0);
            subTotalMandatosSinCargos = new BigDecimal(0);
            subTotalMandatosSinAbonos = new BigDecimal(0);
            subTotalMandatosSinSaldoActual = new BigDecimal(0);
            
            subTotalFideicomisosConSaldoInicial = new BigDecimal(0);
            subTotalFideicomisosConCargos = new BigDecimal(0);
            subTotalFideicomisosConAbonos = new BigDecimal(0);
            subTotalFideicomisosConSaldoActual = new BigDecimal(0);
            
            subTotalFideicomisosSinSaldoInicial = new BigDecimal(0);
            subTotalFideicomisosSinCargos = new BigDecimal(0);
            subTotalFideicomisosSinAbonos = new BigDecimal(0);
            subTotalFideicomisosSinSaldoActual = new BigDecimal(0);
  %>
            <tr>
              <td align="center" colspan="2"><%=encCtam%></td>
              <td width="40"><%=encScta%></td>
              <td width="40"><%=encSscta%></td>
              <td><%=encCuenta%></td>
              <td colspan="6">&nbsp;</td>
            </tr>
  <%
          } //Fin de if no ULTIMO_REGISTRO
          else
          {
            EncSctaEnCurso = "ULTIMO_REGISTRO";
            i--;
          }
          EncSsctaEnCurso = encSscta;
        }
        else { //Segundo else
  %>
          <tr>
            <td>&nbsp;</td>
            <td><%=numContrato%></td>
            <td>&nbsp;</td>
            <td colspan="4"><%=nomContrato%></td>
            <td align="right"><%=(saldoInicial.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", saldoInicial)%></td>
            <td align="right"><%=(cargos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", cargos)%></td>
            <td align="right"><%=(abonos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", abonos)%></td>
            <td align="right"><%=(saldoActual.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", saldoActual)%></td>
          </tr>
  <%
          //Hacer la suma de los subtotales de Mandatos y Fideicomisos, tanto Con Administración y Sin Administración
          if(fisoOContrato.equals("MANDATO") && conAdmon.equals("SI")) {//MANDATOS CON ADMINISTRACION
            subTotalMandatosConSaldoInicial = new BigDecimal(subTotalMandatosConSaldoInicial.doubleValue()+saldoInicial.doubleValue());
            subTotalMandatosConCargos = new BigDecimal(subTotalMandatosConCargos.doubleValue()+cargos.doubleValue());
            subTotalMandatosConAbonos = new BigDecimal(subTotalMandatosConAbonos.doubleValue()+abonos.doubleValue());
            subTotalMandatosConSaldoActual = new BigDecimal(subTotalMandatosConSaldoActual.doubleValue()+saldoActual.doubleValue());
          } //Fin de MANDATOS CON ADMINISTRACION
          else if (fisoOContrato.equals("MANDATO") && conAdmon.equals("NO")) {//MANDATOS SIN ADMINISTRACION
            subTotalMandatosSinSaldoInicial = new BigDecimal(subTotalMandatosSinSaldoInicial.doubleValue()+saldoInicial.doubleValue());
            subTotalMandatosSinCargos = new BigDecimal(subTotalMandatosSinCargos.doubleValue()+cargos.doubleValue());
            subTotalMandatosSinAbonos = new BigDecimal(subTotalMandatosSinAbonos.doubleValue()+abonos.doubleValue());
            subTotalMandatosSinSaldoActual = new BigDecimal(subTotalMandatosSinSaldoActual.doubleValue()+saldoActual.doubleValue());
          } //Fin de MANDATOS SIN ADMINISTRACION
          else if (fisoOContrato.equals("FIDEICOMISO") && conAdmon.equals("SI")) {//FIDEICOMISOS CON ADMINISTRACION
            subTotalFideicomisosConSaldoInicial = new BigDecimal(subTotalFideicomisosConSaldoInicial.doubleValue()+saldoInicial.doubleValue());
            subTotalFideicomisosConCargos = new BigDecimal(subTotalFideicomisosConCargos.doubleValue()+cargos.doubleValue());
            subTotalFideicomisosConAbonos = new BigDecimal(subTotalFideicomisosConAbonos.doubleValue()+abonos.doubleValue());
            subTotalFideicomisosConSaldoActual = new BigDecimal(subTotalFideicomisosConSaldoActual.doubleValue()+saldoActual.doubleValue());
          } //Fin de FIDEICOMISOS CON ADMINISTRACION
          else if (fisoOContrato.equals("FIDEICOMISO") && conAdmon.equals("NO")) {//FIDEICOMISOS SIN ADMINISTRACION
            subTotalFideicomisosSinSaldoInicial = new BigDecimal(subTotalFideicomisosSinSaldoInicial.doubleValue()+saldoInicial.doubleValue());
            subTotalFideicomisosSinCargos = new BigDecimal(subTotalFideicomisosSinCargos.doubleValue()+cargos.doubleValue());
            subTotalFideicomisosSinAbonos = new BigDecimal(subTotalFideicomisosSinAbonos.doubleValue()+abonos.doubleValue());
            subTotalFideicomisosSinSaldoActual = new BigDecimal(subTotalFideicomisosSinSaldoActual.doubleValue()+saldoActual.doubleValue());
          } //Fin de FIDEICOMISOS SIN ADMINISTRACION
          
          //Si es el último registro, regresar para colocar los últimos SUBTOTALES
          if(i==(consulta.size()-1)) {
            EncSsctaEnCurso = "ULTIMO_REGISTRO";
            i--;
          }
           
        } //Fin de segundo else
      } //Fin de primer else
      
      tipoNegocioAnterior = tipoNegocio;
    }
  %>
  </table>
  
  </body>
</html>