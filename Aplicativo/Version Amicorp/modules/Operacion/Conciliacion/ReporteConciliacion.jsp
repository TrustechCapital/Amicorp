
<%@ page import="java.math.BigDecimal, mx.gob.nafin.fiduciario.common.util.DecimalFormatUtils"%>
<%
 
    java.util.List consulta = (java.util.List)request.getAttribute("consulta");
    //Variable para obtener tupla por tupla
    java.util.Map registro = null;
    
    //Variables que contendrán los elementos de cada tupla
        
    String fecha="";
    String folio_ext="";
    String cuenta_ext="";
    String tipo_mov_ext="";
    String importe_mov_ext ="";
    String folios_conc_ext="";
    String estatus_mov_ext="";
    String folio_int="";
    String cuenta_int="";
    String tipo_mov_int="";
    String importe_mov_int ="";
    String folios_conc_int="";
    String estatus_mov_int="";
    String diferencia_dep="";           
    String diferencia_ret="";
    
    String folio_aux="";
    
    BigDecimal importe_ext = new BigDecimal(0);
    BigDecimal importe_int = new BigDecimal(0);
    BigDecimal diferencia_depositos = new BigDecimal(0);
    BigDecimal diferencia_retiros = new BigDecimal(0);
    
    int contador=0;
    int unavez=0;
    int residuales=0;

int externos=0;

if(consulta.size()>0) 
{ 
    registro = (java.util.Map)consulta.get(0);              
    fecha=(String)registro.get("frcFecha");
    
    diferencia_depositos = diferencia_depositos.add(new BigDecimal(((String)registro.get("frcFoliosConcExt")).split("---")[0]));
    diferencia_dep=DecimalFormatUtils.getFormatedNumber("###,###,###,##0.00", diferencia_depositos);
        
    diferencia_retiros = diferencia_retiros.add(new BigDecimal(((String)registro.get("frcFoliosConcExt")).split("---")[1]));
    diferencia_ret=DecimalFormatUtils.getFormatedNumber("###,###,###,##0.00", diferencia_retiros);           
}

%>

<html> 
<head>
<title>REPORTE CONCILIACION <%=fecha%></title>
   <style>
      .title
      {
            font-family: Calibri,Arial,Helvetic;	font-size: 13px;color: #000000;font-weight:bold;
      }
   </style>
</head>
<body>
<table width="960" border="0" align="center">
<tr><td><hr width="960" size="1"> </td></tr>
</table>


<table border='0' bordercolor='#000000' bgcolor='#FFFFFF'>
		<tr>		
		<td>
			<table width='860'>
				<tr>
					<td align="CENTER"  style="font-family: Calibri,Arial,Helvetic;	font-size: 16px;color: #000000;font-weight: bold;">PROTEGO&nbsp;CASA&nbsp;DE&nbsp;BOLSA S.A. de C.V.</td>
				</tr>
				<tr>
					<td><div align='center' style="font-family: Verdana, Arial, Helvetica;	font-size: 12px;color: #000000;font-weight: bold;">DIVISION FIDUCIARIA</div></td>
				</tr>
				<tr>
					<td><div align='center' class="title"></div></td>
				</tr>
				<tr><td height='23'>&nbsp;</td></tr>
        <tr><td align="center" class="title">REPORTE CONCILIACION <%=fecha%></td></tr>
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
<table width="960" border="0" align="center">
<tr><td><hr width="960" size="1"> </td></tr>
</table>	
          <P>&nbsp;</P>
