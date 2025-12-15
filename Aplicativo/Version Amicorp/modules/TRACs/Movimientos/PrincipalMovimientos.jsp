<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Consulta Movimientos</td>
    </tr>
    <tr>
      <td>&nbsp;
          <input type="text" id="paramorder" name="paramorder" maxlength="10" size="10" value="s" style="visibility:hidden;position:absolute;"/>
      </td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td colspan = 5 align="center">
                <table width =100% class="texto">
                  <tr>
                    <td align="center">
                      Fecha Recepción&nbsp;&nbsp;<input type="text" id="paramfechaOpe" name="paramfechaOpe" maxlength="10" size="10" tipo="Fecha" required message="La fecha de recepción es un campo obligatorio"/>&nbsp;&nbsp;
                    </td>
                    <td align="center">
                      Fecha Liquidación&nbsp;&nbsp;<input type="text" id="paramfechaLiq" name="paramfechaLiq" maxlength="10" size="10" tipo="Fecha" />&nbsp;&nbsp;
                    </td>
                    <td align="center">
                      Fideicomiso&nbsp;&nbsp;<select size="1" name="paramfiso" id="paramfiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"  param="cmbFideicomisoTrac" next="paramstatus" required message="El Fideicomiso es un campo obligatorio"/>&nbsp;&nbsp;
                    </td>
                    <td align="center">
                      Estatus&nbsp;&nbsp;<select size="1" name="paramstatus" id="paramstatus" ref="conETDatInd" fun="loadComboElement" keyValue="eindDescripcion" theValue="eindDescripcion"  param="cmbParam661" next="formsLoaded"/>&nbsp;&nbsp;
                    </td>
                    <td align="center">
                      <input type="BUTTON" value="Consultar" id="cmdConsultar" name="cmdConsultar" class="boton"  ref="consultaOpeTrack" fun="loadTableElement" tabla="tabla" onclick="consultarMovimientos(this);">
                    </td>
                  </tr>
                  </table>
              </td>
          <tr>
            <td colspan="5" align="center">
              <hr width="80%">
            </td>
          </tr>
          
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0" width="1213px">
                <tr align="left" class="cabeceras">
                  <td width="23px">&nbsp;</td>
                  <td width="50px">Folio</td>
                  <td width="50px">Pizarra</td>
                  <td width="80px">Operación</td>
                  <td width="200px">Casa de Bolsa</td>
                  <td width="200px">Acreditado</td>
                  <td width="50px">Hora</td>
                  <td width="80px">Fecha Recepción</td>
                  <td width="80px">Fecha Liquidación</td>
                  <td width="80px">Unidades Solicitadas</td>
                  <td width="80px">Unidades Asignadas</td>
                  <td width="80px">Cta Indeval Casa Bolsa</td>
                  <td width="80px">Cta Indeval </td>
                  <td width="80px">Status</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tabla" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaData" keys="traIdFolio,traIdPizarra,traCveOperacion,traNumIntermediario,traNumAcreditado,traHoraRecepcion,traNumUnidadesSol" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Registros para estos criterios de búsqueda">
                </table>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="5" style="position:relative;height:0;">
                  <div id="totalUnidades" style="position:absolute;top:0;right:0;visibility:hidden;">
                      <table class="cuadroTexto" style="font-size:12px;" cellpadding="0" width="400px;" cellspacing="0" border=0>
                        <tr class="cabeceras">
                          <td align="left">Operación</td>
                          <td align="right">Unidades Solicitadas</td>
                          <td align="right">Unidades Asignadas</td>
                        </tr>
                        <tr>
                          <td align="left">
                            <b>CREACIONES</b>
                          </td>
                          <td align="right" id="creacionUS"><b></b></td>
                          <td align="right" id="creacionUA"><b></b></td>
                        </tr>
                        <tr>
                          <td align="left">
                            <b>REDENCIONES</b>
                          </td>
                          <td align="right" id="redencionUS"><b></b></td>
                          <td align="right" id="redencionUA"><b></b></td>
                        </tr>
                      </table>
                  </div>
            </td>
          </tr>
          <tr>
            <td colspan="5" align="center">
                  <div id="fichaConfirm" style="visibility:hidden;">
                      <table class="cuadroTexto" cellpadding="2" cellspacing="2" border=0>
                        <tr>
                          <td colspan=3 align=center style="font-size:16px;">
                            <b><%=session.getAttribute("empresa_1")%>,<%=session.getAttribute("empresa_2")%></b>
                          </td>
                          <td rowspan=3><!--img src="<%=request.getContextPath()%>/imagenes/logo_smartshares.png" height="50"--></td>
                        </tr>
                        <tr>
                          <td colspan=3 align=center style="font-size:14px;" id="ficFiso">
                            <b>FIDEICOMISO</b>
                          </td>
                        </tr>
                        <tr>
                          <td colspan=3 align="center">
                            <hr width="90%" align="right" style="color:#4199f0;">
                            <hr width="100%" align="right" style="color:#4199f0;">
                          </td>
                        </tr>
                        <tr>
                          <td colspan=4 align="center">
                            <hr>
                          </td>
                        </tr>
                        <tr>
                          <td colspan=4 align="center" id="ficCaptura">
                            <b>CAPTURA</b>
                          </td>
                        </tr>
                        <tr>
                          <td>Unidades Disponibles del Día:</td>
                          <td align="right" id="ficUDD"><b>UDD</b></td>
                          <td  id="ficSUDCB">Unidades Disponibles <b>CB</b>:</td>
                          <td align="right" id="ficUDCB"><b>UDCB</b></td>
                        </tr>
                        <tr>
                          <td colspan=4 align="center">
                            <hr>
                          </td>
                        </tr>
                        <tr>
                          <td align="right">Unidades Solicitadas:</td>
                          <td align="left" id="ficUS"><b>US</b></td>
                          <td align="left" colspan=2>
                            <b><u>Unidades Asignadas</u>:</b>
                            <input id="ficUA" type="text" size="5" value="">
                          </td>
                        </tr>
                        <tr>
                          <td colspan=2 align="justify" id="msgError" style="color:red;">
                          </td>
                          <td colspan=2 align="right" style="color:#888888;font-size:20;">
                             Consulta Movimiento
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
