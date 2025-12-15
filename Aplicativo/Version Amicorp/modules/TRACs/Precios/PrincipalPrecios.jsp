<FORM name="frmDatos" id="frmDatos" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
        <td height="100%">&nbsp;</td>
        <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Carga de Precios</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table class="texto">
            <tr>
              <td>&nbsp;</td>
              <td nowrap colspan="5">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td nowrap>Fideicomiso</td>
              <td nowrap>
                <select size="1" name="fiso" id="fiso" ref="cmbFideicomisoTrac" fun="loadComboElement" keyValue="femiNumFideicomiso" theValue="femiNomFideicomiso"   param="cmbFideicomisoTrac" next="tipoPrecio"  required message="El Fideicomiso es un campo obligatorio"/>
              </td>
              <td nowrap>&nbsp;</td>
              <td nowrap>Tipo de Precio</td>
              <td nowrap>
                <select size="1" name="tipoPrecio" id="tipoPrecio" ref="conETDatInd" fun="loadComboElement" keyValue="eindIdSubindice" theValue="eindDescripcion"   param="indicesCombo662" next="tipoAccion"  required message="El Tipo de Precio es un campo obligatorio" onchange="cambiaCaptura(this);"/>
              </td>
              <td nowrap >
              </td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td nowrap colspan="5"><hr></td>
              <td>&nbsp;</td>
            </tr>
            
            <tr>
              <td colspan="7">
                    <table id="tablaPrecioTrac" style="visibility:hidden;" align="center" class="cuadroTexto">
                      <tr>
                        <td >&nbsp;</td>
                        <td nowrap colspan="5" align="center" style="font-weight:bold;" id = "lfideicomiso"></td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td nowrap colspan="5"><hr></td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td nowrap id="lnNaftracs"></td>
                        <td nowrap>
                          <input type="text" name="nNaftracs" id="nNaftracs" tipo="Money" size="10" maxlength="10"  required message="El Número de Naftracs un campo obligatorio"/>
                        </td>
                        <td>&nbsp;</td>
                        <td nowrap id="lprecioNaf"></td>
                        <td nowrap>
                          <input type="text" name="precioNaf" id="precioNaf" tipo="Money" size="10" maxlength="10"  required message="El Precio de Naftrac es un campo obligatorio"/>
                        </td>
                        <td nowrap>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td nowrap>&nbsp;</td>
                        <td nowrap>
                          &nbsp;
                        </td>
                        <td nowrap>&nbsp;</td>
                        <td nowrap>Fecha Aplicación</td>
                        <td nowrap>
                          <input type="text" id="afecha" name="afecha" maxlength="10" size="10" tipo="Fecha" required message="La Fecha Aplicación es un campo obligatorio"/>
                        </td>
                        <td nowrap >
                        </td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td nowrap colspan="5">&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                      <td colspan="7" align="center">
                        <input type="button" value="Aplicar Precio " name="cmdAplicar" class="boton" onclick="funAplicaPrecio();" ><!--style="visibility:hidden"/>-->
                        <input type="button" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="limpiar(frmDatos);" ><!--style="visibility:hidden"/>-->
                      </td>
                    </tr>
                    </table>
              </td>     
            </tr>  
            <tr>
              <td width="15%">&nbsp;</td>
              <td nowrap colspan="5">&nbsp;</td>
              <td width="10%">&nbsp;</td>
            </tr>
           
          </table>
        </td>
      </tr>
      <tr>
      <td colspan = 2 align="left">
        <div id="dvProcedimiento">
        </div>
      
      </td>
    </tr>
      <tr>
        <td width="50%" height="100%">&nbsp;</td>
      </tr>
      
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