<table width="900"  border="0" cellpadding="2" cellspacing="0" align="center"  style='font-family: Calibri,Arial,Helvetic;	font-size: 10px;color: #000000;'>
          <tr>
            <td colspan="5" align='center'  style='font-family: Calibri,Arial,Helvetic;	font-size: 14px;<%=!diferencia_dep.equals("0.00")?"background-color:#FF9D9D;color:#FFFFFF;":"color:#000000"%>;font-weight: bold;'>Diferencia en Depositos:&nbsp;&nbsp;<%=diferencia_dep%></td>
            <td colspan="5" align='center'  style="font-family: Calibri,Arial,Helvetic;	font-size: 14px;<%=!diferencia_ret.equals("0.00")?"background-color:#FF9D9D;color:#FFFFFF;":"color:#000000"%>;font-weight: bold;">Diferencia en Retiros:&nbsp;&nbsp;<%=diferencia_ret%></td>
          </tr>
          <tr>
            <td colspan="10" align='center'>&nbsp;</td>
          </tr>
          <tr>
              <td align="center" colspan="5" width="450"  class="title">Movimientos Externos<hr/></td>
              <td align="center" colspan="5" width="450"  class="title">Movimientos Fiducia Web<hr/></td>              
          </tr>
          <tr>
              <td align="center" width="100"  class="title" colspan=2>Folio</td>
              <td align="center" width="100"  class="title">Importe</td>
              <td align="center" width="150"  class="title">Folios Conciliados</td>
              <td align="center" width="100"  class="title">Estatus</td> 
              <td align="center" width="100"  class="title">Folio</td>
              <td align="center" width="100"  class="title">Cuenta</td>
              <td align="center" width="100"  class="title">Importe</td>
              <td align="center" width="100"  class="title">Estatus</td> 
              <td align="center" width="100"  class="title">Tipo Movto</td> 
          </tr>
                    
          <%
           for(int i = 1; i < consulta.size(); i++) 
            {  //Para cada registro
                               
              importe_ext = new BigDecimal(0);
              importe_int = new BigDecimal(0);
    
              registro = (java.util.Map)consulta.get(i);  
              
              folio_ext=(String)registro.get("frcFolioExt");
              cuenta_ext=(String)registro.get("frcCuentaExt");
              tipo_mov_ext=(String)registro.get("frcTipoMovExt");
              folios_conc_ext=(String)registro.get("frcFoliosConcExt");
              estatus_mov_ext=(String)registro.get("frcEstatusMovExt");
              
              folio_int=(String)registro.get("frcFolioInt");
              cuenta_int=(String)registro.get("frcCuentaInt");
              tipo_mov_int=(String)registro.get("frcTipoMovInt");
              folios_conc_int=(String)registro.get("frcFoliosConcInt");
              estatus_mov_int=(String)registro.get("frcEstatusMovInt");
              
              
              importe_ext = importe_ext.add(new BigDecimal((String)registro.get("frcImporteMovExt")));
              importe_mov_ext=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", importe_ext);
              
              importe_int = importe_int.add(new BigDecimal((String)registro.get("frcImporteMovInt")));
              importe_mov_int=DecimalFormatUtils.getFormatedNumber("###,###,###,###.00", importe_int);
                               
          %>
          <%
          if(folios_conc_ext!=null && folios_conc_ext.equals("SEPARA_FOLIO")){
             out.write("<tr><td colspan='10' align='center'></td></tr>");                 
              }else{
             %>   
          <tr style='font-family: Calibri,Arial,Helvetic;	font-size: 11px;color: #000000;<%=estatus_mov_ext!=null&&estatus_mov_ext.equals("ACTIVO")?"background-color:#FF9D9D;":""%>' >   
            <%if(folio_ext!=null || residuales==1){%>
            <%if(folio_ext!=null && folio_aux!=folio_ext){%>
            <td align="right" width="100" ><%=(folio_ext==null)?"":folio_ext%></td>                         
            <td align="right" width="100" ></td> 
            <td  align="right" width="100"><%=(importe_mov_ext==null)?"":importe_mov_ext%></td> 
            <td  align="right" width="100"><%=(folios_conc_ext==null)?"":folios_conc_ext%></td>
            <td  align="right" width="100"><%=(estatus_mov_ext==null)?"":estatus_mov_ext%></td>
            <%}else{out.write("<td colspan='5' align='center'></td>");}%>
            
            <td align="right" width="100"><%=(folio_int==null)?"":folio_int%></td>
            <td align="right" width="100" ><%=(cuenta_int==null)?"":cuenta_int%></td>  
            <td  align="right" width="100"><%=(importe_mov_int==null)?"":importe_mov_int%></td> 
            <td  align="right" width="100" colspam=2><%=(estatus_mov_int==null)?"":estatus_mov_int%></td>
            <td  align="right" width="100" colspam=2><%=(tipo_mov_int==null)?"":tipo_mov_int%></td> 
            
            <%}else if(folios_conc_ext.equals("SIN CONCILIAR")){out.write("<td colspan='5' align='center'></td><td colspan='5' align='center'><b>"+folios_conc_ext+"</page></td>");
            }else{out.write("<td colspan='5' align='center'>"+folios_conc_ext+"</td><td colspan='5' align='center'></td>"); }%>            
          </tr>  
          <%}%>
          
          <%if(folios_conc_ext!=null && folios_conc_ext.equals("SIN CONCILIAR")){residuales=1;}%>
                       
      <%
      folio_aux=folio_ext;     
      } %>
            
    </table>
        
</body>
</html>