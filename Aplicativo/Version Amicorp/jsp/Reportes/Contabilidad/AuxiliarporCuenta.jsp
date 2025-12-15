<!-- AuxiliarporCuenta.jsp -->
<jsp:useBean id="Periodo"  class="com.nafin.negocio.nConsultas"/>
<%@ page contentType="text/html;charset=windows-1252 "%>
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
java.util.List consulta = (java.util.List)request.getAttribute("consulta");
%>
<html>
      <head>
      <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
      <title>Auxiliar por Cuenta</title>
      </head>
      <body onload="self.opener.hideWaitLayer();">
      <table width="900"  style="font-family: Arial;font-size: 9px;" align="center" >   
     <%
        //Variable para obtener tupla por tupla
        java.util.Map registro = null;
    
        //Variables que contendrán los elementos de cada tupla
        BigDecimal numContrato = new BigDecimal(0);
        BigDecimal folioOper = new BigDecimal(0);
        BigDecimal sec= new BigDecimal(0); 
        String nomContrato = "";
        String nomCuenta = "";
        String DescMovto = "";
        String DescAsiento = "";
        String Fecha = "";
        String FechaAnt = "";
        String numCuenta = "";
        String numCuentaAnt ="";
        String sPeriodo ="";

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
        BigDecimal saldoInicial = new BigDecimal(0);
        BigDecimal saldoParcial = new BigDecimal(0);
        //variables Auxiliares
        BigDecimal folioAnt = new BigDecimal(0);
        BigDecimal secEncabezado = new BigDecimal(0);
        BigDecimal totalCargos = new BigDecimal(0);
        BigDecimal totalAbonos = new BigDecimal(0);
        BigDecimal totalGeneralCargos = new BigDecimal(0);
        BigDecimal totalGeneralAbonos = new BigDecimal(0);
        BigDecimal bigDecimalCero = new BigDecimal(0);
        BigDecimal encabezado = new BigDecimal(9);
        BigDecimal totalRenglones = new BigDecimal(46);
        BigDecimal renglones = new BigDecimal(totalRenglones.intValue()-encabezado.intValue());
        BigDecimal cuentaRenglones = new BigDecimal(0);
        
        
       
       
        int pagina=1;
        if(consulta.size()>0){
          registro = (java.util.Map)consulta.get(0);
          numContrato = (BigDecimal)registro.get("rpoNumAux1");
          nomContrato= ((String)registro.get("rpoCtoNomContrato")).split("---")[0];  
          nomCuenta= ((String)registro.get("rpoCtoNomContrato")).split("---")[1];  
          FechaAnt = (String)registro.get("rpoFecha"); 
          numCuentaAnt = (String)registro.get("numCuenta"); 
          Periodo.setVtrIntDato1(Integer.valueOf(session.getAttribute("userid").toString()).intValue());
          Periodo.querySelect(54);
          if(Periodo.hasData())
            sPeriodo="RELACION DE CUENTAS DEL "+Periodo.getVtrStrDato1()+" AL "+Periodo.getVtrStrDato2();
        }        
    %>
              <tr>
                <td rowspan="5"   align="center"><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"  height="40"></td>
                <td colspan="5" align="right">&nbsp;<font style="font-family: Arial;font-size: 7px;"> Página: <%=pagina%></font></td>
              </tr>
              <tr><th colspan="5"><%=session.getAttribute("empresa_1")%></th></tr>
              <tr><th colspan="5"><%=session.getAttribute("empresa_2")%></th></tr>
              <tr><th colspan="5">AUXILIAR POR CUENTA</th></tr>
              <tr ><th colspan="5"><%=sPeriodo%></th></tr>
              <tr>         
              <td width="70">&nbsp;</td>
              <td width="220">&nbsp;</td>
              <td width="290">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="110" align="right"><%=session.getAttribute("strFechaContable")%></td>
              </tr> 
 
            <tr>
                <th  colspan="6" align="left">Fideicomiso <%=numContrato.intValue() != 0?numContrato.toString():"&nbsp;"%> - <%=nomContrato%>
                </th>               
            </tr>                        
            <tr>
                <th  colspan="6" align="left">Nombre de la cuenta: <%=nomCuenta%>
                </th>               
            </tr>
            
          <tr><td colspan="6"><hr size="1"></td></tr>
            <tr bgcolor="#CCCCCC">
                <th>FECHA</th>
                <th>CUENTA</th>
                <th>DESCRIPCION</th>
                <th align="right">CARGOS</th>
                <th align="right">ABONOS</th>
                <th align="right">SALDO PARCIAL</th>
            </tr>
         <tr><td colspan="6">&nbsp;</td></tr>
