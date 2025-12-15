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
    BigDecimal area = new BigDecimal(-1);
    String tipoPoliza = "";
    BigDecimal poliza = new BigDecimal(-1);
    BigDecimal moneda = new BigDecimal(-1);
    BigDecimal concepto = new BigDecimal(-1);
    BigDecimal operacion = new BigDecimal(-1);
    BigDecimal enteCargo = new BigDecimal(-1);
    BigDecimal tipoEnteCa = new BigDecimal(-1);
    BigDecimal enteAbono = new BigDecimal(-1);
    BigDecimal tipoEnteAb = new BigDecimal(-1);
    BigDecimal impMe = new BigDecimal(-1);
    BigDecimal impMn = new BigDecimal(-1);
    String tipoIniCo = "";
    BigDecimal numIniCo = new BigDecimal(-1);
    BigDecimal tipoDeuacre = new BigDecimal(-1);
    BigDecimal numDeuacre = new BigDecimal(-1);
    String dependencia = "";
    BigDecimal centro = new BigDecimal(-1);
    BigDecimal subCentro = new BigDecimal(-1);
    BigDecimal sucursal1503 = new BigDecimal(-1);
    BigDecimal folio = new BigDecimal(-1);
    BigDecimal sucursalOrigen = new BigDecimal(-1);
    BigDecimal filler = new BigDecimal(-1);
    String nomMoneda = "";
    
    //Variables auxiliares para llevara  cabo los cortes
    String NomMonedaEnCurso = "";
    BigDecimal FolioEnCurso = new BigDecimal(-1);
    BigDecimal ConceptoEnCurso = new BigDecimal(-1);
    BigDecimal OperacionEnCurso = new BigDecimal(-1);
    BigDecimal FillerEnCurso = new BigDecimal(-1);
    BigDecimal NumIniCoEnCurso = new BigDecimal(-1);
    
    //Variables auxiliares para la lógica e impresión
    boolean primeraMoneda = true;
    boolean primerTotalConcepto = true;
    BigDecimal ImporteActual = new BigDecimal(-1);
    BigDecimal Concepto_TotalImporte = new BigDecimal(0);
    BigDecimal Imprime_sucursal = new BigDecimal(-1);
    
    BigDecimal enteCargoSiguiente = new BigDecimal(-1);
    BigDecimal enteAbonoSiguiente = new BigDecimal(-1);
    
    BigDecimal Total_EnteCargoAbono = new BigDecimal(0);
    BigDecimal Total_ConceptoMoneda = new BigDecimal(0);
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
      <th align="left" width="260">Moneda</th>
      <th width="80">Folio</th>
      <th width="100">No. Cpto.</th>
      <th width="100" colspan="2">No. Ope.</th>
      <th width="130" colspan="2">Ente Cargo</th>
      <th width="120" colspan="2">Ente Abono</th>
      <th width="180">Importe</th>
      <th width="100">Deud-Acre</th>
      <th width="100">T. Ini.</th>
      <th width="100">No. inic</th>
      <th width="100">Sucursal</th>
      <th width="100">Depend.</th>
    </tr>
    <%  
      for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
        if((i+1)<consulta.size())
        {
          registro = (java.util.Map)consulta.get(i+1);
          enteCargoSiguiente = (BigDecimal)registro.get("apcEnteCargo");
          enteAbonoSiguiente = (BigDecimal)registro.get("apcEnteAbono");
        }
        else
        {
          enteCargoSiguiente = new BigDecimal(-1);
          enteAbonoSiguiente = new BigDecimal(-1);
        }
        
        registro = (java.util.Map)consulta.get(i);
        
        //Obtener datos de la BD
        area = (BigDecimal)registro.get("apcArea");
        tipoPoliza = (String)registro.get("apcTipoPoliza");
        poliza = (BigDecimal)registro.get("apcPoliza");
        moneda = (BigDecimal)registro.get("apcMoneda");
        concepto = (BigDecimal)registro.get("apcConcepto");
        operacion = (BigDecimal)registro.get("apcOperacion");
        enteCargo = (BigDecimal)registro.get("apcEnteCargo");
        tipoEnteCa = (BigDecimal)registro.get("apcTipoEnteCa");
        enteAbono = (BigDecimal)registro.get("apcEnteAbono");
        tipoEnteAb = (BigDecimal)registro.get("apcTipoEnteAb");
        impMe = (BigDecimal)registro.get("apcImpMe");
        impMn = (BigDecimal)registro.get("apcImpMn");
        tipoIniCo = (String)registro.get("apcTipoIniCo");
        numIniCo = (BigDecimal)registro.get("apcNumIniCo");
        tipoDeuacre = (BigDecimal)registro.get("apcTipoDeuacre");
        numDeuacre = (BigDecimal)registro.get("apcNumDeuacre");
        dependencia = (String)registro.get("apcDependencia");
        centro = (BigDecimal)registro.get("apcCentro");
        subCentro = (BigDecimal)registro.get("apcSubcentro");
        sucursal1503 = (BigDecimal)registro.get("apcSucursal1503");
        folio = (BigDecimal)registro.get("apcFolio");
        sucursalOrigen = (BigDecimal)registro.get("apcSucursalOrigen");
        filler = (BigDecimal)registro.get("apcFiller");
        nomMoneda = (String)registro.get("monNomMoneda");
        
        //Sólo en la primera ocasión para no mostrar un TOTAL CONCEPTO inexistente
        //NumIniCoEnCurso=numIniCo;
        
        if(!NomMonedaEnCurso.equals(nomMoneda)) { //Primer corte: MON_NOM_MONEDA
          i--;
          if(!primeraMoneda) {
    %>
          <tr>
            <td colspan="15">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="7">TOTAL CONCEPTO MONEDA</td>
            <td align="right" style="font-weight:bolder"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", Total_ConceptoMoneda)%></td>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="15">&nbsp;</td>
          </tr>
    <%
            Total_ConceptoMoneda = new BigDecimal(0);
            Concepto_TotalImporte = new BigDecimal(0);
          }
          else
            primeraMoneda = false;
    %>
          <tr>
            <td colspan="15"><%=nomMoneda%></td>
    <%
            NomMonedaEnCurso = nomMoneda;
            FolioEnCurso = new BigDecimal(-1);
            ConceptoEnCurso = new BigDecimal(-1);
            OperacionEnCurso = new BigDecimal(-1);
            FillerEnCurso = new BigDecimal(-1);
    %>
          </tr>
    <%  
        }
        else { //Primer else
          if(FolioEnCurso.compareTo(folio)==-1) { //Segundo corte: APC_FOLIO
            i--;
    %>        
            <tr>
              <td>&nbsp;</td>
              <td colspan="14"><%=folio%></td>
    <%
              FolioEnCurso = folio;
              ConceptoEnCurso = new BigDecimal(-1);
              OperacionEnCurso = new BigDecimal(-1);
              FillerEnCurso = new BigDecimal(-1);
    %>
            </tr>
    <%    
          }
          else { //Segundo else
            if(ConceptoEnCurso.compareTo(concepto)==-1) { //Tercer corte: APC_CONCEPTO
              i--;
              if(!primerTotalConcepto) {
    %>
                <tr>
                  <td colspan="15">&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td colspan="7">TOTAL CONCEPTO</td>
                  <td align="right" style="font-weight:bolder"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", Concepto_TotalImporte)%></td>
                  <td colspan="5">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="15">&nbsp;</td>
                </tr>
    <%
                Total_ConceptoMoneda = new BigDecimal(Total_ConceptoMoneda.doubleValue()+Concepto_TotalImporte.doubleValue());
                Concepto_TotalImporte = new BigDecimal(0);
              }
              else
                primerTotalConcepto = false;
    %>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="13"><%=concepto%></td>
    <%
                ConceptoEnCurso = concepto;
                OperacionEnCurso = new BigDecimal(-1);
                FillerEnCurso = new BigDecimal(-1);
    %>
              </tr>
    <%
            }
            else { //Tercer else
              if(OperacionEnCurso.compareTo(operacion)==-1) { //Cuarto corte: ACP_OPERACION
                i--;
    %>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td><%=operacion%></td>
                  <td colspan="11">&nbsp;</td>
    <%
                  OperacionEnCurso = operacion;
                  FillerEnCurso = new BigDecimal(-1);
    %>
                </tr>
    <%
              }
              else { //Cuarto else
                if(FillerEnCurso.compareTo(filler)==-1) { //Quinto corte: APC_FILLER
                  i--;
    %>
                  <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td><%=filler%></td>
                    <td colspan="10">&nbsp;</td>
                    <%FillerEnCurso = filler;%>
                  </tr>
    <%
                }
                else { //Quinto else
                  //Obteniendo el dato a imprimir análogo al Importe Actual
                  if(moneda.longValue()==1)
                    ImporteActual = new BigDecimal(impMn.doubleValue()/100);
                  else
                    ImporteActual = new BigDecimal(impMe.doubleValue()/100);
                  
                  //Haciendo la suma de los importes para obtener el TOTAL CONCEPTO
                  Concepto_TotalImporte= new BigDecimal(Concepto_TotalImporte.doubleValue()+ImporteActual.doubleValue());
                  
                  //Cargando el dato a imprimir de sucursal
                  if(numIniCo.longValue()==0)
                    Imprime_sucursal=sucursalOrigen;
                  else
                    Imprime_sucursal=sucursal1503;
                  
                  if((enteCargoSiguiente.compareTo(enteCargo)==0) && (enteAbonoSiguiente.compareTo(enteAbono)==0))
                  {
                    Total_EnteCargoAbono = new BigDecimal(Total_EnteCargoAbono.doubleValue()+ImporteActual.doubleValue());
                  }
                  else
                  {
                    Total_EnteCargoAbono = new BigDecimal(Total_EnteCargoAbono.doubleValue()+ImporteActual.doubleValue());
                  
    %>
                    <tr>
                      <td colspan="5">&nbsp;</td>
                      <td><%=tipoEnteCa%></td>
                      <td align="right"><%=enteCargo%></td>
                      <td align="center" width="60"><%=tipoEnteAb%></td>
                      <td align="right"><%=enteAbono%></td>
                      <td align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", Total_EnteCargoAbono)%></td>
                      <td align="right"><%=numDeuacre!=null?numDeuacre.toString():"&nbsp;"%></td>
                      <td align="right"><%=tipoIniCo!=null?tipoIniCo.toString():"&nbsp;"%></td>
                      <td align="right"><%=(numIniCo.intValue()==0 || numIniCo==null)?"&nbsp;":numIniCo.toString()%></td>
                      <td align="right"><%=Imprime_sucursal%></td>
                      <td align="right"><%=dependencia!=null?dependencia.toString():"&nbsp;"%></td>
                    </tr>
    <%              
                    Total_EnteCargoAbono = new BigDecimal(0);
                  }//Fin de else para la igualdad entre Cargo y Abono
                  
                  
                }//Fin de quinto else
              }//Fin del cuarto else
            }//Fin de tercer else
          } //Fin de segundo else
        } //Fin de primer else
        
        //Si se trata del último resgistro, presentar la información del corte (Última sumatoria del concepto)
        if(i==(consulta.size()-1)) {
          Total_ConceptoMoneda = new BigDecimal(Total_ConceptoMoneda.doubleValue()+Concepto_TotalImporte.doubleValue());
    %>
          <tr>
            <td colspan="15">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="7">TOTAL CONCEPTO</td>
            <td align="right" style="font-weight:bolder"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", Concepto_TotalImporte)%></td>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="15">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td colspan="7">TOTAL CONCEPTO MONEDA</td>
            <td align="right" style="font-weight:bolder"><%=DecimalFormatUtils.getFormatedNumber("###,###.00", Total_ConceptoMoneda)%></td>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="15">&nbsp;</td>
          </tr>
    <%
        } //Fin de if último registro
      } //Fin del for del número de registros
    %>
  </table>
  
  </body>
</html>