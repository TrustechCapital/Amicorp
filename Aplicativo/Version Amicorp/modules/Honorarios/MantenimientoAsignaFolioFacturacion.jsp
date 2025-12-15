<FORM name="frmMantenimientoAsignaFolio" id="frmMantenimientoAsignaFolio" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" height="100%" class="titulo">Mantenimiento a Facturaci&oacute;n</td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%">
          <table width="90%" align="center" class="texto" border="0">
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="10%">
                <input type="radio" name="rdTipo" id="rdAsignaFolio" class="radio" onclick="muestraOcultaFolioFactura();"/>Asigna Folio
              </td>
              <td width="1%">&nbsp;</td>
              <td width="20%">
                <input type="radio" name="rdTipo" id="rdModificar" class="radio" onclick="muestraOcultaFolioFactura();"/>Modificar
              </td>
              <td width="15%">
                <input type="text" name="facNumContrato" id="facNumContrato" tipo="Num" size="5" style="visibility:hidden"/>
                <input type="text" name="facSecFactura" id="facSecFactura" size="3" maxlength="3" style="visibility:hidden"/>
                <input type="text" name="facNumFactura" id="facNumFactura" size="3" maxlength="3" style="visibility:hidden"/>
              </td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="10%">
                <input type="radio" name="rdTipo" id="rdCambiaFolio" class="radio" onclick="muestraOcultaFolioFactura();"/>Cambia Folio
              </td>
              <td width="1%">&nbsp;</td>
              <td width="20%">
                <input type="radio" name="rdTipo" id="rdRecuperaProvision" class="radio" onclick="muestraOcultaFolioFactura();"/>Recupera Provisi&oacute;n
              </td>
              <td width="15%">
                <input type="text" name="facStFactura" id="facStFactura" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="txtFolioOpera" id="txtFolioOpera" tipo="Num" size="5" style="visibility:hidden"/>
              </td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="10%">
                <input type="radio" name="rdTipo" id="rdSustituyeFolio" class="radio" onclick="muestraOcultaFolioFactura();"/>Sustituye Folio
              </td>
              <td width="1%">&nbsp;</td>
              <td width="20%">
                <input type="radio" name="rdTipo" id="rdDetalle" class="radio" onclick="muestraOcultaFolioFactura();"/>Detalle
              </td>
              <td width="15%">
                <input type="text" name="txtPuesto" id="txtPuesto" value="NO GERENTE" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
                <input type="text" name="txtClaveAnteriorConfirma" id="txtClaveAnteriorConfirma" tipo="AlphaNumeric" size="5" style="visibility:hidden"/>
              </td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="10%">
                <input type="radio" name="rdTipo" id="rdCancelaFolio" class="radio" onclick="muestraOcultaFolioFactura();"/>Cancela Folio
              </td>
              <td width="1%">&nbsp;</td>
              <td width="20%">
                <input type="radio" name="rdTipo" id="rdImprimir" class="radio" onclick="muestraOcultaFolioFactura();"/>Imprimir
              </td>
              <td width="15%">
                <input type="text" name="paramFideicomiso" id="paramFideicomiso" tipo="Num" size="5" style="visibility:hidden"/>
                <input type="text" name="paramSecuencial" id="paramSecuencial" size="3" maxlength="3" style="visibility:hidden"/>
                <input type="text" name="paramNumFactura" id="paramNumFactura" size="3" maxlength="3" style="visibility:hidden"/>
                <input type="text" id="refSP" name="refSP" style="visibility:hidden" size="10"/>
                <input type="text" id="refQry" name="refQry" value="getFactura" style="visibility:hidden" size="10"/>
                <input type="text" id="template" name="template" value="/xml/Reportes/Honorarios/Factura.xsl" style="visibility:hidden" size="10"/>
                <input type="text" id="nombreReporte" name="nombreReporte" value="Factura" style="visibility:hidden" size="10"/>
              </td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="10%">&nbsp;</td>
              <td width="1%">&nbsp;</td>
              <td>&nbsp;</td>
              <td width="15%">
                <a id="linkReporte" href="#" style="visibility:hidden">Archivo</a>
              </td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="10%">
                <div id="NoFolio">
                  No. Folio
                  <input type="text" name="txtSerie" id="txtSerie" size="3" maxlength="10"/>
                </div>
              </td>
              <td width="1%"><div id="Guion">-</div></td>
              <td>
                <input type="text" name="txtNoFolio" id="txtNoFolio" tipo="Num" size="10" maxlength="10"/>
              </td>
              <td width="15%">
                <input type="text" name="txtFolioFactura" id="txtFolioFactura" size="10" style="visibility:hidden"/>
              </td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;</td>
              <td width="10%">
                <div id="Motivo">
                  Motivo
                </div>
              </td>
              <td width="1%">&nbsp;</td>
              <td>
                <textarea name="txtMotivo" id="txtMotivo"></textarea>
              </td>
              <td width="15%">&nbsp;</td>
            </tr>
            <tr valign="middle">
              <td width="25%">&nbsp;
              </td>
              <td width="10%">
                <div id="ClaveAutorizacion">
                  Clave de Autorizaci&oacute;n
                </div>
              </td>
              <td width="1%">&nbsp;
              </td>
              <td>
                <input type="text" name="txtClaveAutorizacion" id="txtClaveAutorizacion" tipo="AlphaNumeric" size="10" maxlength="300"/>
              </td>
              <td width="15%">&nbsp;
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td width="60%" height="100%">&nbsp;</td>
      </tr>
      <tr>
        <td height="100%" align="center">
          <input type="BUTTON" value="Aceptar" name="cmdAceptar" class="boton" onclick="ejecutaAccionSegunCombo();"/>
          <input type="BUTTON" value="Cancelar" name="cmdCancelar" class="boton_x" onclick="cargaPrincipalFacturacion();"/>
        </td>
      </tr>
      <tr>
        <td height="100%">&nbsp;</td>
      </tr>
  </table>
</FORM>
