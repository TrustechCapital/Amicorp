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
    String tipoFiso = "";
    String tipoNegocio = "";
    BigDecimal numContrato = new BigDecimal(-1);
    String nomContrato = "";
    String encCreditos = "";
    String encValores = "";
    String encInmuebles = "";
    String encEfectivo = "";
    String encOtros = "";
    String encFideicomitentes = "";
    BigDecimal impCreditos = new BigDecimal(-1);
    BigDecimal impValores = new BigDecimal(-1);
    BigDecimal impInmuebles = new BigDecimal(-1);
    BigDecimal impEfectivo = new BigDecimal(-1);
    BigDecimal impOtros = new BigDecimal(-1);
    BigDecimal impFideicomitentes = new BigDecimal(-1);
    
    //Variables auxiliares para llevara  cabo los cortes
    String TipoFisoEnCurso = "";
    String TipoNegocioEnCurso = "";
    
    //Variables auxiliares para la lógica e impresión
    boolean primerTipoFiso = true;
    boolean primerTipoNegocio = true;
    
    BigDecimal subTotalCreditos = new BigDecimal(0);
    BigDecimal subTotalValores = new BigDecimal(0);
    BigDecimal subTotalInmuebles = new BigDecimal(0);
    BigDecimal subTotalEfectivo = new BigDecimal(0);
    BigDecimal subTotalOtros = new BigDecimal(0);
    BigDecimal subTotalFideicomitentes = new BigDecimal(0);
    
    BigDecimal TotalCreditos = new BigDecimal(0);
    BigDecimal TotalValores = new BigDecimal(0);
    BigDecimal TotalInmuebles = new BigDecimal(0);
    BigDecimal TotalEfectivo = new BigDecimal(0);
    BigDecimal TotalOtros = new BigDecimal(0);
    BigDecimal TotalFideicomitentes = new BigDecimal(0);
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
  <%
    for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
      registro = (java.util.Map)consulta.get(i);
      //Obtener datos de la BD
      tipoFiso = (String)registro.get("rbaTipoFiso");
      tipoNegocio = (String)registro.get("rbaTipoNegocio");
      numContrato = (BigDecimal)registro.get("rbaNumContrato");
      nomContrato = (String)registro.get("rbaNomContrato");
      encCreditos = (String)registro.get("rbaEncCreditos");
      encValores = (String)registro.get("rbaEncValores");
      encInmuebles = (String)registro.get("rbaEncInmuebles");
      encEfectivo = (String)registro.get("rbaEncEfectivo");
      encOtros = (String)registro.get("rbaEncOtros");
      encFideicomitentes = (String)registro.get("rbaEncFieicomitentes");
      impCreditos = (BigDecimal)registro.get("rbaImpCreditos");
      impValores = (BigDecimal)registro.get("rbaImpValores");
      impInmuebles = (BigDecimal)registro.get("rbaImpInmuebles");
      impEfectivo = (BigDecimal)registro.get("rbaImpEfectivo");
      impOtros = (BigDecimal)registro.get("rbaImpOtros");
      impFideicomitentes = (BigDecimal)registro.get("rbaImpFideicomitentes");
      
      if(!tipoFiso.equals(TipoFisoEnCurso)) { //Primer corte: RBA_TIPO_FISO
        i--;
        TipoFisoEnCurso = tipoFiso;
        primerTipoNegocio = true;
        TipoNegocioEnCurso = "";
        
        if(!primerTipoFiso)
        {
  %>
          <tr><td colspan="8">&nbsp;</td></tr>
          <tr>
            <td>&nbsp;</td>
            <td style="font-weight:bolder">TOTAL:</td>
            <td style="font-weight:bolder" align="right"><%=(TotalCreditos.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalCreditos)%></td>
            <td style="font-weight:bolder" align="right"><%=(TotalValores.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalValores)%></td>
            <td style="font-weight:bolder" align="right"><%=(TotalInmuebles.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalInmuebles)%></td>
            <td style="font-weight:bolder" align="right"><%=(TotalEfectivo.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalEfectivo)%></td>
            <td style="font-weight:bolder" align="right"><%=(TotalOtros.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalOtros)%></td>
            <td style="font-weight:bolder" align="right"><%=(TotalFideicomitentes.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalFideicomitentes)%></td>
          </tr>
          <tr><td colspan="8">&nbsp;</td></tr>
          <tr><td colspan="8">&nbsp;</td></tr>
  <%
          TotalCreditos = new BigDecimal(0);
          TotalValores = new BigDecimal(0);
          TotalInmuebles = new BigDecimal(0);
          TotalEfectivo = new BigDecimal(0);
          TotalOtros = new BigDecimal(0);
          TotalFideicomitentes = new BigDecimal(0);
          
          subTotalCreditos = new BigDecimal(0);
          subTotalValores = new BigDecimal(0);
          subTotalInmuebles = new BigDecimal(0);
          subTotalEfectivo = new BigDecimal(0);
          subTotalOtros = new BigDecimal(0);
          subTotalFideicomitentes = new BigDecimal(0);
        }
        else
          primerTipoFiso=false;
  %>
        <tr>
          <td width="200" align="right" colspan="2" style="font-weight:bolder"><%=tipoFiso%></td>
          <td width="190" align="right" style="font-weight:bolder"><%=(encCreditos==null)?"&nbsp;":encCreditos.toString()%></td>
          <td width="190" align="right" style="font-weight:bolder"><%=(encValores==null)?"&nbsp;":encValores.toString()%></td>
          <td width="190" align="right" style="font-weight:bolder"><%=(encInmuebles==null)?"&nbsp;":encInmuebles.toString()%></td>
          <td width="190" align="right" style="font-weight:bolder"><%=(encEfectivo==null)?"&nbsp;":encEfectivo.toString()%></td>
          <td width="190" align="right" style="font-weight:bolder"><%=(encOtros==null)?"&nbsp;":encOtros.toString()%></td>
          <td width="200" align="right" style="font-weight:bolder"><%=(encFideicomitentes==null)?"&nbsp;":encFideicomitentes.toString()%></td>
        </tr>
  <%
      }
      else { //Primer else
        if(!tipoNegocio.equals(TipoNegocioEnCurso)) { //Segundo corte: RBA_TIPO_NEGOCIO
          i--;
          TipoNegocioEnCurso = tipoNegocio;
          
          if(!primerTipoNegocio)
          {
  %>
            <tr><td colspan="8">&nbsp;</td></tr>
            <tr><td colspan="8">&nbsp;</td></tr>
            <tr>
              <td>&nbsp;</td>
              <td style="font-weight:bolder">SUBTOTAL:</td>
              <td style="font-weight:bolder" align="right"><%=(subTotalCreditos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalCreditos)%></td>
              <td style="font-weight:bolder" align="right"><%=(subTotalValores.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalValores)%></td>
              <td style="font-weight:bolder" align="right"><%=(subTotalInmuebles.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalInmuebles)%></td>
              <td style="font-weight:bolder" align="right"><%=(subTotalEfectivo.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalEfectivo)%></td>
              <td style="font-weight:bolder" align="right"><%=(subTotalOtros.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalOtros)%></td>
              <td style="font-weight:bolder" align="right"><%=(subTotalFideicomitentes.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomitentes)%></td>
            </tr>
            <tr><td colspan="8">&nbsp;</td></tr>
  <%
            TotalCreditos = new BigDecimal(TotalCreditos.doubleValue()+subTotalCreditos.doubleValue());
            TotalValores = new BigDecimal(TotalValores.doubleValue()+subTotalValores.doubleValue());
            TotalInmuebles = new BigDecimal(TotalInmuebles.doubleValue()+subTotalInmuebles.doubleValue());
            TotalEfectivo = new BigDecimal(TotalEfectivo.doubleValue()+subTotalEfectivo.doubleValue());
            TotalOtros = new BigDecimal(TotalOtros.doubleValue()+subTotalOtros.doubleValue());
            TotalFideicomitentes = new BigDecimal(TotalFideicomitentes.doubleValue()+subTotalFideicomitentes.doubleValue());
            
            subTotalCreditos = new BigDecimal(0);
            subTotalValores = new BigDecimal(0);
            subTotalInmuebles = new BigDecimal(0);
            subTotalEfectivo = new BigDecimal(0);
            subTotalOtros = new BigDecimal(0);
            subTotalFideicomitentes = new BigDecimal(0);
          }
          else
            primerTipoNegocio=false;
  %>
          <tr>
            <td style="font-weight:bolder"><%=tipoNegocio%></td>
            <td colspan="7">&nbsp;</td>
          </tr>
  <%
        }
        else { //Segundo else
          //Hacer la suma de los sub-totales
          subTotalCreditos = new BigDecimal(subTotalCreditos.doubleValue()+impCreditos.doubleValue());
          subTotalValores = new BigDecimal(subTotalValores.doubleValue()+impValores.doubleValue());
          subTotalInmuebles = new BigDecimal(subTotalInmuebles.doubleValue()+impInmuebles.doubleValue());
          subTotalEfectivo = new BigDecimal(subTotalEfectivo.doubleValue()+impEfectivo.doubleValue());
          subTotalOtros = new BigDecimal(subTotalOtros.doubleValue()+impOtros.doubleValue());
          subTotalFideicomitentes = new BigDecimal(subTotalFideicomitentes.doubleValue()+impFideicomitentes.doubleValue());
        } //Fin de segundo else
      } //Fin de primer else
      
      //Si se trata del último resgistro, presentar la información de las sumatorias de los cortes (SUBTOTAL y TOTAL)
      if(i==(consulta.size()-1))
      {
        TotalCreditos = new BigDecimal(TotalCreditos.doubleValue()+subTotalCreditos.doubleValue());
        TotalValores = new BigDecimal(TotalValores.doubleValue()+subTotalValores.doubleValue());
        TotalInmuebles = new BigDecimal(TotalInmuebles.doubleValue()+subTotalInmuebles.doubleValue());
        TotalEfectivo = new BigDecimal(TotalEfectivo.doubleValue()+subTotalEfectivo.doubleValue());
        TotalOtros = new BigDecimal(TotalOtros.doubleValue()+subTotalOtros.doubleValue());
        TotalFideicomitentes = new BigDecimal(TotalFideicomitentes.doubleValue()+subTotalFideicomitentes.doubleValue());
  %>    
        <tr><td colspan="8">&nbsp;</td></tr>
        <tr>
          <td>&nbsp;</td>
          <td style="font-weight:bolder">SUBTOTAL:</td>
          <td style="font-weight:bolder" align="right"><%=(subTotalCreditos.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalCreditos)%></td>
          <td style="font-weight:bolder" align="right"><%=(subTotalValores.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalValores)%></td>
          <td style="font-weight:bolder" align="right"><%=(subTotalInmuebles.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalInmuebles)%></td>
          <td style="font-weight:bolder" align="right"><%=(subTotalEfectivo.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalEfectivo)%></td>
          <td style="font-weight:bolder" align="right"><%=(subTotalOtros.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalOtros)%></td>
          <td style="font-weight:bolder" align="right"><%=(subTotalFideicomitentes.intValue()==0)?"&nbsp;":DecimalFormatUtils.getFormatedNumber("###,###.00", subTotalFideicomitentes)%></td>
        </tr>
        <tr><td colspan="8">&nbsp;</td></tr>
        <tr>
          <td>&nbsp;</td>
          <td style="font-weight:bolder">TOTAL:</td>
          <td style="font-weight:bolder" align="right"><%=(TotalCreditos.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalCreditos)%></td>
          <td style="font-weight:bolder" align="right"><%=(TotalValores.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalValores)%></td>
          <td style="font-weight:bolder" align="right"><%=(TotalInmuebles.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalInmuebles)%></td>
          <td style="font-weight:bolder" align="right"><%=(TotalEfectivo.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalEfectivo)%></td>
          <td style="font-weight:bolder" align="right"><%=(TotalOtros.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalOtros)%></td>
          <td style="font-weight:bolder" align="right"><%=(TotalFideicomitentes.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", TotalFideicomitentes)%></td>
        </tr>
  <%
      }
    }
  %>
  </table>
  
  </body>
</html>