<!-- BalanzaCuentasOrden.jsp -->
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<jsp:useBean id="nConsultas" class="com.nafin.negocio.nConsultas"/>
<%@ page import="java.text.*,java.util.*,java.lang.*"%>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>untitled</title>
  </head>
  <body onLoad="self.opener.hideWaitLayer();">
  
<%
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
      BigDecimal cuenta = new BigDecimal(0);
     BigDecimal Anio = new BigDecimal(0);
     BigDecimal Mes = new BigDecimal(0);
     BigDecimal difsaldo = new BigDecimal(0);
     BigDecimal resultPeriodo = new BigDecimal(0);
     String descripcion="";
     BigDecimal saldo= new BigDecimal(0);
     BigDecimal diferencia= new BigDecimal(0);
     BigDecimal fideicomiso= new BigDecimal(0);
     
     
     //BigDecimal fideicomisorep= new BigDecimal(0);
     BigDecimal idReporte= new BigDecimal(3);
     BigDecimal idUsuario= new BigDecimal(0);
     
     
     BigDecimal esEtiqueta= new BigDecimal(0);
     BigDecimal numContrato= new BigDecimal(0);
     
     String nomContrato="";
     String valImpGrup="";
     //BigDecimal valDato= new BigDecimal(0);
     //int idUsuario=0;

    if(consulta.size()>0){
      registro = (java.util.Map)consulta.get(0);    
      idReporte=(BigDecimal)registro.get("frcoIdReporte");
      idUsuario=(BigDecimal)registro.get("refUsuario");
      numContrato=(BigDecimal)registro.get("refNumFideicomiso");
      nomContrato=(String)registro.get("refNomFideicomiso");
    }
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
        <td><div align='center' class='style15'>ESTADO DE CAMBIOS</div></td>
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

<table width="1176">
            <tr style="font-weight:bolder">
                <td width="20%">Fideicomiso</td>
                <td width="18%"><%=numContrato.intValue() != 0?numContrato.toString():"&nbsp;"%></td>
                <td width="63%"><%=nomContrato%></td>
                
            </tr>
          </table>
     

<br>

    <table border="0" cellspacing="0" cellpadding="0" style="font-size:10pt" width="900">
       <tr>
      <th colspan="1">CUENTAS</th>
      <th colspan="2">DESCRIPCION</th>
      <th colspan="2">FINAL</th>
      <th colspan="1">FINAL</th>
      <th colspan="1">DIFERENCIA</th>
    </tr>
    <tr>
      <th colspan="10">&nbsp;</th>
    </tr>
 <%   
      
    for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
      registro = (java.util.Map)consulta.get(i);
      //Obtener datos de la BD
      cuenta=(BigDecimal)registro.get("salNumCtam");
      descripcion=(String)registro.get("cueNomCta");
      saldo=(BigDecimal)registro.get("salImpSaldoAct");
      fideicomiso=(BigDecimal)registro.get("salNumAux1");
      Anio=(BigDecimal)registro.get("salAnoMovto");
      Mes=(BigDecimal)registro.get("salMesMovto");
      if(Mes.intValue()==1)
      {
        Anio=new BigDecimal(Anio.intValue()-1);
        Mes=new BigDecimal(12);
      }
      else
        Mes=new BigDecimal(Mes.intValue()-1);
      nConsultas.setVtrIntDato1(fideicomiso.intValue());//fideicomiso
      nConsultas.setVtrIntDato2(cuenta.intValue());//cuenta de mayor
      nConsultas.setVtrIntDato3(Anio.intValue());//Año
      nConsultas.setVtrIntDato4(Mes.intValue());//Mes
      nConsultas.querySelect(48);
      String saldoAnt="";
      double saldoAnt1=0.0;
      if(nConsultas.getSize()>0)
        saldoAnt=nConsultas.getVtrStrDato1();  
        saldoAnt1=nConsultas.getVtrDoubleDato1(); 
      difsaldo=new BigDecimal(saldo.intValue()-saldoAnt1);
  %>
     <tr>
          <td align="left" nowrap><%=cuenta.intValue() != 0?cuenta.toString():"&nbsp;"%></td>
          <td colspan="2"><%=descripcion%></td>
          <td colspan="2" align='right'><%=saldoAnt%></td>          
          <td colspan="1" align='right'><%=saldo.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", saldo):".00"%></td>
          <td colspan="1" align='right'><%=difsaldo.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", difsaldo):".00"%></td>     
     </tr>
 <%
    }
 %>
        <tr>
          <th colspan="10">&nbsp;</th>
         </tr>
          
           
       <tr>
        <td colspan="10" nowrap>&nbsp;</td>
      </tr>
    </table>
      <table border="0" cellspacing="0" cellpadding="0" style="font-size:10pt" width="700">
      
 <%   
    
      nConsultas.setVtrIntDato1(idUsuario.intValue());//Usuario
      nConsultas.setVtrIntDato2(idReporte.intValue());//Reporte
      nConsultas.setVtrIntDato3(fideicomiso.intValue());//Fiso
      nConsultas.querySelect(49);
      String valDato="";
       /*if(nConsultas.getSize()>0){
        valDato=nConsultas.getVtrDoubleDato1();
        valImpGrup=nConsultas.getVtrStrDato4();
       } */
       for(int i=0;i<nConsultas.getSize()-1;i++){
       nConsultas.setIndex(i);
      valDato=nConsultas.getVtrStrDato6();
      valImpGrup=nConsultas.getVtrStrDato4();       
      if(nConsultas.getVtrIntDato5()==1){
  %>
           <tr>
                <td width="30%" align="left" style="font-family: Arial;	font-size: 12px;color: #000000;font-weight: bold;" ><%=valImpGrup%></td>
                <td width="8%">&nbsp;</td>
                <td width="50%">&nbsp;</td>
                <td width="12%">&nbsp;</td>
           </tr>
      <%} else {%>
            <tr>
                <td width="30%">&nbsp;</td>
                <td width="8%">&nbsp;</td>
                <td width="50%" align="left" style="font-family: Arial;	font-size: 10px;color: #000000;font-weight: bold;"><%=valImpGrup%></td>
                <td width="12%" align="right" nowrap><%=valDato%></td>
           </tr>
      <%}
      }%>
 
    </table>
  </body>
</html>