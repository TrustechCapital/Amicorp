<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td colspan="5" align="center" class="Titulo">Composición de Cartera</td>
          </tr> 
          <tr>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" align="right">
              Fideicomiso&nbsp;&nbsp;<select size="1" name="paramfiso" id="paramfiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="formsLoaded" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
            <td colspan="2" align="right">
              Fecha&nbsp;&nbsp;<input type="text" name="paramfecha" id="paramfecha" size="10" value="" maxlength="10" tipo="Fecha" required message="La Fecha es un campo obligatorio"/>
            </td>
            <td  align="left">
              &nbsp;&nbsp;<input type="BUTTON" value="Aceptar" id="cmdAceptar" name="Aceptar" class="boton" ref="consultaCarteraTRACs" fun="loadTableElement" tabla="tablaCarteraTracs" onclick="if(fvMantenimiento.checkForm())consultarCartera();">
            </td>
          </tr>    
          <tr>
            <td width="100%" colspan="5" align="center" valign="middle"><hr width="70%"></td>
          </tr>
          <tr>
            <td colspan="5" align="center">
            
                <table id="arcCartera" class="cuadroTexto" cellpadding=1 cellspacing=1 width="75%" style="visibility:hidden;">
                  <tr>
                    <td align="center" style="font-weight:bold;font-size:16px;"><%=session.getAttribute("empresa_1")%></td>
                    <td align="center" rowspan=2 ><!--img  src="<%=request.getContextPath()%>/imagenes/smartshares.png" height=50--></td>
                  </tr> 
                  <tr>
                    <td align="center" style="font-weight:bold;font-size:16px;"><%=session.getAttribute("empresa_2")%></td>
                  </tr> 
                  <tr>
                    <td colspan="2" align="center" style="font-weight:bold;font-size:16px;"><hr></td>
                  </tr>
                  <tr>
                    <td align="center" colspan="2" style="font-weight:bold;font-size:16px;" id="carFideicomiso">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center" style="font-weight:bold;font-size:16px;"><hr></td>
                  </tr>
                  <tr>
                    <td width="40%"><b>FECHA</b></td>
                    <td width="30%" align="right" id="carFecha">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>CLAVE PIZARRA</b></td>
                    <td align="right" id="carPizarra">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>SERIE</b></td>
                    <td align="right" id="carSerie">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>NUMERO DE CERTIFICADOS EN CIRCULACION</b></td>
                    <td align="right" id="carCerCirculacion">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>NUMERO DE CERTIFICADOS CREADOS</b></td>
                    <td align="right" id="carCerCreados">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>NUMERO DE CERTIFICADOS REDIMIDOS</b></td>
                    <td align="right" id="carCerRedimidos">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>VALOR TEÓRICO DE LA CANASTA</b></td>
                    <td align="right" id="carValCanasta">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>CANTIDAD DE VALORES (NAFTRACS) POR CANASTA</b></td>
                    <td align="right" id="carNumNaftracs">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>NUMERO DE CERTIFICADOS POR UNIDAD MINIMA</b></td>
                    <td align="right" id="carCerUnidad">&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>VALOR NETO DE LOS ACTIVOS</b></td>
                    <td align="right" id="carValActivos">&nbsp;</td>
                  </tr>
                  <tr colspan=2 height="5">
                    <td>&nbsp;</td>
                  </tr>
                  <tr>
                    <td><b>CUENTA DE GASTOS</b></td>
                    <td align="right" id="carCtaGastos">&nbsp;</td>
                  </tr>
                  <tr colspan=2 height="5">
                    <td>&nbsp;</td>
                  </tr>
                </table>

            </td>
          </tr>
          
          <tr>
            <td width="100%" colspan="5" align="center" valign="middle"><hr width="80%"></td>
          </tr>
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="100px">Emisora</td>
                  <td width="100px">Serie</td>
                  <td width="100px">Titulos</td>
                  <td width="100px">Precio Cierre</td>
                  <td width="100px">Valor Mercado</td>
                </tr>
              </table>
              <div style="height:30px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tablaPosicion" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaCarteraData" keys="temIdFolio" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda" class="texto" style="background-color:white;">
                <tr>
                  <td width="23px">&nbsp;</td>
                  <td width="100px">&nbsp;</td>
                  <td width="100px">&nbsp;</td>
                  <td width="100px" id="anumTitulos">&nbsp;</td>
                  <td width="100px" id="aprecioNaftrac">&nbsp;</td>
                  <td width="100px" id="avalorMercado">&nbsp;</td>
                  </td>
                </tr>
                
                </table>
              </div>
            </td>
          </tr>
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="100px">Contrato</td>
                  <td width="100px">Serie</td>
                  <td width="100px">Contratos</td>
                  <td width="100px">Precio Cierre</td>
                  <td width="100px">Valor Contable</td>
                </tr>
              </table>
              <div style="height:30px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tablaContratos" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaCarteraData" keys="temIdFolio" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda" class="texto" style="background-color:white;">
                
                <tr>
                  <td width="523px" align="left">
                    
                  </td>
                </tr>
                
                </table>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td width="60%" height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
