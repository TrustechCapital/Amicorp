<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Control de Operaciones</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" align="center" class="texto">
          <tr>
            <td width="20%">&nbsp;</td>
            <td nowrap width="15%">Fideicomiso</td>
            <td colspan = 3>
              <select size="1" name="paramfideicomiso" id="paramfideicomiso" ref="conNumFidNomFid" fun="loadComboElement" keyValue="ctoNumContrato" theValue="ctoNomContrato"  param="cmbFideicomiso" next="paramfecha" required message="El Fideicomiso es un campo obligatorio"/>
            </td>
          </tr>
          <tr>
            <td width="20%">&nbsp;</td>
            <td colspan=3> 
            
              <table class="texto">
                <tr>
                  <td nowrap>Fecha</td>
                  <td> 
                    <input type="text" id="paramfecha" name="paramfecha" maxlength="10" size="10" tipo="Fecha" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" required message="La Fecha es un campo obligatorio"/>
                   </td>
                </tr>
              </table>
              
            </td>
            <td width="50%">
              <table width="224" cellpadding="0" cellspacing="0">
                <tr>
                <td width="112"  align="center" valign="middle">
                  <input type="BUTTON" value="Generar" id="cmdGenerar" name="cmdGenerar" class="boton_left" onmouseover="this.className='boton_leftSobre'" onmouseout="this.className='boton_left';"  onclick="generaControl();">
                  </td>
                  <td width="112" align="center" valign="middle">
                  <input type="BUTTON" value="Limpiar" id="cmdLimpiar" name="cmdLimpiar" class="boton_right" onmouseover="this.className='boton_rightSobre'" onmouseout="this.className='boton_right';" onclick="limpiar(frmDatos);"/>
                </td>
                </tr>
            </table> 
            </td>
          </tr>
                 
          <tr>
            <td colspan="5" align="center">
              <hr width="80%">
              <input type="text" name="paramorderC" id="paramorderC" size="2" value="s" style="visibility:hidden;position:absolute;"/>
            </td>
          </tr>
          <tr align="center">
            <td colspan="5">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr align="left" class="cabeceraControl">
                  <td width="23px">
                    <input type="BUTTON" value="" id="cmdConsultar" name="cmdConsultar" class="btnSearch" ref="qryFControl" fun="loadTableElement" tabla="tabla" onclick="consultaControl(this)" title="Consultar"/> 
                  </td>
                  <td width="50px">Folio</td>
                  <td width="100px">Movimiento</td>
                  <td width="100px">Cta Cheques</td>
                  <td width="150px">Subcta</td>
                  <td width="100px">Cta Cheques2</td>
                  <td width="150px">Subcta2</td>
                  <td width="100px">Importe</td>
                  <td width="200px">Concepto</td>
                  <td width="100px">Status</td>
                </tr>
              </table>
              <div style="height:250px; width:1073px; overflow:auto; position:relative; vertical-align:top;">
                <table id="tabla" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaData" keys="ctrlIdMovto" fun="clickTabla" radioWidth="23" NoRecordsMsg="No existen Operaciones para la Fecha y Fideicomiso seleccionados, ó no se ha generado Control">
                </table>
              </div>
            </td>
          </tr>
          <tr align="center">
            <td colspan="5" id="tdAsientos" style="visibility:hidden;">
              <FORM name="frmDatosExtra" id="frmDatosExtra"  onsubmit="">
              
                <input type="text" name="paramOrder" id="paramOrder" size="2" value="" style="visibility:hidden;position:absolute;"/>
                <input type="text" name="paramFolio" id="paramFolio" size="2" value="" style="visibility:hidden;position:absolute;"/>
                <input type="BUTTON" value="" id="cmdConsultarAsientos" name="cmdConsultarAsientos" style="position:absolute;visibility:hidden;" ref="qryAsientosControl" fun="loadTableElement" tabla="tablaExtra" /> 
                        
                  <table cellspacing="0"  cellpadding="0" border="0">
                    <tr>
                      <td align="center" class="subtitulo"  style="font-size:16px;" colspan ="18">
                        Detalle Asiento<hr width="80%">
                      </td>
                    </tr>
                    <tr align="left" class="cabeceraControl">
                      <td width="23px">&nbsp;</td>
                      <td width="50px">Folio</td>
                      <td width="100px">Operación</td>
                      <td width="50px">Guía</td>
                      <td width="100px">Fecha</td>
                      <td width="50px">Cta M</td>
                      <td width="50px">SCta</td>
                      <td width="50px">SsC</td>
                      <td width="50px">SssC</td>
                      <td width="50px">SsssC</td>
                      <td width="50px">SssssC</td>
                      <td width="50px">Aux 1</td>
                      <td width="50px">Aux 2</td>
                      <td width="100px">Aux 3</td>
                      <td width="50px">C/A</td>
                      <td width="100px">Importe</td>
                      <td width="200px">Nombre Cuenta</td>
                      <td width="50px">Status</td>
                    </tr>
                  </table>
                  <div style="height:200px; width:1223px; overflow:auto; position:relative; vertical-align:top;">
                    <table id="tablaExtra" border="0" cellspacing="0" cellpadding="0" dataInfo="tablaDataExtra" radioWidth="23" keys="" fun="" NoRecordsMsg="No existen Asientos Contables para el Movimiento seleccionado">
                    </table>
                  </div>
              </FORM>
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
