<FORM name="frmDatos" id="frmDatos">
  <table cellspacing="1" cellpadding="1" border="0" width="100%" align="center" style="height:auto;">
    <tr>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
      <td height="100%">&nbsp;</td>
      <td rowspan="7" width="10%" height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td align="center" height="100%" class="titulo">Bitacora Operativa</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">
        <table width="90%" class="texto">
          <tr>
            <td width="45%">&nbsp;</td>
            <td width="5%">Fecha</td>
            <td>
              <input type="text" name="paramFecha" id="paramFecha" size="10" ref="conFecCon" fun="loadTxtElementX" theValue="fecha" next="formsLoaded" tipo="Fecha"/>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;
              <input type="button" name="cmdAceptar" id="cmdAceptar" value="Aceptar" class="boton" ref="conPriBitOpe" fun="loadTableElementSpecial" tabla="tblRegBitOpe" onclick="consultar(this,frmDatos,false);"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" name="cmdLimpiar" id="cmdLimpiar" value="Limpiar" class="boton" onclick="onButtonClickPestania('Operacion.BitacoraOperativa.PrincipalConsultaBitacoraOperativa','');"/>
            </td>
          </tr>
          <tr>
            <td align="center" colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">
              <table cellspacing="0" cellpadding="0" border="0">
                <tr class="cabeceras">
                  <td width="60" nowrap>Id&nbsp;Error</td>
                  <td width="60" nowrap>Folio</td>
                  <td width="70" nowrap>Tipo Clave</td>
                  <td width="100" nowrap>M&oacute;dulo Rutina</td>
                  <td width="150" nowrap>Nombre Rutina</td>
                  <td width="300" nowrap>Error Oracle</td>
                  <td width="300" nowrap> Descripci&oacute;n Error Oracle</td>
                  <td width="60" nowrap>Fecha</td>
                </tr>
              </table>
              <div style="height:150px; overflow:auto; position:relative; vertical-align:top;width:100%">
                <table id="tblRegBitOpe" border="0" cellspacing="0" cellpadding="0" dataInfo="tblRegBitDat">
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
    <tr>
      <td height="100%" align="center">&nbsp;</td>
    </tr>
    <tr>
      <td height="100%">&nbsp;</td>
    </tr>
  </table>
</FORM>