<%//IMPRESION DE REGISTROS
            for(int i = 0; i < consulta.size(); i++) 
              {  //Para cada registro
              registro = (java.util.Map)consulta.get(i); 
              //Obtener datos de la BD
              Fecha =(String)registro.get("rpoFecha");//Fecha
              folioOper = (BigDecimal)registro.get("rpoNumFolio");//secuencial de asiento
              //sec = (BigDecimal)registro.get("rasSecAsiento");
              DescAsiento = (String)registro.get("rpoDescAsiento");//folio
              numCuenta = (String)registro.get("numCuenta");
              cargo = (BigDecimal)registro.get("rpoCargos");
              abono = (BigDecimal)registro.get("rpoAbonos");   
              saldoInicial = (BigDecimal)registro.get("rpoSalIni");  
              saldoParcial = new BigDecimal(saldoInicial.doubleValue()+cargo.doubleValue()-abono.doubleValue());
              if(!FechaAnt.equalsIgnoreCase(Fecha))
                      {//SUBTOTALES CARGOS/ABONOS
                      FechaAnt=Fecha;
                      secAux=new BigDecimal(0);
                      secEncabezado=new BigDecimal(0);   
                      %>
                      <tr>
                      <td colspan="3">&nbsp;</td>
                      <th align="right"><%=totalCargos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###,###,###,###,###,###,###,###,###,###.00", totalCargos):"&nbsp;"%></th>
                      <th align="right"><%=totalAbonos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###,###,###,###,###,###,###,###,###,###.00", totalAbonos):"&nbsp;"%></th>
                      <td>&nbsp;</td>               
                      </tr>
                      <%
                        totalCargos=new BigDecimal(0);
                        totalAbonos=new BigDecimal(0);  
                        totalGeneralCargos=new BigDecimal(0);
                        totalGeneralAbonos=new BigDecimal(0);
                        cuentaRenglones = new BigDecimal(cuentaRenglones.intValue()+1);
                        
               if((cuentaRenglones.intValue()+2)==renglones.intValue())
                  {
                  pagina=pagina+1;
                  %>
                    <tr><td colspan="6">&nbsp;</td></tr>
                    <tr style="page-break-after:always;"><th colspan="6">&nbsp;</th></tr> 
            
            
						 <tr>
                <td rowspan="5"   align="center"><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"  height="40" width="60"></td>
                <td colspan="5" align="right">&nbsp;<font style="font-family: Arial;font-size: 7px;"> Página: <%=pagina%></font></td>
              </tr>
              <tr><th colspan="5"> 
                PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.              </th></tr>
              <tr><th colspan="5">DIVISION FIDUCIARIA</th></tr>
              <tr><th colspan="5">AUXILIAR POR CUENTA</th></tr>
              <tr ><th colspan="5"><%=sPeriodo%></th></tr>
             <tr>         
              <td width="70">&nbsp;</td>
              <td width="220">&nbsp;</td>
              <td width="290">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="110" align="right"><%=session.getAttribute("strFechaContable")%></td>
              </tr> 
              <tr>
                <th  colspan="6" align="left">Fideicomiso <%=numContrato.intValue() != 0?numContrato.toString():"&nbsp;"%> - <%=nomContrato%>
                </th>               
            </tr>
              <tr><td colspan="6"><hr size="1"></td></tr>
              <tr bgcolor="#CCCCCC">
                <th>FECHA</th>
                <th>CUENTA</th>
                <th>DESCRIPCION</th>
                <th align="right">CARGOS</th>
                <th align="right">ABONOS</th>
                <th align="right">SALDO PARCIAL</th>
              </tr>
              <tr><td colspan="6">&nbsp;</td></tr>
	<%cuentaRenglones = new BigDecimal(0);
	}}
              if(FechaAnt.equalsIgnoreCase(Fecha))
                {
                if(secEncabezado.longValue()==0)
                {//control para encabezado por fecha                      
                %>
                <tr>
                  <th><%=Fecha%></th>
                  <th colspan="2" align="right">Saldo Inicial:</td>
                  <th align="right">&nbsp;</th>
                  
                  <th colspan="2" align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00",new BigDecimal(saldoInicial.doubleValue()+abono.doubleValue()-cargo.doubleValue()))%></th>                
                  
                </tr>
              <%cuentaRenglones = new BigDecimal(cuentaRenglones.intValue()+1);
               if((cuentaRenglones.intValue()+2)==renglones.intValue())
    {
    pagina=pagina+1;
    %>
              <tr><td colspan="6">&nbsp;</td></tr>
              <tr style="page-break-after:always;"><th colspan="6">&nbsp;</th></tr> 
               
              
						 <tr>
                <td rowspan="5"   align="center"><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"  height="40" width="60"></td>
                <td colspan="5" align="right">&nbsp;<font style="font-family: Arial;font-size: 7px;"> Página: <%=pagina%></font></td>
              </tr>
              <tr><th colspan="5"> 
                PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.              </th></tr>
              <tr><th colspan="5">DIVISION FIDUCIARIA</th></tr>
              <tr><th colspan="5">AUXILIAR POR CUENTA</th></tr>
              <tr ><th colspan="5"><%=sPeriodo%></th></tr>
             <tr>         
              <td width="70">&nbsp;</td>
              <td width="220">&nbsp;</td>
              <td width="290">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="110" align="right"><%=session.getAttribute("strFechaContable")%></td>
              </tr> 
              <tr>
                <th  colspan="6" align="left">Fideicomiso <%=numContrato.intValue() != 0?numContrato.toString():"&nbsp;"%> - <%=nomContrato%>
                </th>               
            </tr>
              <tr><td colspan="6"><hr size="1"></td></tr>
              <tr bgcolor="#CCCCCC">
                <th>FECHA</th>
                <th>CUENTA</th>
                <th>DESCRIPCION</th>
                <th align="right">CARGOS</th>
                <th align="right">ABONOS</th>
                <th align="right">SALDO PARCIAL</th>
              </tr>
              <tr><td colspan="6">&nbsp;</td></tr>
              <%cuentaRenglones = new BigDecimal(0);
              }
                }
               }%>
            <tr>
                <td>&nbsp;</td>
                <td align="center"> <%=numCuenta%></td>
                <td align="left" nowrap> <%=DescAsiento%></td>
                <td align="right"> <%=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00", cargo)%></td>
                <td align="right"> <%=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00", abono)%></td>
                <td align="right"> <%=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00", saldoInicial)%></td>                
            </tr>
            
            <%
              totalGeneralCargos= new BigDecimal(totalGeneralCargos.doubleValue() + cargo.doubleValue());
              totalGeneralAbonos= new BigDecimal(totalGeneralAbonos.doubleValue() + abono.doubleValue());
              totalCargos= new BigDecimal(totalCargos.doubleValue() + cargo.doubleValue());
              totalAbonos= new BigDecimal(totalAbonos.doubleValue() + abono.doubleValue());
              secEncabezado=new BigDecimal(secEncabezado.intValue() + 1);
              secAux=new BigDecimal(secAux.intValue() + 1);
              cuentaRenglones = new BigDecimal(cuentaRenglones.intValue()+1);
              if((cuentaRenglones.intValue()+2)==renglones.intValue())
    {
    pagina=pagina+1;
    %>
              <tr><td colspan="6">&nbsp;</td></tr>
              <tr style="page-break-after:always;"><th colspan="6">&nbsp;</th></tr>  
               
              
						 <tr>
                <td rowspan="5"   align="center"><img src="<%=request.getContextPath()%>/imagenes/logo_bn.jpg"  height="40" width="60"></td>
                <td colspan="5" align="right">&nbsp;<font style="font-family: Arial;font-size: 7px;"> Página: <%=pagina%></font></td>
              </tr>
              <tr><th colspan="5"> 
                PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.              </th></tr>
              <tr><th colspan="5">DIVISION FIDUCIARIA</th></tr>
              <tr><th colspan="5">AUXILIAR POR CUENTA</th></tr>
              <tr ><th colspan="5"><%=sPeriodo%></th></tr>
             <tr>         
              <td width="70">&nbsp;</td>
               <td width="220">&nbsp;</td>
              <td width="290">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="105">&nbsp;</td>
              <td width="110" align="right"><%=session.getAttribute("strFechaContable")%></td>
              </tr> 
             <tr>
                <th  colspan="6" align="left">Fideicomiso <%=numContrato.intValue() != 0?numContrato.toString():"&nbsp;"%> - <%=nomContrato%>
                </th>               
            </tr>
              <tr><td colspan="6"><hr size="1"></td></tr>
              <tr bgcolor="#CCCCCC">
                <th>FECHA</th>
                <th>CUENTA</th>
                <th>DESCRIPCION</th>
                <th align="right">CARGOS</th>
                <th align="right">ABONOS</th>
                <th align="right">SALDO PARCIAL</th>
              </tr>
              <tr><td colspan="6">&nbsp;</td></tr>
              <%cuentaRenglones = new BigDecimal(0);
                }
              if(i==consulta.size()-1)
                {//se evalua cuando es el ultimo registro
                
                %>
                                      
                <tr>
                  <th colspan="3">&nbsp;</th>
                  <th align="right"><%=totalCargos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00", totalCargos):"&nbsp;"%></th>
                  <th align="right"><%=totalAbonos.intValue() != 0?DecimalFormatUtils.getFormatedNumber("###,###,###,###,###.00", totalAbonos):"&nbsp;"%></th>
                  <th>&nbsp;</th>
                </tr>
                     
                <%cuentaRenglones = new BigDecimal(cuentaRenglones.intValue()+1);
                  }
            }// fin recorroido de datos                  
          %>
          <tr><td colspan="6">&nbsp;</td></tr>     
                <tr>
                <th colspan="3" align="right">SALDO FINAL:</th>
                <th colspan="2">&nbsp;</th>                
                <th align="right"><%=DecimalFormatUtils.getFormatedNumber("###,###,###,###,###,###,###,###,###,###,###,###,###,###,###.00", saldoInicial)%></th>
                </tr>
          <%cuentaRenglones = new BigDecimal(cuentaRenglones.intValue()+2);
          
          					 while((cuentaRenglones.intValue()+2)<=renglones.intValue())
								 			{
											 
											%>
                      <tr><td colspan="6">&nbsp;</td></tr>
                      <%
									cuentaRenglones = new BigDecimal(cuentaRenglones.intValue()+1);
											} 
          
          %>  
          </table>
           
      </body>
</html>