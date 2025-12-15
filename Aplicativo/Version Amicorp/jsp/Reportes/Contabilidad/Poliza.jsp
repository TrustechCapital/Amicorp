<!-- Poliza.jsp -->
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
      <body onLoad="self.opener.hideWaitLayer();">
     <%
        //Variable para obtener tupla por tupla
        java.util.Map registro = null;
    
        //Variables que contendrán los elementos de cada tupla
        BigDecimal numContrato = new BigDecimal(0);
        BigDecimal folioOper = new BigDecimal(0);
        BigDecimal sec= new BigDecimal(0); 
        String nomContrato = "";
        String DescMovto = "";
        String DescAsiento = "";
        BigDecimal ctam = new BigDecimal(0);
        BigDecimal scta = new BigDecimal(0);
        BigDecimal sscta = new BigDecimal(0);
        BigDecimal ssscta = new BigDecimal(0);
        BigDecimal sssscta = new BigDecimal(0);
        BigDecimal ssssscta = new BigDecimal(0);
        BigDecimal aux2 = new BigDecimal(0);
        BigDecimal aux3 = new BigDecimal(0);
        BigDecimal cargo = new BigDecimal(0);
        BigDecimal abono = new BigDecimal(0);
        BigDecimal folioCto = new BigDecimal(0);
        BigDecimal secAux = new BigDecimal(0);
        //variables Auxiliares
        BigDecimal folioAnt = new BigDecimal(0);
        BigDecimal secEncabezado = new BigDecimal(0);
        BigDecimal totalCargos = new BigDecimal(0);
        BigDecimal totalAbonos = new BigDecimal(0);
        BigDecimal totalGeneralCargos = new BigDecimal(0);
        BigDecimal totalGeneralAbonos = new BigDecimal(0);
        BigDecimal bigDecimalCero = new BigDecimal(0);
        
        if(consulta.size()>0){
          registro = (java.util.Map)consulta.get(0);
          numContrato = (BigDecimal)registro.get("rasNumContrato");
          nomContrato= (String)registro.get("rasNomContrato");    
          folioAnt = (BigDecimal)registro.get("rasFolioOpera");
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
                <td><div align='center' class='style15'>1 Gcia. Fid. Normat. Control y Reg</div></td>
           </tr>
            <tr>
                <td><div align='center' class='style15'>REPORTE DE POLIZA</div></td>
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
                <td width="63%"><%=nomContrato%></td><!--desc movto-->
                
            </tr>
          </table>
          <P>&nbsp;</P>

           <table width="1176" bgcolor="Gray">
            <tr>
                <td align="center" width="149">Cuenta</td>
                <td align="center" width="533">Auxiliares</td>
                <td align="center" width="296">Concepto</td><!--desc movto-->
                <td align="center" width="94">Cargo</td>
                <td align="center" width="92">Abono</td>
            </tr>
          </table>
          <%
            for(int i = 0; i < consulta.size(); i++) {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
              
              //Obtener datos de la BD
              
              folioOper = (BigDecimal)registro.get("rasFolioOpera");
              sec = (BigDecimal)registro.get("rasSecAsiento");
              DescMovto = (String)registro.get("rasDescMovto");//folio
              DescAsiento = (String)registro.get("rasDescAsiento");
              ctam = (BigDecimal)registro.get("rasNumCtam");
              scta = (BigDecimal)registro.get("rasNumScta");
              sscta = (BigDecimal)registro.get("rasNumSscta");
              ssscta = (BigDecimal)registro.get("rasNumSsscta");
              sssscta = (BigDecimal)registro.get("rasNumSssscta");
              ssssscta = (BigDecimal)registro.get("rasNumSsssscta");
              aux2 = (BigDecimal)registro.get("rasNumAux2");
              aux3 = (BigDecimal)registro.get("rasNumAux3");
              cargo = (BigDecimal)registro.get("rasImpCargo");
              abono = (BigDecimal)registro.get("rasImpAbono"); 
              folioCto = (BigDecimal)registro.get("rasFolioCto");
              
              if(folioAnt.longValue()!=folioOper.longValue()){
                folioAnt=folioOper;
                secAux=new BigDecimal(0);
                secEncabezado=new BigDecimal(0);   
                %>
                <table>
                <tr style="font-weight:bolder">
                <td  align="center" width="79">&nbsp;</td>
                <td  align="center" width="66">&nbsp;</td>
                <td  align="center" width="62">&nbsp;</td>
                <td  align="center" width="69">&nbsp;</td><!--desc movto-->
                <td  align="center" width="69">&nbsp;</td>
                <td  align="center" width="100">&nbsp;</td>
                <td  align="center" width="96">&nbsp;</td>
                <td  align="center" width="63">&nbsp;</td>
                <td  align="center" width="63">&nbsp;</td><!--desc movto-->
                <td  align="right" width="295">Subtotal</td>
                <td  align="center" width="99">
                  <%=  totalCargos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalCargos):"&nbsp;"%>
                </td>
                <td  align="center" width="89">
                  <%=   totalAbonos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalAbonos):"&nbsp;"%>
                </td>
                </tr>
              </table>
             
                <%
                totalCargos=new BigDecimal(0);
                totalAbonos=new BigDecimal(0);                   
              }
              
              if(folioAnt.longValue()==folioOper.longValue()){
                if(secEncabezado.longValue()==0){//control para encabezado por folio                      
          %>
          <table width="1176">
            <tr>
               <td  align="center" width="79">Folio</td>
                <td  align="center" width="89">
                  <%= folioOper.intValue() != 0?folioOper.toString():"&nbsp;"%>
                </td>
                <td  align="center" width="800">
                  <%= DescMovto%>
                </td><!--desc movto-->
                <td  align="center" width="114">No. de Poliza</td>
                <td  align="center" width="82">
                  <%=  folioCto.intValue() != 0?folioCto.toString():"&nbsp;"%>
                </td>
            </tr>
          </table>  
          <%}%>
          <table width="1176">
          <%if(secAux.intValue()==0){%>
            <tr bgcolor="Gray">
                <td  align="center" width="391">Sec</td>
                <td  align="center" width="66">cta</td><!--desc movto-->
                <td  align="center" width="62">Scta</td><!--desc movto-->
                <td  align="center" width="69">Sscta</td>
                <td  align="center" width="69">Ssscta</td>
                <td  align="center" width="100">Sssscta</td>
                <td  align="center" width="96">Ssssscta</td>
                <td  align="center" width="63">Aux2</td><!--desc movto-->
                <td  align="center" width="63">Aux3</td>
                <td  align="center" width="295">&nbsp;</td>
                <td  align="center" width="99">&nbsp;</td>
                <td  align="center" width="89"></td>
            </tr>
            <%}%>
            <tr>
                <td  align="center" width="391">
                  <%=  sec.intValue() != 0?sec.toString():"&nbsp;"%>
                </td>
                <td  align="center" width="66">
                  <%=  ctam.intValue() != 0?ctam.toString():"&nbsp;"%>
                </td>
                <td  align="center" width="62">
                  <%=   scta.intValue() != 0?scta.toString():"&nbsp;"%>
                </td>
                <td  align="center" width="69">
                  <%=   sscta.intValue() != 0?sscta.toString():"&nbsp;"%>
                </td><!--desc movto-->
                <td  align="center" width="69">
                  <%=   ssscta.intValue() != 0?ssscta.toString():"&nbsp;"%>
                </td>
                <td  align="center" width="100">
                  <%=   sssscta.intValue() != 0?sssscta.toString():"&nbsp;"%>
                </td>
                <td  align="center" width="96">
                  <%=   ssssscta.intValue() != 0?ssssscta.toString():"&nbsp;"%>
                </td>
                <td  align="center" width="63">
                  <%=   aux2.intValue() != 0?aux2.toString():"&nbsp;"%>
                </td>
                <td  align="center" width="63">
                  <%=   aux3.intValue() != 0?aux3.toString():"&nbsp;"%>
                </td><!--desc movto-->
               
                <td  align="center" width="295">
                  <%=  DescAsiento%>
                </td>
                <td  align="center" width="99">
                  <%= cargo.doubleValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", cargo):"&nbsp;"%>
                </td>
                <td  align="center" width="89">
                  <%=  abono.doubleValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", abono):"&nbsp;"%>
                </td>   
            </tr>
            
            <%
              totalGeneralCargos= new BigDecimal(totalGeneralCargos.doubleValue() + cargo.doubleValue());
              totalGeneralAbonos= new BigDecimal(totalGeneralAbonos.doubleValue() + abono.doubleValue());
              totalCargos= new BigDecimal(totalCargos.doubleValue() + cargo.doubleValue());
              totalAbonos= new BigDecimal(totalAbonos.doubleValue() + abono.doubleValue());
              secEncabezado=new BigDecimal(secEncabezado.intValue() + 1);
              secAux=new BigDecimal(secAux.intValue() + 1);
              
              if(i==consulta.size()-1){//se evalua cuando es el ultimo registro
            %>
                <table>
                <tr style="font-weight:bolder">
                <td  align="center" width="79">&nbsp;</td>
                <td  align="center" width="66">&nbsp;</td>
                <td  align="center" width="62">&nbsp;</td>
                <td  align="center" width="69">&nbsp;</td><!--desc movto-->
                <td  align="center" width="69">&nbsp;</td>
                <td  align="center" width="100">&nbsp;</td>
                <td  align="center" width="96">&nbsp;</td>
                <td  align="center" width="63">&nbsp;</td>
                <td  align="center" width="63">&nbsp;</td><!--desc movto-->
                <td  align="right" width="295">Subtotal</td>
                <td  align="center" width="99">
                  <%=  totalCargos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalCargos):"&nbsp;"%>
                </td>
                <td  align="center" width="89">
                  <%=   totalAbonos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalAbonos):"&nbsp;"%>
                </td>
                </tr>
              </table>            
            <%
              }
            }
             else{
             %>
            <%/*
              folioAnt=folioOper;
              secAux=new BigDecimal(0);
              totalCargos=new BigDecimal(0);
              totalAbonos=new BigDecimal(0);*/
            }%>
            <tr>
                <td  align="center" width="79">&nbsp;</td>
                <td  align="center" width="66">&nbsp;</td>
                <td  align="center" width="62">&nbsp;</td>
                <td  align="center" width="69">&nbsp;</td><!--desc movto-->
                <td  align="center" width="69">&nbsp;</td>
                <td  align="center" width="100">&nbsp;</td>
                <td  align="center" width="96">&nbsp;</td>
                <td  align="center" width="63">&nbsp;</td>
                <td  align="center" width="63">&nbsp;</td><!--desc movto-->
                
                <td  align="right" width="295">&nbsp;</td>
                <td  align="center" width="99">&nbsp;</td>
                <td  align="center" width="89">&nbsp;</td>   
            </tr>
          </table>
          <%}%>
          <P>&nbsp;</P>
          <table width="1176">
                <tr style="font-weight:bolder">
                <td  align="right" width="966">Total</td>
                <td  align="center" width="104">
                  <%=  totalGeneralCargos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalGeneralCargos):"&nbsp;"%>
                </td>
                <td  align="center" width="104">
                  <%=  totalGeneralAbonos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###.00", totalGeneralAbonos):"&nbsp;"%>
                </td>
                </tr>
          </table>
      </body>
</html>