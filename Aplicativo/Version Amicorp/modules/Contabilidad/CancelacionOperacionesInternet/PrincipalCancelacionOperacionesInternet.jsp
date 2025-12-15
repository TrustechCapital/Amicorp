<form name="frmDatosCancelacionOperacionesInternet" id="frmDatosCancelacionOperacionesInternet" onsubmit="">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td align="center" height="100%" class="titulo">Cancelacion de Operaciones de Internet Aceptadas por P&oacute;lizas</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="100%" class="texto">
          <tr>
            <td align="right" width="40%">&nbsp;</td>
            <td nowrap width="5%">Folio</td>
            <td align="left">
              <input type="text" name="txtFolio" id="txtFolio" size="10" tipo="Num" onblur="txtFolioParam.Folio = this.value;" required message="El Folio es un campo obligatorio"/>
            </td>
            <td align="left">&nbsp;</td>
          </tr>
          <tr>
            <td width="40%" colspan="4" align="center">
              <input type="text" name="txtFechaContable" id="txtFechaContable" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" style="visibility:hidden"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td align="center">&nbsp;
        <input type="button" value="Aceptar" name="cmdAceptar" id="cmdAceptar" class="boton" ref="conDatCanInsInt" fun="cancelaInstruccionInternet" param="txtFolioParam" onclick="loadElement(this);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="Limpiar" name="cmdLimpiar" id="cmdLimpiar" class="boton" onclick="onButtonClickPestania('Contabilidad.CancelacionOperacionesInternet.PrincipalCancelacionOperacionesInternet','')"/>
      </td>
    </tr>
  </table>
</form>
