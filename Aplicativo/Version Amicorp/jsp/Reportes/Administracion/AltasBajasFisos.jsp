<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>HISTORICO DE RIESGO</title>
  </head>
  <body>
  
  <%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
    String nomActividad = "";
    BigDecimal numContrato = new BigDecimal(0);
    String numProducto = "";
    String nomContrato = "";
    String regNalInvEx = "";
    String fechaApertura = "";
	String nivelRiesgoFiso = "";
	String tipoPersona = "";
	String numPersona = "";
	String nombrePersona = "";
	String rfcPersona = "";
	String fechaAperturaPersona = "";	
	String nivelRiesgoPersonal = "";	
    BigDecimal patrimonio = new BigDecimal(0);
	String Bloqueo="";
	String cambio="";
	String sCambioRiesgo="SIN CAMBIO";
	String sListas = "";
    
    //Variables auxiliares para llevara  cabo los cortes
    String NomActividad = "";
    
    //Variables auxiliares para la lógica e impresión
    boolean primerActividad = true;
    BigDecimal subNumActividades = new BigDecimal(0);
    BigDecimal subPatrimonio = new BigDecimal(0);
    BigDecimal totNumActividades = new BigDecimal(0);
    BigDecimal totPatrimonio = new BigDecimal(0);
  %>
  
  <table border="0" cellspacing="0" cellpadding="0" style="font-family: Arial;font-size: 10px;">
              <tr>
                <td rowspan="5"   align="center"><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"  height="100"></td>
                <td colspan="5" align="right">&nbsp;<font style="font-family: Arial;font-size: 7px;"> &nbsp;</font></td>
              </tr>
              <tr><th colspan="5"><%=session.getAttribute("empresa_1")%></th></tr>
              <tr><th colspan="5"><%=session.getAttribute("empresa_2")%></th></tr>
              <tr><th colspan="5">HISTORICO DE RIESGO</th></tr>
              <tr>         
              <td width="70">&nbsp;</td>
              <td width="220">&nbsp;</td>
              <td width="290">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="110" align="right" style="font-size: 12px;">&nbsp;</td>
              </tr> 
  <tr><td colspan="5">&nbsp;</td></tr>
    <tr>
      <td width="70" style="font-weight:bolder" align="left">NUM</td>
      <td width="700" style="font-weight:bolder" align="left">NEGOCIO</td>
	  <td width="150" style="font-weight:bolder" align="left">TIPO PERSONA</td>
	  <td width="150" style="font-weight:bolder" align="left">NOMBRE PERSONA</td>
	  <td width="150" style="font-weight:bolder" align="left">FECHA DE CONST/NAC PERSONA</td>
      <td width="150" style="font-weight:bolder" align="left">NIVEL RIESGO PERSONA</td>
	  <td width="150" style="font-weight:bolder" align="left">PERSONA BLOQUEADA</td>
	  <td width="150" style="font-weight:bolder" align="left">LISTAS</td>
	  <td width="150" style="font-weight:bolder" align="left">CAMBIO RIESGO</td>
	  <td width="150" style="font-weight:bolder" align="left">JUST CAMBIO RIESGO</td>
	  
    </tr>
    <tr><td colspan="5"><hr/></td></tr>
  <%  
    for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
      registro = (java.util.Map)consulta.get(i);
      //Obtener datos de la BD
      nomActividad = (String)registro.get("repNomActividad");
      numContrato = (BigDecimal)registro.get("ctoNumContrato");
      numProducto = (String)registro.get("prlNumProducto");
      nomContrato = (String)registro.get("repNomContrato");
      regNalInvEx = (String)registro.get("repRegNalInvEx");
      fechaApertura = (String)registro.get("fechaApertura");
      patrimonio = (BigDecimal)registro.get("patrimonio");
	  cambio= (String)registro.get("motivo");

		nivelRiesgoFiso = (String)registro.get("repNivelRiesgoFiso");
		tipoPersona = (String)registro.get("repTipoPersona");
		numPersona= (String)registro.get("repNumPersona");
		nombrePersona = (String)registro.get("repNombrePersona");
		rfcPersona = (String)registro.get("repRfcPersona");
		fechaAperturaPersona = (String)registro.get("repFecAltaPersona");	
		nivelRiesgoPersonal = (String)registro.get("repNivelRiesgoPersona");

		Bloqueo= (String)registro.get("repBloqueo");
		sListas= (String)registro.get("repListas");

      
      if(!nomActividad.equals(NomActividad)) { //Primer corte: REP_NOM_ACTIVIDAD
        i--;
        NomActividad = nomActividad;
        
        if(!primerActividad)
        {
  %>
          <tr><td colspan="5">&nbsp;</td></tr>
          <tr>
            <td colspan="3" style="font-weight:bolder" align="left">TOTAL DE REGISTROS POR FIDEICOMISO: </td>
            <td style="font-weight:bolder" align="center"><%=(subNumActividades.intValue()==0)?"0":DecimalFormatUtils.getFormatedNumber("###,###", subNumActividades)%></td>
            <td style="font-weight:bolder" align="right"><%=(subPatrimonio.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subPatrimonio)%></td>
          </tr>
          <tr><td colspan="5"><hr/></td></tr>
  <%
          totNumActividades = new BigDecimal(totNumActividades.intValue()+subNumActividades.intValue());
          totPatrimonio = new BigDecimal(totPatrimonio.doubleValue()+subPatrimonio.doubleValue());
          
          subNumActividades = new BigDecimal(0);
          subPatrimonio = new BigDecimal(0);
        }
        else
          primerActividad = false;
        
  %>
        <tr>
          <tr><td colspan="5" style="font-weight:bolder" align="center"><%=nomActividad%></td></tr>
        </tr>
  <%
      } //Fin de Primer Corte
      else
      {
        //Hacer la suma de los sub-totales
        subNumActividades = new BigDecimal(subNumActividades.intValue()+1);
        subPatrimonio = new BigDecimal(subPatrimonio.doubleValue()+patrimonio.doubleValue());
  %>
  
        <tr>
		
		  <td width="70" style="font-weight:bolder" align="left"><%=numContrato%></td>
		  <td width="700" style="font-weight:bolder" align="left"><%=(nomContrato==null)?"&nbsp;":nomContrato.toString()%></td>
		  <td width="150" style="font-weight:bolder" align="left"><%=(tipoPersona==null)?"&nbsp;":tipoPersona.toString()%></td>
		  <td width="150" style="font-weight:bolder" align="left"><%=(nombrePersona==null)?"&nbsp;":nombrePersona.toString()%></td>
		  <td width="150" style="font-weight:bolder" align="left"><%=(fechaAperturaPersona==null)?"&nbsp;":fechaAperturaPersona.toString()%></td>
		  <td width="150" style="font-weight:bolder" align="left"><%=(nivelRiesgoPersonal==null)?"&nbsp;":nivelRiesgoPersonal.toString()%></td>
		  <td width="150" style="font-weight:bolder" align="left"><%=(Bloqueo==null)?"&nbsp;":Bloqueo.toString()%></td>		
		  <td width="150" style="font-weight:bolder" align="left"><%=(sListas==null)?"&nbsp;":sListas.toString()%></td>		
		  <td width="150" style="font-weight:bolder" align="left"><%=(sCambioRiesgo==null)?"&nbsp;":sCambioRiesgo.toString()%></td>		
		  <td width="150" style="font-weight:bolder" align="left"><%=(cambio==null)?"&nbsp;":cambio.toString()%></td>		
        </tr>
  <%
      }
		
      //Si se trata del último resgistro, presentar la información de las sumatorias de los cortes (TOTAL)
      if(i==(consulta.size()-1))
      {
        totNumActividades = new BigDecimal(totNumActividades.intValue()+subNumActividades.intValue());
        totPatrimonio = new BigDecimal(totPatrimonio.doubleValue()+subPatrimonio.doubleValue());
  %>
        <tr><td colspan="5">&nbsp;</td></tr>
        <tr>
          <td colspan="3" style="font-weight:bolder" align="left">TOTAL DE REGISTROS POR FIDEICOMISO: </td>
          <td style="font-weight:bolder" align="center"><%=(subNumActividades.intValue()==0)?"0":DecimalFormatUtils.getFormatedNumber("###,###", subNumActividades)%></td>
          <td style="font-weight:bolder" align="right"><%=(subPatrimonio.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", subPatrimonio)%></td>
        </tr>
        <tr><td colspan="5"><hr/></td></tr>
        <tr><td colspan="5">&nbsp;</td></tr>
        <tr>
          <td colspan="3" style="font-weight:bolder" align="left">TOTAL DE NEGOCIOS GENERAL: </td>
          <td style="font-weight:bolder" align="center"><%=(totNumActividades.intValue()==0)?"0":DecimalFormatUtils.getFormatedNumber("###,###", totNumActividades)%></td>
          <td style="font-weight:bolder" align="right"><%=(totPatrimonio.intValue()==0)?"0.00":DecimalFormatUtils.getFormatedNumber("###,###.00", totPatrimonio)%></td>
        </tr>
  <%
      }
    } //Fin de las iteraciones para los registros
  %>
  </table>
  
  </body>
</html>